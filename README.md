# Walmart_Sales_Analysis"

<br>This project aims to explore the Walmart Sales data to understand top performing branches and products, sales trend of of different products, customer behaviour. The aims is to study how sales strategies can be improved and optimized. The dataset was obtained from the Kaggle Walmart Sales Forecasting Competition.

# Technologies Used:
<br> 1.My Sql
<br> 2.Power Bi

# Creating the table:
<br> 1:Create a data base
<br> 2:Create a table
<br> 3:The datatypes of  attributes should carefully be macthed with the coulmns of the given csv file.

| Attribute | Description| Data type |
| ---------|----------|----------|
| Invoice_ID  | Invoice of the sales made | varchar(40) |
| Branch  | Branch at which sales were made| char(1) |
| City|Location of the branch| varchar(40|
|Customer_type|	The type of the customer	|VARCHAR(30)|
|Gender| gender of the customer making purchase|	VARCHAR(20)|
|Product_line|	Product line of the product sold|	VARCHAR(40)|
|Unit_price|	The price of each product|	float(4,2))|
|Quantity|	The amount of the product sold|	INT|
|Tax|	The amount of tax on the purchase|	decimal(6, 4)|
|Total|	The total cost of the purchase|	decimal(7,4)|
|Date|	The date on which the purchase was made|	DATE|
|Time|	The time at which the purchase was made|	TIME|
|Payment|	Mode of payment |varchar(30))|
|cogs|	Cost Of Goods sold|	float(5,2)|
|gross_margin_percentage|	Gross margin percentage|	decimal(10,9)|
|gross_income|	Gross Income|	decimal(6,4)|
|Rating|	Rating	|FLOAT(2, 1)|

# Uploading the CSV File:
<br>Upload the values from csv file to the table created in sql.
<br>Truncate the table while uploading


# Data wrangling:
<br>This has already been taken care of while creating table by using constraint "***NOT NULL***"

# Feauture Engineering : 
To generate new data from the given data 

<br>1.Add a new column "***Time_of_day***"
<br>Time between "00:00:00" and "12:00:00" then "**Morning**"
<br>Time between "12:00:01" and "16:00:00" then "**Afternoon**"
<br>else "**Evening**"


<br>2.Add a new column "***Day_name***"
<br>set Day_name = dayname(date)


<br>3.Add a new column "***Month_name***"
<br>set Month_name=monthname(date)

# Exploratory Data Analysis:
<br> We do some EDA to answer the following questions

# Generic Question
<br>1.How many unique cities does the data have?
<br>2.In which city is each branch?

# Product Questions
<br>1.How many unique product lines does the data have?
<br>2.What is the most common payment method?
<br>3.What is the most selling product line?
<br>4.What is the total revenue by month?
<br>5.What month had the largest COGS?
<br>6.What product line had the largest revenue?
<br>7.What is the city with the largest revenue?
<br>8.What product line had the largest VAT?
<br>9.Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
<br>10.Which branch sold more products than average product sold?
<br>11.What is the most common product line by gender?
<br>12.What is the average rating of each product line?

# Sales Questions
<br>1.Number of sales made in each time of the day per weekday?
<br>2.Which of the customer types brings the most revenue?
<br>3.Which city has the largest tax percent/ VAT (Value Added Tax)?
<br>4.Which customer type pays the most in VAT?

# Customer Questions
<br>1.How many unique customer types does the data have?
<br>2.How many unique payment methods does the data have?
<br>3.What is the most common customer type?
<br>4.Which customer type buys the most?
<br>5.What is the gender of most of the customers?
<br>6.What is the gender distribution per branch?
<br>7.Which time of the day do customers give most ratings?
<br>8.Which time of the day do customers give most ratings per branch?
<br>9.Which day of the week has the best avg ratings?
<br>10.Which day of the week has the best average ratings per branch?

# Power Bi Anlaysis:
<br>Plotted the following in Power Bi
<br>1.Total revenue
<br>2.Total Revenue by month
<br>3.Total revenue by branch
<br>4.Total money spent by customers grouped by their gender
<br>5.For production line,plotted total revenue,quantity of products sold,production cost and gross margin
<br>6.Total cost of production of each branch
<br>7.Gross margin of each branch
<br>8.Average rating of each branch
<br>9.Prefered payment method 

# Conclusions:
<br> 1.There is a massive dip in the sales of February month.This is due to fall in the sales of these product lines(Sports and travel,Home and lifestyle
Health and beauty).We need to investigate why?
<br> 2.Need to increase the no of payments methods
<br> 3.There is a neglible difference between the amount spent by members and normal persons.(We should give membership cards and points for every purchase etc.
<br> 4.More purchases are done in the evening which is pretty normal but less purchases in the morning(Need to work on this).
<br> 5.We have only 6 product lines.if possible, we need to diversify.
