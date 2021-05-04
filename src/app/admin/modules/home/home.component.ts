import { Component, OnInit } from '@angular/core';
import { IMyOptions } from 'ng-uikit-pro-standard';
import { environment } from 'src/environments/environment';
import { HttpService } from 'src/services/admin/http/http.service';

@Component({
  selector: 'app-admin-home',
  templateUrl: './home.component.html',
})
export class HomeComponent implements OnInit {

  private url: string = environment.NEW_API;

  constructor(private httpService: HttpService) { }

  //VARIABLES
  start: string = "2021-04-01";
  end: string = "2021-05-31";
  saleData = [];
  test: string = "2021-04-01";
  //

  ngOnInit(): void {
    this.httpService.get(this.url, "ThongKe/ThongKeDoanhThuTheoLoai?startDate=" +  this.start + "&endDate=" + this.end).subscribe(
      data => {
        this.saleData = JSON.parse(data);
      },
    );
  }
 

  dateButtonClick(startDate, endDate) {
    this.start = startDate;
    this.end = endDate;
    if (startDate && endDate) {
      this.httpService.get(this.url, "ThongKe/ThongKeDoanhThuTheoLoai?startDate=" + this.start + "&endDate=" + this.end).subscribe(data => {
        this.saleData = JSON.parse(data);
      });
    }
  }

}
