-- PRDA-05- Customer Data Analysis


use project_customer_segmentation;
select * from customer;
show tables;
select count(*) from customer;

select count(distinct invoice_no) from customer ;

select count(distinct customer_id) from customer;


-- Q1 Shopping distribution among the gender ?

select gender as Gender, count(invoice_no) as shopping_Distribution from customer group by gender;

-- Q2 which gender did we sell more products to ?

Select gender as Gender, sum(quantity) as Total_items from customer group by gender
order by Total_items desc;

-- Q3 Which gender generated more revenue?

select gender as Gender, Round(sum(quantity*price),2) as Revenue from customer group by gender 
order by Revenue desc;

-- Q4 Distribution of purchase categories relative to other columns?

-- Number_of_purchase versus category
select  category, count(invoice_no) as Total_no_of_purchases from customer group by category 
order by Total_no_of_purchases desc;

-- Category, gender versus Total_no_of_purchases
select gender, category, count(invoice_no) as Total_no_of_purchases from customer group by category,
gender order by gender, Total_no_of_purchases desc, category;

-- category, invoice_date versus Total_no_of_purchases
select case when invoice_date <= "31-12-2021" then 2021
when invoice_date <= "31-12-2022" and invoice_date >= "01-01-2022" then  2022
end as Year_of_purchase, category, count(invoice_no) as Total_no_of_purchases from customer group by category,
Year_of_purchase order by Year_of_purchase, Total_no_of_purchases desc, category;

-- Q5 How is the shopping distribution according to age?

select case when age >= 17 and age < 25 then "Youth"
when age >=25 and age < 35 then "Young Adult"
when age >=35 and age < 50 then "Adult"
else "Senior Citizens" end as Age_category, count(invoice_no) as shopping_distribution from customer
group by Age_category
order by shopping_distribution;

-- Q6 Which age category did we sell more products to?

select case when age >= 17 and age < 25 then "Youth"
when age >=25 and age < 35 then "Young Adult"
when age >=35 and age < 50 then "Adult"
else "Senior Citizens" end as Age_category, sum(quantity) as Product_count from customer
group by Age_category order by Product_count desc;

-- Q7 which age category generated more revenue?

select case when age >= 17 and age < 25 then "Youth"
when age >=25 and age < 35 then "Young Adult"
when age >=35 and age < 50 then "Adult"
else "Senior Citizens" end as Age_category, Round(sum(quantity*price),2) as Revenue from customer
group by Age_category order by Revenue desc;


-- Q9 Does the payment method have a relation between other columns?

select payment_method, gender, count(invoice_no) as shopping_distributions from customer
group by payment_method, gender;


-- Q10 How is the distribution of the payment method?

select case when age >= 17 and age < 25 then "Youth"
when age >=25 and age < 35 then "Young Adult"
when age >=35 and age < 50 then "Adult"
else "Senior Citizens" end as Age_category, payment_method , 
count(invoice_no) as Total_no_of_purchases, sum(quantity*price) as Amount_spend from customer 
group by Age_category, payment_method
order by Age_category, Total_no_of_purchases desc, payment_method;




