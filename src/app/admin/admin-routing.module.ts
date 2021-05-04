import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { AuthGuard } from "src/services/admin/auth/auth.guard";
import { AdminComponent } from "./admin.component";
import { AdminMainComponent } from "./modules/admin-main.component";
import { HomeComponent } from "./modules/home/home.component";
import { LoginComponent } from "./modules/login/login.component";
import { ProfileComponent } from "./modules/profile/profile.component";
import { StorageComponent } from "./modules/storage/storage.component";
import { TableCustomerComponent } from "./modules/table-customer/table-customer.component";
import { TableEmployeeComponent } from "./modules/table-employee/table-employee.component";
import { TableOrderComponent } from "./modules/table-order/table-order.component";
import { TableProductComponent } from "./modules/table-product/table-product.component";

const adminRoutes: Routes = [
  {
    path: 'admin',
    component: AdminComponent,
    children: [
      {
        path: 'login',
        component: LoginComponent,
      },
      {
        path: '',
        component: AdminMainComponent,
        children: [
          { path: '', component: HomeComponent, canActivate: [ AuthGuard ]  },
          { path: 'tableEmployee', component: TableEmployeeComponent, canActivate: [AuthGuard] },
          { path: 'tableProduct', component: TableProductComponent, canActivate: [AuthGuard] },
          { path: 'tableOrder', component: TableOrderComponent, canActivate: [AuthGuard] },
          { path: 'tableCustomer', component: TableCustomerComponent, canActivate: [AuthGuard] },
          { path: 'Profile', component: ProfileComponent, canActivate: [AuthGuard] },
          { path: 'Storage', component: StorageComponent },
        ]
      }
    ]
  }
];

@NgModule({
  imports: [ RouterModule.forRoot(adminRoutes) ],
  exports: [ RouterModule ]
})

export class AdminRoutingModule{

}