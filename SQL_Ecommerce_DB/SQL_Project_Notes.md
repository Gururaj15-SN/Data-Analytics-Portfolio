# SQL E-commerce Database

## Database
- Database name: `ecommerce_db`
- SQL dialect: MySQL 8.0
- Source: exported MySQL dump (`Dump20261017.sql`)

## Tables and relationships
- `customers` — customer details; primary key `customer_id`.
- `orders` — each order belongs to one customer through `customer_id`.
- `products` — product catalog; primary key `product_id`.
- `order_items` — line items connect orders and products through `order_id` and `product_id`.
- `payments` — payment records connect to orders through `order_id`.

## Relationship overview
- `customers` 1-to-many `orders`
- `orders` 1-to-many `order_items`
- `products` 1-to-many `order_items`
- `orders` 1-to-many `payments`

## Note
The provided SQL dump contains schema definitions and sample data, but no separate analysis-query section was included. `Queries.sql` preserves the supplied dump. If your assignment requires analytical SELECT queries, add those to the end of the file or provide the report so they can be included accurately.
