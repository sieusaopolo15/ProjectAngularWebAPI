import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { environment } from 'src/environments/environment';
import { Product } from 'src/models/product';
import { HttpService } from '../../../../services/admin/http/http.service';

@Component({
  selector: 'app-table-product',
  templateUrl: './table-product.component.html',
})
export class TableProductComponent implements OnInit {

  private url: string = environment.NEW_API;

  constructor(
    private fb: FormBuilder,
    private httpService: HttpService
  ) { }

  //INITAL
  productData: Array<Product> = [];
  display: string = "none";
  //

  //FORMS
  addProductForm: FormGroup = this.fb.group({

  });
  //

  //PAGINATION
  totalRecords: Number;
  itemsPerPage: number = 10;
  page: Number = 1;
  //


  ngOnInit(): void {
    this.getProduct();
  }

  private getProduct() {
    this.httpService.get(this.url, "Products").subscribe(data => {
      this.productData = data;
    });
  }

  openModal() {
    this.display = 'block';
  }
  
  closeModal() {
    this.display = 'none';
  }

  submit(value) {
    
  }

}
