import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { environment } from 'src/environments/environment';
import { HttpService } from '../../../../services/client/http/http.service';
import { Product } from '../../../../models/product';

@Component({
  selector: 'app-product-detail',
  templateUrl: './product-detail.component.html',
})
export class ProductDetailComponent implements OnInit {

  constructor(
    private activatedRoute: ActivatedRoute,
    private httpService: HttpService
  ) { }

  product: Product;
  amount: number = 0;

  ngOnInit(): void {
    this.getProductDetail();
  }

  increase() {
    this.amount++;
  }
  decrease() {
    this.amount--;
    if (this.amount <= 0) {
      this.amount = 0;  
    }
  }

  private getProductDetail() {
    let id = this.activatedRoute.snapshot.paramMap.get('id');
    console.log(id);
    this.httpService.getUrl(environment.NEW_API, "Products/" + id).subscribe(data => {
      this.product = data;
      console.log(this.product);
    });
  }

}
