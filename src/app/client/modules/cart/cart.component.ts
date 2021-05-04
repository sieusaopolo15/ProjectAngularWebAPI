import { Component, OnInit } from '@angular/core';
import { environment } from 'src/environments/environment';
import { HttpService } from '../../../../services/client/http/http.service';
import { Cart } from '../../../../models/cart';
import { Product } from '../../../../models/product';
import * as CryptoJS from 'crypto-js';

@Component({
  selector: 'app-cart',
  templateUrl: './cart.component.html',

})
export class CartComponent implements OnInit {
  
  product: Map<Product, Cart> = new Map();
  url: string = environment.NEW_API;
  total: number = 0;

  constructor(private httpService: HttpService) { }

  ngOnInit(): void {
    localStorage.setItem('breadcrumb', 'Giỏ hàng');
    this.getItems();
  }

  increase(item) {
    if (this.product.size != 0) {
      let amount: Cart = this.product.get(item);
      amount.amount++;
      this.total += amount.price;

      amount.total = amount.amount * amount.price;
      this.product.set(item, amount);
    }
  }
  decrease(item) {
    if (this.product.size != 0) {
      let amount: Cart = this.product.get(item);
      amount.amount--;
      if (amount.amount < 1) {
        amount.amount = 1;
      }
      else {
        this.total -= amount.price;
      }
      amount.total = amount.amount * amount.price;
      this.product.set(item, amount);
    }
  }

  private getItems() {
    let email = JSON.parse(CryptoJS.AES.decrypt(sessionStorage.getItem('customer-email'), 'passwordEncrypt').toString(CryptoJS.enc.Utf8));
    if (email != "undefined" && email) {
      let array: Array<Cart> = JSON.parse(sessionStorage.getItem(email.email)); 
        if (array) {
          for (let i = 0; i < array.length; i++){
            this.httpService.getUrl(this.url, "Products/" + array[i].productId).subscribe(data => {
              this.product.set(data, array[i]);
              this.total += array[i].total;
            });
          }
        }
    }
    console.log(this.product);
  }

  remove(item, amount) {
    this.total -= amount.total;
    this.product.delete(item);
    this.updateCart();
  }

  updateCart() {
    let jsonObject: Array<Cart> = [];
    let email = JSON.parse(CryptoJS.AES.decrypt(sessionStorage.getItem('customer-email'), 'passwordEncrypt').toString(CryptoJS.enc.Utf8));

    this.product.forEach((value, key) => {
      jsonObject.push(value);
    });
    sessionStorage.setItem(email.email, JSON.stringify(jsonObject));
  }

}
