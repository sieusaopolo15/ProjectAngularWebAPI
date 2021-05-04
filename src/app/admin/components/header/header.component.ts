import { Component, OnInit } from '@angular/core';
import { HeaderService } from 'src/services/admin/header/header.service';
import * as CryptoJS from 'crypto-js';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
})
export class HeaderComponent implements OnInit {

  constructor(private headerService: HeaderService) { }

  currentTab: string = "Charts";
  fullname: string = "";

  //MOBILE BOOTSTRAP VARIABLES
    mmnTrigger: boolean = false;
    ulDisplay: boolean = false;

    componentDisplay: string = "";
    expandContent: string = "";
  //

  ngOnInit(): void {
    this.headerService.$userProfile.subscribe(res => {
      this.fullname = sessionStorage.getItem('employee-name');
    })
  }

  changeTab(value: string) {
    this.currentTab = value;
  }

  mobileMenuNavTrigger(): void {
    this.mmnTrigger = !this.mmnTrigger;
    this.ulDisplay = !this.ulDisplay;
  }

  expand(value): void {
    this.componentDisplay = value;

  }

  logout() {
    sessionStorage.removeItem('current-employee');
    sessionStorage.removeItem('employee-refresh-token');
    sessionStorage.removeItem('employee-name');
  }

}
