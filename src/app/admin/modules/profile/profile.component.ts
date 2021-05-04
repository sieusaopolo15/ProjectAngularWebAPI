import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import * as CryptoJS from 'crypto-js';
import { DatePipe } from '@angular/common';
import { EmployeeDTO } from 'src/models/employee';
import { HttpService } from 'src/services/admin/http/http.service';
import { environment } from 'src/environments/environment';
import { RoleDTO } from 'src/models/role';
import { HttpErrorResponse } from '@angular/common/http';
import { AlertService } from 'src/services/client/alert/alert.service';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.scss']
})
export class ProfileComponent implements OnInit {

  constructor(
    private httpService: HttpService,
    private fb: FormBuilder,
    private datepipe: DatePipe,
    private alertService: AlertService
  ) { }

  passwordForm: FormGroup = this.fb.group({
    oldPass: new FormControl('', [Validators.required]),
    newPass: new FormControl('', [Validators.required]),
    confirmation: new FormControl('', [Validators.required]),
  })

  profileForm: FormGroup;

  employee: EmployeeDTO;
  roles: RoleDTO;

  //API URL
  private url: string = environment.NEW_API;
  //

  ngOnInit(): void {
    this.getRoles();
    this.getProfile();
    this.profileForm = this.fb.group({
      fullName: new FormControl(this.employee.fullName, [Validators.required]),
      email: new FormControl(this.employee.email, [Validators.required, Validators.minLength(8), Validators.pattern('^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}$')]),
      address: new FormControl(this.employee.address, [Validators.required]),
      phoneNumber: new FormControl(this.employee.phoneNumber, [Validators.required, Validators.minLength(10), Validators.pattern('(84|0[3|5|7|8|9])+([0-9]{8})\\b')]),
      gender: new FormControl(this.employee.gender),
      birthDay: new FormControl(this.datepipe.transform(this.employee.birthDay, 'yyyy-dd-MM'), [Validators.required]),
      roleId: new FormControl(this.employee.roleId)
    });
  }

  private getRoles() {
    this.httpService.get(this.url, "Roles").subscribe(data => {
      this.roles = data;
    });
  }

  private getProfile() {
    let cipherText = sessionStorage.getItem('current-employee');
    if (cipherText) {
      this.employee = JSON.parse(CryptoJS.AES.decrypt(cipherText, 'secretkey').toString(CryptoJS.enc.Utf8));
    }
  }

  passwordChangeSubmit(value){
    console.log(value);
  }

  profileSubmit(value) {
    this.httpService.post(this.url, "Employees/" + this.employee.employeeId, value).subscribe(
      data => {
        this.alertService.Success("Thay đổi thông tin cá nhân thành công !");
      },
      (error: HttpErrorResponse) => {
        console.log(error.message);
        this.alertService.Error("Đã xảy ra trong quá trình truyền dữ liệu");
      }
    );
    console.log(value);
  }

  

}
