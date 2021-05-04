import { Component, OnInit } from '@angular/core';
import { HistoryDTO } from '../../../../models/history';
import * as CryptoJS from 'crypto-js';
import { HttpService } from '../../../../services/client/http/http.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-history',
  templateUrl: './history.component.html',
  styleUrls: ['./history.component.scss']
})
export class HistoryComponent implements OnInit {

  orders: Array<HistoryDTO> = [];
  statusCancle: Array<{}> = [];
  statusNotConfirm: Array<{}> = [];
  statusHasConfirmed: Array<{}> = [];
  statusHasDelivered: Array<{}> = [];
  
  private customerId: number = 0;
  private url: string = environment.NEW_API;
  

  constructor(private httpService: HttpService) { }

  ngOnInit(): void {
    this.getCustomerId();
    this.getHistory();
  }
  private getCustomerId() {
    this.customerId = JSON.parse(CryptoJS.AES.decrypt(sessionStorage.getItem('customer-email'), 'passwordEncrypt').toString(CryptoJS.enc.Utf8)).id;
  }

  private getHistory() {
    if (this.customerId != 0) {
      this.httpService.getUrl(this.url, "Orders/GetOrdersByCustomerId/" + this.customerId).subscribe(data => {
        this.orders = data;
        console.log(this.orders);
        this.orders.forEach(o => {
          o.orderStatus.forEach((status: { date: string, orderId: number, status: {}, statusId: number }) => {
            if (status.statusId == 2) {
              this.statusNotConfirm.push(o);
            }
            else if(status.statusId == 3) {
              this.statusHasConfirmed.push(o);
              this.statusNotConfirm.pop();
            }
            else if(status.statusId == 4) {
              this.statusHasDelivered.push(o);
            }
            else if (status.statusId == 1) {
              this.statusCancle.push(o);
            }
          });
        });
        console.log(this.orders);
      });
    }

  }

}
