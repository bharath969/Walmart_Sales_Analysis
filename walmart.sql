create table if not exists Walmart (
	Invoice_ID varchar(40) not null  primary key,
	Branch char(1) not null,
    City varchar(40) not null,
	Customer_type varchar(20) not null,
	Gender	varchar(20) not null,
    Product_line varchar(40) not null,
	Unit_price float(4,2) not null,
	Quantity int not null,
	Tax decimal(6,4) not null,
	Total decimal(7,4) not null,
	Date date not null,
	Time time not null,
	Payment	 varchar(30) not null,
    cogs float(5,2) not null,
	gross_margin_percentage decimal(10,9) not null,
	gross_income decimal(6,4) not null,
	Rating float(2,1) not null

);

select * 
from Walmart;

------------------------------------------- Feauture Engineering ------------------------------------------------

-- add new column "Time_of_day":

alter table Walmart
add column Time_of_day Varchar(40) not null;

update  Walmart
set Time_of_day = 
    case
		when time between "00:00:00" and "12:00:00" then "Morning"
        when time between "12:00:01" and "16:00:00" then "Afternoon"
        else "Evening"
	end;
    
----------------------------------------------------------------------

-- Add a new column "Day_name":

Alter table walmart
add column Day_name varchar (40) not null;

update  walmart
set Day_name = dayname(date);


-------------------------------------------------------------------------
        
-- Add a new column named "Month_name":
Alter table walmart
add column Month_name varchar(40);

update walmart
set Month_name=monthname(date);


--------------------------- Exploratory data Analysis --------------------------------------

-- -------------Generic Questions-----------------------------------------------------------

-- 1.How many unique cities does the data have?
select distinct City
from walmart;

-- 2.In which city is each branch?
select distinct Branch, City
from walmart;

---------------- Product Questions ----------------------------------------------------------

-- 1.How many unique product lines does the data have?
select distinct Product_line 
from walmart;

-- 2.What is the most common payment method?
SELECT Payment, COUNT(Payment) AS payment_count
FROM walmart
GROUP BY Payment 
order by payment_count desc;

-- 3.What is the most selling product line?
# we consider the amount of sales ("Column Total")
select Product_line, sum(Total)
from walmart
group by Product_line;

-- 4.What is the total revenue by month?
select Month_name, sum(Total) as revenue
from walmart
group by Month_name;


-- 5.What month had the largest COGS?
select Month_name,sum(cogs)
from walmart
group by Month_name;


-- 6.What product line had the largest revenue?
select Product_line,sum(Total) as revenue
from walmart
group by Product_line
order by revenue desc;


-- 7.What is the city with the largest revenue?
select City,sum(Total) as revenue
from walmart
group by City
order by revenue desc;

-- 8.What product line had the largest VAT?
# Vat is nothing but the tax paid and we need to calculate the average tax by Product_line

select Product_line,avg(Tax) as Avg_Tax
from walmart
group by Product_line
order by Avg_Tax desc;

-- 9.Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
 alter table walmart
 add column Performance varchar(25);
 
 # to find out the avg quantity
 SELECT 
	AVG(quantity) AS avg_qnty
FROM walmart;

# Please update
# For some reasons i couldnot add the sub querry here and I substituted the value 6 which came from the baove querry
update walmart
set Performance =
	case
		when Quantity >= 6 then "Good"
        else "Bad"
	end;

-- 10.Which branch sold more products than average product sold?
select Branch,sum(Quantity)
from walmart
group by Branch
having sum(Quantity) > (select avg(Quantity) from walmart);


-- 11.What is the most common product line by gender?
select Product_line , Gender,count(Gender) as count
from walmart 
group by Gender,Product_line
order by count  desc;

-- 12.What is the average rating of each product line?
select Product_line ,avg(Rating)
from walmart
group by Product_line
order by avg(Rating) desc;

--------------------- Sales Questions -------------------------------------------------

-- 1.Number of sales made in each time of the day per weekday
select Time_of_day ,count(Time_of_day)
from walmart
group by Time_of_day;

-- 2.Which of the customer types brings the most revenue?
select Customer_type, sum(Total) as Amount_spent
from walmart
group by Customer_type;

-- 3.Which city has the largest tax percent/ VAT (Value Added Tax)?
select City,max(Tax)
from walmart
group by City
order by Max(tax);

-- 4.Which customer type pays the most in VAT?
 # We need to add column "Tax_paid"
 
 alter table walmart
 add column Tax_paid decimal(10,4);
 ALTER TABLE walmart
MODIFY COLUMN Tax_paid DECIMAL(20,4);
 
 update walmart
 set Tax_paid  = (Total * Tax) /100 ;
 
 select Customer_type,sum(Tax_paid) as tax_paid
 from walmart
 group by Customer_type
 order by tax_paid desc;
 
 --------------------------------------------------- Customer Questions ----------------------------
 
 -- 1.How many unique customer types does the data have?
 select distinct Customer_type 
 from walmart;
 
 -- 2.How many unique payment methods does the data have?
 select distinct Payment 
 from walmart;
 
 -- 3.What is the most common customer type?
select  Customer_type ,count(*)
 from walmart
 group by Customer_type
 order by count(*) desc;
 
 -- 4.Which customer type buys the most?
 select  Customer_type ,sum(Total) as amount_spent
 from walmart
 group by Customer_type
 order by amount_spent desc;
 
 -- 5.What is the gender of most of the customers?
 select  Customer_type ,Gender,count(Gender)
 from walmart
 group by Customer_type,Gender
 order by count(Gender) Desc;
 
 -- 6.What is the gender distribution per branch?
 select Branch,Gender,Count(Gender) as count
 from walmart
 group by Branch,Gender
 order by count Desc;
 
 -- 7.Which time of the day do customers give most ratings?
 select Time_of_day ,count(*)
 from walmart
 group by Time_of_day;
 
 -- 8.Which time of the day do customers give most ratings per branch?
  select Branch,Time_of_day ,count(Time_of_day)
 from walmart
 group by Branch,Time_of_day
 order by count(Time_of_day) desc;
 
 -- 9.Which day of the week has the best avg ratings?
 select Day_name ,avg(Rating)
 from walmart
 group by Day_name
 order by avg(Rating) desc;
 
 -- 10.Which day of the week has the best average ratings per branch?
 select Branch,Day_name ,avg(Rating)
 from walmart
 group by Branch,Day_name
 order by avg(Rating) desc;
 
 