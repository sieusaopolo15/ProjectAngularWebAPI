import { Component, OnInit } from '@angular/core';
import { Form, FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { HttpService } from 'src/services/admin/http/http.service';
import * as CryptoJS from 'crypto-js';
import { MustMatch } from '../../login/MustMatch';
import { AlertService } from 'src/services/client/alert/alert.service';
import { environment } from 'src/environments/environment';
import { HttpErrorResponse } from '@angular/common/http';
import { Router } from '@angular/router';
import { DatePipe } from '@angular/common';
import { interval, Subscription } from 'rxjs';
import { CustomerDTO } from 'src/models/user';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html'
})
export class ProfileComponent implements OnInit {

  constructor(
    private httpService: HttpService,
    private alertService: AlertService,
    private fb: FormBuilder,
    private router: Router,
    private datepipe: DatePipe
  ) { }

  private url: string = environment.NEW_API;

  changePasswordForm: FormGroup = this.fb.group(
    {
      oldPassword: new FormControl('', [Validators.required, Validators.minLength(8)]),
      newPassword: new FormControl('', [Validators.required, Validators.minLength(8)]),
      confirmation: new FormControl('', [Validators.required, Validators.minLength(8)])
    },
    {
      validator: MustMatch('newPassword', 'confirmation')
    }
  );

  currentCustomer: any;

  changeInformationForm: FormGroup;

  private subscription: Subscription;

  

  ngOnInit(): void {
    this.getCurrentCustomer();
    let date = this.currentCustomer.birthDay;

    this.changeInformationForm = new FormGroup ({
      fullname: new FormControl(this.currentCustomer.name, [Validators.required]),
      email: new FormControl(this.currentCustomer.email, [Validators.required, Validators.minLength(8), Validators.pattern('^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}$')]),
      address: new FormControl(this.currentCustomer.address, [Validators.required, Validators.minLength(10)]),
      phoneNumber: new FormControl(this.currentCustomer.phone, [Validators.required, Validators.minLength(10), Validators.pattern('(84|0[3|5|7|8|9])+([0-9]{8})\\b')]),
      gender: new FormControl(this.currentCustomer.gender, [Validators.required]),
      birthDay: new FormControl(this.datepipe.transform(date, 'yyyy-dd-MM'), [Validators.required]),
    });
    
  }

  private getCurrentCustomer() {
    const customer = JSON.parse(CryptoJS.AES.decrypt(sessionStorage.getItem('customer-email'), 'passwordEncrypt').toString(CryptoJS.enc.Utf8));
    if (customer && customer.profileFlag == "true") {
      this.currentCustomer = customer;
      console.log(this.currentCustomer);
    }
  }

  changePasswordSubmit(form) {
    const value = {
      customerId: this.currentCustomer.id,
      oldPassword: form.oldPassword,
      newPassword: form.newPassword,
      confirmPassword: form.confirmation
    };

    this.httpService.post(this.url, "Customers/ChangePassword", value).subscribe(
      data => {
        this.alertService.Success("Đã đổi mật khẩu thành công ! Bạn phải đăng nhập lại");
        sessionStorage.clear();
        this.router.routeReuseStrategy.shouldReuseRoute = function () {
          return false;
        };
      },
      (error: HttpErrorResponse) => {
        console.log(error.message);
      }
    );
  }

  changeInformationSubmit(form) {
    let customer = {
      customerId: 0,
      fullName: "",
      email: "",
      address: "",
      phoneNumber: "",
      gender: "",
      birthDay: "",
    };
    this.httpService.put(this.url, "Customers/" + this.currentCustomer.id, this.setInformation(customer, form)).subscribe(
      data => {
        this.alertService.Success("Thay đổi thông tin đăng nhập thành công ! Đang thay đổi thông tin");
        this.subscription = interval(2000).subscribe((val) => {
          this.router.routeReuseStrategy.shouldReuseRoute = function () {
            return false;
          };
        })
      },
      (error: HttpErrorResponse) => {
        console.log(error.message);
      }
    );
  }

  private setInformation(customer, form) {
    customer.customerId = this.currentCustomer.id;
    customer.fullName = form.fullname;
    customer.email = form.email;
    customer.address = form.address;
    customer.phoneNumber = form.phoneNumber;
    customer.gender = form.gender;
    customer.birthDay = form.birthDay;
    console.log(customer);
    return customer;
  }

}
