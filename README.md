# Online Bookstore SQL Project

## Project Overview

This project is a SQL-based Online Bookstore Database System designed to manage and analyze bookstore operations such as books inventory, customer details, and order transactions.

The project demonstrates database design, data import, and SQL querying skills including basic to advanced queries for business insights.

## Database Structure

The project consists of three main tables:

1. Books
Stores details about books available in the store
Columns:
  Book_ID (Primary Key)
  Title
  Author
  Genre
  Published_Year
  Price
  Stock

2. Customers
  Stores customer information
  Columns:
  Customer_ID (Primary Key)
  Name
  Email
  Phone
  City
  Country

3. Orders
  Stores order transactions
  Columns:
  Order_ID (Primary Key)
  Customer_ID (Foreign Key)
  Book_ID (Foreign Key)
  Order_Date
  Quantity
  Total_Amount\

## Features & Functionalities

# Data Management
  Created relational database using SQL
  Imported CSV data into tables using COPY command
  Maintained relationships using Primary & Foreign Keys

# SQL Queries Implemented
1. Basic Queries
  Retrieve books by genre
  Filter books by year
  Get customers by country
  Find orders within a date range
  Calculate total stock
  Identify most/least expensive books
  Distinct genres extraction
  Total revenue calculation

2. Advanced Queries
  Total books sold per genre
  Average book price by genre
  Customers with multiple orders
  Most frequently ordered book
  Top 3 expensive books (Fantasy)
  Author-wise total sales
  High-spending customers
  Customer locations with high spending
  Remaining stock after orders

## Sample Insights Generated
  Total revenue generated from all orders
  Most popular book based on order frequency
  Top customers based on spending
  Cities with high-value customers
  Remaining inventory after sales

## Tools & Technologies
  SQL (PostgreSQL / pgAdmin)
  CSV Data Handling
  Relational Database Design

##Key Learning Outcomes
  SQL Joins and Aggregations
  Data Analysis using SQL
  Database Design & Normalization
  Writing optimized queries
  Generating business insights from raw data
