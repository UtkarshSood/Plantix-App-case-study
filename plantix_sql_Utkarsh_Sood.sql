 
 
 
  select * from [login_logs] 

  select * from [sales_orders] 

  select * from [sales_orders_items]

  select * into [sales_orders and sales orders items] from [sales_orders] inner join [sales_orders_items] on [order_id] = [fk_order_id]
 
 select * from [sales_orders and sales orders items]
  
---login_logs
     select * from [login_logs] 

	select  count(distinct[user_id]) as 'Total Users in July 2021 and 2022 '  from [login_logs]

	select  count(distinct[user_id]) as 'Total Users in July 2021 ' from [login_logs] where year([login_time]) = 2021
	
	select  count(distinct[user_id]) as 'Total Users in July 2022' from [login_logs] where year([login_time]) = 2022

	select count(distinct[user_id]) as 'old users from July 2021 in July 2022' from [login_logs] where [user_id] in (select distinct[user_id] from [login_logs] where year([login_time]) = 2021) and year([login_time]) =  2022

	select count(distinct[user_id]) as 'new users in July 2022 ' from [login_logs] where [user_id] not in (select distinct[user_id] from [login_logs] where year([login_time]) = 2021) and year([login_time]) =  2022

	
	select day([login_time]) as 'Day', count(distinct[user_id]) as 'Users per day in July 2021' from(select [user_id] , [login_time] from [login_logs] where year([login_time]) = 2021) as x group by day([login_time])
    select avg([Users per day in July 2021]) as 'avg users per day in July 2021' from (select day([login_time]) as 'Day', count(distinct[user_id]) as 'Users per day in July 2021' from(select [user_id] , [login_time] from [login_logs] where year([login_time]) = 2021) as x group by day([login_time])) as y


	select day([login_time]) as 'Day', count(distinct[user_id]) as 'Users per day in July 2022' from(select [user_id] , [login_time] from [login_logs] where year([login_time]) = 2022) as x group by day([login_time])
	select avg([Users per day in July 2022]) as 'avg users per day in July 2022' from (select day([login_time]) as 'Day', count(distinct[user_id]) as 'Users per day in July 2022' from(select [user_id] , [login_time] from [login_logs] where year([login_time]) = 2022) as x group by day([login_time])) as y

	select * from [sales_orders and sales orders items]
	select avg([Total Revenue]) as 'Avg Revenue per user in July 2021' from (select [fk_buyer_id] , Sum([Revenue]) as 'Total Revenue' from (select [fk_buyer_id], [order_quantity_accepted] * [rate] as 'Revenue' from [sales_orders and sales orders items] where year([creation_time]) = 2021) as x group by [fk_buyer_id]) as y
	select avg([Total Revenue]) as 'Avg Revenue per user in July 2022' from (select [fk_buyer_id] , Sum([Revenue]) as 'Total Revenue' from (select [fk_buyer_id], [order_quantity_accepted] * [rate] as 'Revenue' from [sales_orders and sales orders items] where year([creation_time]) = 2022) as x group by [fk_buyer_id]) as y

	select avg([No of logins]) as 'AVG no of logins in July,2021'from (Select [user_id], count([login_log_id]) as 'No of logins' from (select * from [login_logs]  where year([login_time]) = 2021)as x group by [user_id]) as y
	select avg([No of logins]) as 'AVG no of loging in July, 2022' from(Select [user_id], count([login_log_id]) as 'No of logins' from (select * from [login_logs]  where year([login_time]) = 2022)as x group by [user_id]) as y


	
      select count([login_log_id]) as 'No of logins' from [login_logs] 

      select count([login_log_id]) as 'No of logins in July 2021' from [login_logs] where year([login_time]) = 2021
      select count([login_log_id]) as 'No of logins in July 2022' from [login_logs] where year([login_time]) = 2022
      select (((select count([login_log_id]) as 'No of logins in July 2022' from [login_logs] where year([login_time]) = 2022) - (select count([login_log_id]) as 'No of logins in July 2021' from [login_logs] where year([login_time]) = 2021))*100 / (select count([login_log_id]) as 'No of logins in July 2021' from [login_logs] where year([login_time]) = 2021)) as 'Percentage increase in logins'

--- sales_order	
    select count(distinct[order_id])  as 'Total Orders' from [sales_orders]

    select count(distinct[order_id])  as 'Total Orders  in July 2021' from [sales_orders] where year([creation_time]) = 2021

     select count(distinct[order_id])  as 'Total Orders in July 2022' from [sales_orders] where year([creation_time]) = 2022

     select (((select count(distinct[order_id])  as 'Total Orders in July 2022' from [sales_orders] where year([creation_time]) = 2022) - (select count(distinct[order_id])  as 'Total Orders in July 2021' from [sales_orders] where year([creation_time]) = 2021))*100  / cast((select count(distinct[order_id])  as 'Total Orders  in July 2021' from [sales_orders] where year([creation_time]) = 2021) as float)) as 'Percentage increase in Orders'

     Select count(distinct[fk_buyer_id]) as 'Total Buyers' from [sales_orders]

     Select count(distinct[fk_buyer_id]) as 'Total Buyers in July 2021' from [sales_orders] where year([creation_time]) = 2021

    Select count(distinct[fk_buyer_id]) as 'Total Buyers in july 2022' from [sales_orders] where year([creation_time]) = 2022

    SELECT (((Select count(distinct[fk_buyer_id]) as 'Total Buyers' from [sales_orders] where year([creation_time]) = 2022) - (Select count(distinct[fk_buyer_id]) as 'Total Buyers' from [sales_orders] where year([creation_time]) = 2021))*100 / cast((Select count(distinct[fk_buyer_id]) as 'Total Buyers' from [sales_orders] where year([creation_time]) = 2021)as float) ) as 'Percenatage increase in Buyers'

    select count(distinct[fk_buyer_id]) as 'Buyers who were in July 2021 as well as in July 2022' from [sales_orders] where year([creation_time]) = 2022 and [fk_buyer_id] in (select distinct[fk_buyer_id] from [sales_orders] where year([creation_time]) = 2021)

     select count(distinct[fk_buyer_id]) as 'New Buyers in July 2022 who were not in July 2021' from [sales_orders] where year([creation_time]) = 2022 and [fk_buyer_id] not in (select distinct[fk_buyer_id] from [sales_orders] where year([creation_time]) = 2021)
--- Depot
    select count(distinct[fk_depot_id]) as 'Depot'  from [sales_orders]	

    select count(distinct[fk_depot_id]) as 'Depot in 2021' from [sales_orders]	 where year([creation_time]) = 2021

    select count(distinct[fk_depot_id]) as 'Depot in 2022' from [sales_orders]	 where year([creation_time]) = 2022

    select ((select count(distinct[fk_depot_id]) from [sales_orders]	 where year([creation_time]) = 2022) - (select count(distinct[fk_depot_id]) from [sales_orders]	 where year([creation_time]) = 2021))as 'New depots in July 2022 in comparison to July 2022'

--- order_status
    select count([sales_order_status]) as 'Total orders shipped in July 2021' from (select distinct[order_id] as 'order_id',[sales_order_status],[creation_time] from [sales_orders]) as x where [sales_order_status] = 'Shipped' and year([creation_time]) = 2021
    select count([sales_order_status]) as 'Total orders shipped in July 2022' from (select distinct[order_id] as 'order_id',[sales_order_status],[creation_time] from [sales_orders]) as x where [sales_order_status] = 'Shipped' and year([creation_time]) = 2022


    select count([sales_order_status]) as 'Total orders shipped in July 2021' from (select distinct[order_id] as 'order_id',[sales_order_status],[creation_time] from [sales_orders]) as x where [sales_order_status] = 'Rejected' and year([creation_time]) = 2021
    select count([sales_order_status]) as 'Total orders shipped in July 2022' from (select distinct[order_id] as 'order_id',[sales_order_status],[creation_time] from [sales_orders]) as x where [sales_order_status] = 'Rejected' and year([creation_time]) = 2022


--- sales_orders_items


   select * from [sales_orders and sales orders items]


   select count(distinct[fk_product_id]) as 'Diff products sold in 2021' from [sales_orders and sales orders items] where year([creation_time]) = 2021
    select count(distinct[fk_product_id]) as 'Diff products sold in 2022' from [sales_orders and sales orders items] where year([creation_time]) = 2022



    select *,([order_quantity_accepted]* [rate]) as 'Revenue' from [sales_orders_items]


    select sum([order_quantity_accepted]* [rate]) as 'Total Revenue' from [sales_orders_items]
    select sum([order_quantity_accepted] * [rate]) as 'Total Revenue July,2021' from [sales_orders and sales orders items] where year([creation_time]) = 2021
    select sum([order_quantity_accepted] * [rate]) as 'Total Revenue July,2022' from [sales_orders and sales orders items] where year([creation_time]) = 2022
    SELECT(((select sum([order_quantity_accepted] * [rate]) as 'Total Revenue July,2022' from [sales_orders and sales orders items] where year([creation_time]) = 2022) - (select sum([order_quantity_accepted] * [rate]) as 'Total Revenue July,2021' from [sales_orders and sales orders items] where year([creation_time]) = 2021))*100/ (select sum([order_quantity_accepted] * [rate]) as 'Total Revenue July,2021' from [sales_orders and sales orders items] where year([creation_time]) = 2021)) AS 'Percentage increase in revenue'


--- LOGIN FREQUENCY

  select * from [login_logs] 
  select  * from [sales_orders] where [order_id] = 119874
  select [fk_buyer_id], count([order_id]) as 'Total Orders' from [sales_orders] group by ([fk_buyer_id])
  select [user_id] , count([login_log_id]) as 'No of logins'  from [login_logs]  group by ( [user_id])
   select * into [logins and orders] from (select [fk_buyer_id], count([order_id]) as 'Total Orders' from [sales_orders] group by ([fk_buyer_id])) as x inner join ( select [user_id] , count([login_log_id]) as 'No of logins'  from [login_logs]  group by ( [user_id]) )as y on [fk_buyer_id] = [user_id] order by ([Total Orders]) desc
    select * from [logins and orders]

--- TOP SELLING PRODUCTS
  select  *  from [sales_orders_items]
  select [fk_product_id] , count([fk_order_id]) as 'no of orders' from [sales_orders_items] group by([fk_product_id]) order by ([no of orders]) desc

  select * from [sales_orders and sales orders items]

   select [fk_product_id] , count([fk_order_id]) as 'no of orders in 2021' from (select * from [sales_orders and sales orders items] where year([creation_time]) = 2021) as x group by([fk_product_id])  order by ([no of orders in 2021]) desc 
   SELECT [fk_product_id], sum([order_quantity_accepted]* [rate]) as 'Revenue' into [top_selling_products_2021] from [sales_orders_items] where [fk_product_id] in ( select [fk_product_id] from (select TOP(10) [fk_product_id] , count([fk_order_id]) as 'no of orders in 2021' from (select * from [sales_orders and sales orders items] where year([creation_time]) = 2021) as x group by([fk_product_id])  order by ([no of orders in 2021]) desc ) as x) group by [fk_product_id] order by [Revenue] desc
   select * from [top_selling_products_2021]
    select sum([Revenue]) as 'Revenue from Top 10 selling products 2021' from [top_selling_products_2021]

  select [fk_product_id] , count([fk_order_id]) as 'no of orders in 2022' from (select * from [sales_orders and sales orders items] where year([creation_time]) = 2022) as x group by([fk_product_id])  order by ([no of orders in 2022]) desc
  SELECT [fk_product_id], sum([order_quantity_accepted]* [rate]) as 'Revenue' into [top_selling_products_2022] from [sales_orders_items] where [fk_product_id] in ( select [fk_product_id] from (select TOP(10) [fk_product_id] , count([fk_order_id]) as 'no of orders in 2022' from (select * from [sales_orders and sales orders items] where year([creation_time]) = 2022) as x group by([fk_product_id])  order by ([no of orders in 2022]) desc ) as x) group by [fk_product_id] order by [Revenue] desc
  select * from [top_selling_products_2022]
  select sum([Revenue]) as 'Revenue from Top 10 selling products 2022' from [top_selling_products_2022]

   select count(distinct[fk_product_id]) from [sales_orders and sales orders items] where year([creation_time]) = 2021 and [fk_product_id] not in( select distinct[fk_product_id] from [sales_orders and sales orders items] where year([creation_time]) = 2022)
   select count(distinct[fk_product_id]) from [sales_orders and sales orders items] where year([creation_time]) = 2022 and [fk_product_id] not in( select distinct[fk_product_id] from [sales_orders and sales orders items] where year([creation_time]) = 2021)

 --- order accepted/ rejected
  
   select count(*) as 'Total orders rejected in 2021' from [sales_orders] where year([creation_time]) = 2021 and [sales_order_status] = 'Rejected'
   select count(*) as 'Total orders shipped in 2021' from [sales_orders] where year([creation_time]) = 2021 and [sales_order_status] = 'Shipped'

   -- Order quantity
   select * from [sales_orders and sales orders items]
   select sum([ordered_quantity]) as 'Total quantity ordered in July 2021'  from [sales_orders and sales orders items] where year([creation_time]) = 2021
   select sum([order_quantity_accepted]) as 'Total quantity accepted in July 2021'  from [sales_orders and sales orders items] where year([creation_time]) = 2021
