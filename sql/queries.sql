--TOP 10 Cutomers based on Sales
select
	d.customer_name as "Customer Name"
	,SUM(f.amount) as "Sales"
from fact_sales f
	left join dim_customer d 
		on f.customer_id = d.customer_id
group by
	d.customer_name
order by
	SUM(f.amount) desc
limit 10


--Most Profitable products
select
	d.sub_category  as "Product Sub-Category"
	,SUM(f.profit) as "Profit"
	,SUM(f.amount) as "Sales" 
from fact_sales f
	left join dim_product d 
		on f.product_id  = d.product_id
group by
	d.sub_category
order by
	SUM(f.profit) desc
limit 10

--Avg Order Value
select
	avg(ordr_sls.amount)
from
(
	select 
		f.order_id
		,sum(f.amount) as "amount"
	from fact_sales f
	group by f.order_id
) as ordr_sls
