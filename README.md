# Walmart_Sales_Analysis

<br>This project aims to explore the Walmart Sales data to understand top performing branches and products, sales trend of of different products, customer behaviour. The aims is to study how sales strategies can be improved and optimized. The dataset was obtained from the Kaggle Walmart Sales Forecasting Competition.


# Creating the table
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

# Uploading the CSV File
<br>Upload the values from csv file to the table created in sql.
<br>Truncate the table while uploading


# Data wrangling
<br>This has already been taken care of while creating table by using constraint "***NOT NULL***"

# Feauture Engineering : 
To generate new data from the given data 

<br>1.Add a new column "***Time_of_day***"

<br>        Time between "00:00:00" and "12:00:00" then "**Morning**"
<br>        Time between "12:00:01" and "16:00:00" then "**Afternoon**"
<br>        else "**Evening**"

<br>2.Add a new column "***Day_name***"

<br>        set Day_name = dayname(date)

<br>3.Add a new column "***Month_name***"

<br>        set Month_name=monthname(date)
