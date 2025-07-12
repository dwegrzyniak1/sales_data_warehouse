create table dim_customer (
	customer_id int primary key
	,customer_name varchar(255)
	,state varchar(32)
	,city varchar(32)
)

create table dim_product (
	product_id int primary key
	,sub_category varchar(127)
	,category varchar(127)
)

create table dim_date (
	date_id int primary key
	,date date
	,year int
	,quarter int
	,month int
)

create table dim_location (
	location_id int primary key
	,payment_mode varchar(127)
)

create table dim_payment_mode (
	payment_mode_id int primary key
	,payment_mode varchar(127)
)

create table fact_sales (
	id int primary key
	,order_id varchar(15)
	,customer_id int references dim_customer(customer_id)
	,location_id int references dim_location(location_id)
	,product_id int references dim_product(product_id)
	,order_date_id int references dim_date(date_id)
	,payment_mode_id int references dim_payment_mode(payment_mode_id)
	,sales_amount numeric(15, 2)
	,quantity numeric(15, 2)
	,profit numeric(15, 2)
)

