import { Component, Inject, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { Observable } from 'rxjs';
import { MustMatch } from 'src/app/client/modules/login/MustMatch';
import { environment } from 'src/environments/environment';
import { HttpService } from '../../../../services/admin/http/http.service';
import { EmployeeDTO } from '../../../../models/employee';
import { RoleDTO } from 'src/models/role';
import { DatePipe, DOCUMENT } from '@angular/common';
import { HttpErrorResponse } from '@angular/common/http';
import { AlertService } from 'src/services/client/alert/alert.service';
import { THIS_EXPR } from '@angular/compiler/src/output/output_ast';

@Component({
  selector: 'app-table-employee',
  templateUrl: './table-employee.component.html',
})
export class TableEmployeeComponent implements OnInit {

  constructor(
    private httpService: HttpService,
    private fb: FormBuilder,
    private datepipe: DatePipe,
    private alertService: AlertService,
    @Inject(DOCUMENT) private _document: Document
  ) {

  }

  //PAGINATION
  totalRecords: Number;
  itemsPerPage: number = 5;
  page: Number = 1;
  //

  employeeData: Observable<EmployeeDTO>;
  display: string = "none";
  display2: string = 'none';

  addEmployeeForm: FormGroup = this.fb.group(
    {
      firstname: new FormControl('', [Validators.required, Validators.minLength(7)]),
      lastname: new FormControl('', [Validators.required]),
      gender: new FormControl('', [Validators.required]),
      birthDay: new FormControl('', [Validators.required]),
      email: new FormControl('', [Validators.required, Validators.pattern('^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}$')]),
      phoneNumber: new FormControl('', [Validators.required, Validators.pattern('(84|0[3|5|7|8|9])+([0-9]{8})\\b')]),
      address: new FormControl('', [Validators.required, Validators.minLength(12)]),
      password: new FormControl('', [Validators.required, Validators.minLength(8)]),
      confirmation: new FormControl('', [Validators.required]),
      roles: new FormControl('')
    },
    {
      validator: MustMatch('confirmation', 'password')
    }
  );
  
  adjustEmployeeForm: FormGroup = this.fb.group(
    {
      fullname: new FormControl('', [Validators.required, Validators.minLength(12)]),
      gender: new FormControl('', [Validators.required]),
      birthDay: new FormControl('', [Validators.required]),
      email: new FormControl('', [Validators.required, Validators.pattern('^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}$')]),
      phoneNumber: new FormControl('', [Validators.required, Validators.pattern('(84|0[3|5|7|8|9])+([0-9]{8})\\b')]),
      address: new FormControl('', [Validators.required, Validators.minLength(12)]),
      roles: new FormControl('')
    },
  );;
  

  roles: Array<RoleDTO> = [];
  
  private url: string = environment.NEW_API;

  employee: any;
  male: boolean = false;
  female: boolean = false;

  ngOnInit(): void {
    this.getEmployee();
    this.getRoles();
  }

  private reloadPage() {
    this._document.defaultView.location.reload();
  }

  private getEmployee() {
    this.httpService.get(this.url, "Employees").subscribe(data => {
      this.employeeData = data;
    });
  }

  private getRoles() {
    this.httpService.get(this.url, "Roles").subscribe(data => {
      this.roles = data;
    });
  }

  openModal(): void{
    this.display = 'block';
  }
  closeModal(): void{
    this.display = 'none';
  }

  openModal2(employee) {
    this.employee = employee;
    if (this.employee.gender) {
      this.male = true;
      this.female = false;
    }
    else {
      this.female = true;
      this.male = false;
    }
    this.adjustEmployeeForm = this.fb.group(
      {
        employeeId: new FormControl(this.employee.employeeId),
        fullname: new FormControl(this.employee.fullName, [Validators.required, Validators.minLength(12)]),
        email: new FormControl(this.employee.email, [Validators.required, Validators.pattern('^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}$')]),
        address: new FormControl(this.employee.address, [Validators.required, Validators.minLength(12)]),
        phoneNumber: new FormControl(this.employee.phoneNumber, [Validators.required, Validators.pattern('(84|0[3|5|7|8|9])+([0-9]{8})\\b')]),
        gender: new FormControl(this.employee.gender, [Validators.required]),
        birthDay: new FormControl(this.datepipe.transform(this.employee.birthDay, 'yyyy-MM-dd'), [Validators.required]),
        roleId: new FormControl(this.employee.roleId)
      },
    );

    this.display2 = 'block';
  }
  closeModal2() {
    this.display2 = 'none';
    this.employee = null;
  }

  submitAdjust(value): void{
    console.log(value);
    if (confirm("B???n c?? ?????ng ?? v???i nh???ng thay ?????i cho nh??n vi??n n??y ?")) {
      this.httpService.post(this.url, "Employees/ChangeInfo/" + this.employee.employeeId, value).subscribe(data => {
        this.alertService.Success("???? thay ?????i th??nh c??ng ! vui l??ng t???i l???i trang ");
        this.reloadPage();
      },
        (error: HttpErrorResponse) => {
          console.log(error.message);
          console.log(error.headers);
        }
      );
    }
  }
  
  employeeBlockTrigger(employee) {
    if (confirm("B???n c?? ch???c ch???n v??? quy???t ?????nh c???a m??nh ?")) {
      if (!employee.isBlocked) {
        console.log("blocked");
        this.httpService.post(this.url, "Employees/Block", employee.employeeId).subscribe(
          data => {
            this.alertService.Success("Ch???n nh??n vi??n v???i m?? l??" + employee.employeeId + " th??nh c??ng !");
            this.reloadPage();
          },
          (error: HttpErrorResponse) => {
            console.log(error.message);
            this.alertService.Error("???? x???y ra l???i v???i ch???c n??ng ch???n");
          }
        );
      }
      else {
        this.httpService.post(this.url, "Employees/UnBlock", employee.employeeId).subscribe(
          data => {
            this.alertService.Success("G??? nh??n vi??n v???i m??: " + employee.employeeId + " th??nh c??ng !");
          },
          (error: HttpErrorResponse) => {
            console.log(error.message);
            this.alertService.Error("???? x???y ra l???i v???i ch???c n??ng g??? ch???n");
          }
        );
      }
      
    }
  }
  
  addEmployee(form){
	if(confirm("?????ng ?? th??m nh??n vi??n v???i c??c th??ng tin n??y ?")){
		let employee = {
			fullName: form.firstname + " " + form.lastname,
			email: form.email,
			address: form.address,
			phoneNumber: form.phoneNumber,
			passWord: form.confirmation,
			gender: form.gender,
			birthDay: form.birthDay,
			roleId: form.roles
		}
		console.log(employee);
		this.httpService.post(this.url, "Employees/Register", employee).subscribe(
			data => {
				this.alertService.Success("Th??m nh??n vi??n th??nh c??ng");
				this.display = 'none';
			},
			(error: HttpErrorResponse) => {
				this.alertService.Error("???? x???y ra l???i trong qu?? tr??nh th??m nh??n vi??n");
				console.log(error.message);
			}
		);
	}
  }
}
