CREATE TABLE Books(
			Book_ID INT PRIMARY KEY,
			Title VARCHAR(100),
			Author VARCHAR(100),
			Genre VARCHAR(50),
			Published_Year INT,
			Price NUMERIC(10,2),
			Stock INT
);

-- Import Data into Books Table 
COPY Books(Book_ID, Title, Author, Genre, Published_Year, Price, Stock)
FROM 'C:/Users/Asus/OneDrive/Documents/Books.csv'
CSV HEADER;

SELECT * FROM Books;


DROP TABLE IF EXISTS customers;

CREATE TABLE Customers(
			Customer_ID INT PRIMARY KEY,
			Name VARCHAR(100),
			Email VARCHAR(100),
			Phone VARCHAR(15),
			City VARCHAR(50),
			Country VARCHAR(150)
);

-- Import Data into Customers Table 
COPY Customers(Customer_ID, Name, Email, Phone, City, Country)
FROM 'C:\Users\Asus\OneDrive\Documents\SQL_Micro_Course-main\SQL_Micro_Course-main\ST - SQL ALL PRACTICE FILES\All Excel Practice Files\Customers.csv'
CSV HEADER;

SELECT * FROM Customers;

CREATE TABLE Orders(
			Order_ID INT PRIMARY KEY,
			Customer_ID INT REFERENCES Customers(Customer_ID),
			Book_ID INT REFERENCES Books(Book_ID),
			Order_date DATE,
			Quantity INT,
			Total_Amount NUMERIC(10,2)
);

-- Import Data into Orders Table 
COPY Orders(Order_ID, Customer_ID, Book_ID, Order_date, Quantity, Total_Amount)
FROM '‪C:\Users\Asus\OneDrive\Documents'
CSV HEADER;

SELECT * FROM Orders;
-- BASIC QUESTIONS:

-- 1) Retrieve all books in the "Fiction" genre:

SELECT title, author, genre, published_year
FROM Books
WHERE genre='Fiction';

-- 2) Find books published after the year 1950:

SELECT title, author, genre, published_year
FROM Books
WHERE published_year>1950;

-- 3) List all the customers from Canada:

SELECT * FROM Customers
WHERE country = 'Canada';

-- 4) Show orders placed in November 2023

SELECT * FROM Orders
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';

-- 5) Retrieve the total stock of books available:

SELECT SUM(Stock) AS Total_stock
FROM  Books;

-- 6) Find the details of most expensive books:

SELECT * FROM Books ORDER BY price DESC
LIMIT 1;

-- 7) Show all customers who ordered more than 1 quantity of a book:

SELECT * FROM Orders 
WHERE quantity>1;

-- 8) Retrieve all orders where the total amount exceeds $20:

SELECT * FROM Orders
WHERE total_amount>20

-- 9) List all the genres available in the books table:

SELECT DISTINCT(genre) FROM Books;

-- 10) Find the book with lowest stock 

SELECT * FROM Books 
ORDER BY stock
LIMIT 1;

-- 11) Calculate the total revenue generated from all orders:

SELECT SUM(total_amount) AS total_revenue 
FROM Orders; 

-- ADVANCE QUESTIONS:

-- 1) Retrieve the toal number of books sold in each genre:

SELECT b.genre, SUM(o.quantity) AS total_books_sold
FROM Orders o
JOIN Books b ON o.book_id = b.book_id
GROUP BY B.genre;


-- 2) Find the average price of books in the "Fantasy" genre:

SELECT AVG(price) AS avg_price
FROM Books 
WHERE genre='Fantasy';

-- 3) List customers who have placed at least 2 orders:

SELECT o.customer_id,c.Name, COUNT(o.order_id) AS order_count
FROM Orders o 
JOIN Customers c ON o.customer_id=c.customer_id
GROUP BY o.customer_id, c.Name
HAVING COUNT(order_id)>=2;

-- 4) Find the most frequently ordered book

SELECT O.book_id,b.Title, COUNT(O.book_id) AS order_count
FROM Orders o
JOIN Books b ON b.book_id=o.book_id
GROUP BY o.book_id, b.Title 
ORDER BY COUNT(o.book_id) DESC
LIMIT 1;

-- 5) Show the top 3 expensive books of 'Fantasy' Genre:

SELECT *
FROM Books WHERE genre = 'Fantasy'
ORDER BY price DESC
LIMIT 3;

-- 6) Retrieve the total quantity of books sold by each author:

SELECT b.Author, SUM(o.quantity) AS total_book_sold
FROM Books b
JOIN Orders o ON b.book_id=o.book_id
GROUP BY b.Author;

-- 7) List the cities where customers who spent overr $30 are located:

SELECT DISTINCT c.City, o.total_amount
FROM Customers c
JOIN Orders o ON c.customer_id=o.customer_id
WHERE o.total_amount>30;

-- 8) Find the customers who spend most on orders:

SELECT c.Name, c.customer_id, SUM(o.total_amount) AS total_spent
FROM Orders o
JOIN Customers c ON c.customer_id=o.customer_id
GROUP BY c.customer_id,c.name
ORDER BY total_spent DESC
LIMIT 1;

-- 9) Calculate the Stock remaining after fulfilling all orders:

SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS order_quantity,
b.stock-COALESCE(SUM(o.quantity),0) AS Remaining_quantity
FROM Books b 
LEFT JOIN Orders o ON b.book_id=o.book_id
GROUP BY b.book_id
ORDER BY b.book_id;