import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TableCustomerComponent } from './table-customer.component';

describe('TableCustomerComponent', () => {
  let component: TableCustomerComponent;
  let fixture: ComponentFixture<TableCustomerComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ TableCustomerComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(TableCustomerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
