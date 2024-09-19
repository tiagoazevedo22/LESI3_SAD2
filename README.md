# Data Processing and Visualization (P02) - Decision Support Systems

## Project Overview

In today's highly digital and interconnected world, the ability to process and visualize data has become an essential skill in various disciplines, including Information Systems Engineering. This project aimed to develop a software solution for data processing and visualization within the Decision Support Systems (DSS) course. The solution integrates multiple data sources, implements data preparation operations, calculates columns and measures, and presents data visualizations.

The primary data source for this project was the WWI data mart, supplemented by at least one additional auxiliary data source. By combining and analyzing these data, the project seeks to gain insights that contribute to a better understanding of the studied context.

## Research Questions

The project explored the following data analyses:

1. **Sales by Day of the Week**: Is there significant variation in sales by day of the week? Are there specific days that consistently record higher or lower sales?
2. **Average Sales by Month**: How do sales vary throughout the year? Are there specific months with consistently higher or lower sales?
3. **Sales by Category and Product**: What are the best-selling categories and products? Are there categories or products that consistently record higher or lower sales?
4. **Sales by Customer**: Who are the top customers? Are there customers with consistently higher or lower purchase volumes?
5. **New Customers by Month**: What is the monthly new customer acquisition rate? Are there specific months with consistently higher customer acquisition?
6. **Average Sales Value by Month**: What is the average sales value per month? How does this value vary by state?
7. **Relationship Between Population and Sales**: Is there a correlation between a state's population and its sales? Do states with larger populations record higher sales?
8. **Relationship Between Purchasing Power and Sales**: Is there a correlation between a state's purchasing power and its sales? Do states with higher purchasing power record higher sales?

## Data Acquisition and Preparation

- **Data Connections**: The primary data source was the sales data mart stored in a PostgreSQL database. Power BI was used to establish a direct connection to this database, allowing data import into the production environment. Additionally, external data on population and purchasing power by state were incorporated into Power BI in the same manner.
- **Data Cleaning**: Data cleaning was primarily done through SQL queries, which extracted relevant data from the data mart and transformed it for analysis. Functions were used to extract specific date components and calculate aggregates.
- **Data Preparation**: SQL queries combined data from various data mart tables, such as sales with customer and product information. Power Query Editor in Power BI was used to eventually merge internal and external data.
- **Data Transformation**: SQL queries were used to transform data into a format suitable for analysis, including calculations like average sales per month and the number of customers per month. Power BI was then used to create visualizations that made the data more accessible and intuitive.

## Data Visualization

- **Dashboard Objectives**: The dashboards aim to provide insights into company sales, focusing on sales patterns over time, variations by day of the week and month, and sales relationships with different customer and product categories. The project also explores the relationship between sales and external data like population and purchasing power by state.
- **End-User Profile**: The dashboards are primarily intended for managers and sales analysts who need clear and accessible information to make informed marketing and sales strategy decisions.
- **Dashboard Descriptions**: The dashboards include a variety of visualizations, such as bar charts showing total sales by day of the week, line charts illustrating average sales by month over time, and tables detailing sales by customer or product category.
- **Key Elements**: Interactive elements like slicers allow users to filter data by specific criteria, such as state or month. Dashboards also feature KPIs (Key Performance Indicators) that provide a quick view of sales performance, such as total sales or average sales. The use of Power BI influencers helps identify factors significantly impacting sales.

## Conclusion

This project successfully conducted a robust and meaningful data analysis using Power BI and SQL. By connecting to the PostgreSQL data mart and executing SQL queries, necessary data for analysis were extracted. Data cleaning and preparation tasks ensured that the data were ready for analysis.

Through Power BI, interactive dashboards were created, allowing for various data visualizations and valuable insights into company sales. These insights include sales patterns over time and differences based on customer and product categories. Additionally, incorporating external data on population and purchasing power enabled the exploration of their relationship with sales.

Power BI proved to be a powerful tool for this project, offering an intuitive interface and robust visualization capabilities, simplifying data analysis. The integration of SQL directly into Power BI allowed for leveraging SQL familiarity during data work.

Overall, this project demonstrated the value of data analysis in making informed decisions. With the right tools and a structured approach, large volumes of data can be transformed into actionable insights that drive business success.

## Authors

- Nuno Mendes
- Rosário Silva
- Tiago Azevedo
