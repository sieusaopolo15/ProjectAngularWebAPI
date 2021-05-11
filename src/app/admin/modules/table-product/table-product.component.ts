import { HttpErrorResponse } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { environment } from 'src/environments/environment';
import { Category } from 'src/models/category';
import { Product } from 'src/models/product';
import { SupplierDTO } from 'src/models/supplier';
import { AlertService } from 'src/services/client/alert/alert.service';
import { HttpService } from '../../../../services/admin/http/http.service';

@Component({
  selector: 'app-table-product',
  templateUrl: './table-product.component.html',
  styleUrls: ['table-product.component.css']
})
export class TableProductComponent implements OnInit {

  private url: string = environment.NEW_API;

  constructor(
    private fb: FormBuilder,
    private httpService: HttpService,
    private alertSerivce: AlertService
  ) { }

  //INITIAL
  productData: Array<Product> = [];
  suppliers: Array<SupplierDTO> = [];
  categories: Array<Category> = [];
  fileName: string = "";
  imgSrc: any = "https://drive.google.com/uc?export=view&id=1paIUZyOqIW5ZllHXE0b6r-kZWJHQMQYR";
  display: string = "none";
  display2: string = 'none';
  
  //INITIAL

  //TRIGGER INITIAL
  currentProduct: any;
  currentImgSrc: any;
  //

  //FORMS
  addProductForm: FormGroup = this.fb.group({
    productId: new FormControl('', [Validators.required]),
    images: new FormControl(this.fileName, [Validators.required]),
    productName: new FormControl('', [Validators.required, Validators.minLength(10)]),
    price: new FormControl('', [Validators.required, Validators.minLength(5)]),
    unit: new FormControl('', [Validators.required]),
    status: new FormControl(true),
    categoryId: new FormControl('', [Validators.required]),
    descriptions: new FormControl('', [Validators.required]),
    supplier: new FormControl([], [Validators.required]),
  });

  adjustProductForm: FormGroup;
  //

  //PAGINATION
  totalRecords: Number;
  itemsPerPage: number = 10;
  page: Number = 1;
  //
  
  ngOnInit(): void {
    this.getProduct();
    this.getSupplier();
    this.getCategories();
  }

  onFileSelected(event) {
    if(event.target.files.length > 0) 
    {
      const file = event.target.files[0];
      const fileReader = new FileReader();
      fileReader.onload = e => this.imgSrc = fileReader.result;
      fileReader.readAsDataURL(file);

      this.imgSrc = event.target.files[0].name;
      this.fileName = event.target.value;

    }
  }

  numberOnly(event): boolean{
    const charCode = (event.which) ? event.which : event.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
      return false;
    }
    return true;
  }

  private getSupplier() {
    this.httpService.get(this.url, "Suppliers").subscribe(data => {
      this.suppliers = data;
    });
  }

  private getProduct() {
    this.httpService.get(this.url, "Products").subscribe(data => {
      this.productData = data;
    });
  }

  private getCategories() {
    this.httpService.get(this.url, "Categories").subscribe(data => {
      this.categories = data;
    });
  }

  openModal() {
    this.display = 'block';
  }
  
  openModal2(product) {
    this.display2 = 'block';
    this.currentProduct = product;
    this.currentImgSrc = "https://drive.google.com/uc?export=view&id=" + product.images;

    this.adjustProductForm = this.fb.group({
      productId: new FormControl(product.productId),
      productName: new FormControl(product.productName, [Validators.required, Validators.minLength(10)]),
      price: new FormControl(product.price, [Validators.required, Validators.minLength(5)]),
      unit: new FormControl(product.unit, [Validators.required]),
      status: new FormControl(true),
      categoryId: new FormControl(product.categoryId, [Validators.required]),
      descriptions: new FormControl(product.descriptions, [Validators.required, Validators.minLength(10)]),
      supplier: new FormControl(product.supplies, [Validators.required]),
    });
  }
  
  closeModal() {
    this.display = 'none';
    this.currentProduct = null;
  }

  closeModal2() {
    this.display2 = 'none';
  }

  setAddValue(value) {
    this.addProductForm.patchValue({
      productId: value.productId,
      productName: value.productName,
      price: value.price,
      unit: value.unit,
      descriptions: value.descriptions,
      status: true,
      categoryId: value.categoryId,
      supplier: value.supplier,
    });
  }

  submit(value) {
    if (confirm("Bạn chắc chắn muốn thêm sản phẩm này ?")) {
      const formData = new FormData();

      //this.setAddValue(value);

      formData.append('productId', value.productId);
      formData.append('productName', value.productName);
      formData.append('price', value.price);
      formData.append('unit', value.unit);
      formData.append('descriptions', value.descriptions);
      formData.append('status', value.status);
      formData.append('categoryId', value.categoryId);
      formData.append('supplies', value.supplier);
      formData.append('Image', this.fileName);

      this.httpService.formDataPost(this.url, "Products", formData).subscribe(
        data => {
          console.log(data);
          this.alertSerivce.Success("Đã thêm sản phẩm thành công !");
        },
        (error: HttpErrorResponse) => {
          console.log(error.message);
          this.alertSerivce.Error("Đã xảy ra lỗi trong quá trình thêm sản phẩm !");
        }
      );
	  }
  }

  adjust(value) {
    
  }

}
