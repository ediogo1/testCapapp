using { my.app as db } from '../db/schema';

service CatalogService {
  entity Books as projection on db.Books;
  entity Customers as projection on db.Customers;
  entity Orders as projection on db.Orders;
  entity OrderItems as projection on db.OrderItems;
}
