-- 1. how many types of products made by company "Stonks&Co" exist in the products list

SELECT COUNT(product.name) 
FROM company JOIN product 
ON company.company_id = product.fk_company_id 
WHERE company.name = 'Stonks&Co';

-- 2. how many types of products products were in invoices at March 2022

SELECT COUNT(product.name) 
FROM product JOIN orders
ON product.product_id = orders.fk_product_id
JOIN invoice
ON orders.fk_invoice_id = invoice.invoice_id
WHERE invoice.invoice_date LIKE '2022-03%';

-- 3. how many types of products were paid between 11.03.22 and 14.03.22

SELECT COUNT(product.name) 
FROM product JOIN orders
ON product.product_id = orders.fk_product_id
JOIN invoice
ON orders.fk_invoice_id = invoice.invoice_id
JOIN payment
ON invoice.fk_payment_id = payment.payment_id
WHERE payment.payment_date BETWEEN '2022-03-11%' AND '2022-03-14%';


-- 4. how many types of products were sent with "EasternUnion" payment form

SELECT COUNT(product.name) 
FROM product JOIN orders
ON product_id = orders.fk_product_id
JOIN invoice
ON orders.fk_invoice_id = invoice.invoice_id
JOIN payment
ON invoice.fk_payment_id = payment.payment_id
JOIN payment_form
ON payment.fk_payment_form = payment_form.payment_form_id
WHERE payment_form.payment_form_name = 'EasternUnion';

-- 5. with which kind of discount the product type from Russia was bought

SELECT region.name as "Company Region", discount.special_offer_name as "Discount Name"
FROM region JOIN company
ON region.region_id = company.fk_region_id
JOIN product
ON company.company_id = product.fk_company_id
JOIN orders 
ON product.product_id = orders.fk_product_id
JOIN invoice 
ON orders.fk_invoice_id = invoice.invoice_id
JOIN customer
ON customer.customer_id = invoice.fk_customer_id
JOIN discount
ON customer.fk_discount_id = discount.discount_id
WHERE region.name = 'Russia';

-- 6. when product types with discount "Favourite Customer Sale" were paid

SELECT discount.special_offer_name as "Discount Name", payment.payment_date as "Payment date"
FROM discount JOIN customer
ON customer.fk_discount_id = discount.discount_id
JOIN invoice
ON customer.customer_id = invoice.fk_customer_id
JOIN payment
ON invoice.fk_payment_id = payment.payment_id
WHERE discount.special_offer_name = 'Favourite Customer Sale';

-- Bonus SQL Queries

-- 1. show how many products (with name of the firm) each customer bought

SELECT company.name as "Company Name", product.name as "Product", orders.product_amount as "Amount of ordered products", customer.name as "Customer"
FROM company JOIN product 
ON company.company_id = product.fk_company_id
JOIN orders 
ON product.product_id = orders.fk_product_id
JOIN invoice 
ON orders.fk_invoice_id = invoice.invoice_id
JOIN customer
ON invoice.fk_customer_id = customer.customer_id;

-- 2. show when and with which payment system each customer paid his/her invoice and with which shipment company it was sent
SELECT customer.name as "Customer", payment.payment_date as "Payment date", payment_form.payment_form_name as "Payment service", shipment_company.sc_name as "Shipment company"
FROM customer JOIN invoice 
ON customer.customer_id = invoice.fk_customer_id 
JOIN payment 
ON invoice.fk_payment_id = payment.payment_id 
JOIN payment_form 
ON payment.fk_payment_form = payment_form.payment_form_id 
JOIN shipment 
ON shipment.shipment_id = payment.fk_shipment_id 
JOIN shipment_company 
ON shipment_company.shipment_company_id = shipment.fk_shipment_company_id;