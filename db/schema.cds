using { cuid, managed } from '@sap/cds/common';

namespace my.app;

entity Books : cuid {
  key ID : UUID;
  title : String(111);
  author : String(111);
  stock : Integer;
  price : Decimal(9,2);
  currency : String(3);
}

entity Customers : cuid {
  key ID : UUID;
  firstName : String(50);
  lastName : String(50);
  email : String(100);
  phone : String(20);
  address : String(255);
}

entity Orders : cuid, managed {
  key ID : UUID;
  customer : Association to Customers;
  orderDate : DateTime;
  totalAmount : Decimal(10,2);
  currency : String(3);
  items : Composition of many OrderItems on items.order = $self;
}

entity OrderItems : cuid {
  key ID : UUID;
  order : Association to Orders;
  book : Association to Books;
  quantity : Integer;
  price : Decimal(9,2);
  currency : String(3);
}
