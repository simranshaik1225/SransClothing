👗 Sran — Women’s Clothing Website
📘 Executive Summary
Sran is a full-stack e-commerce web application tailored for women’s clothing. Developed using Java, Spring MVC, Servlets, JSP, Hibernate, and MySQL, this project demonstrates the implementation of end-to-end product browsing, shopping cart, wishlist, and order management for a fashion brand. It highlights key aspects of building a scalable online retail store with robust backend logic and dynamic frontend pages.

📑 Table of Contents
Project Objective

Features

Functional Modules

Technologies Used

Dependencies Used

System Architecture

Folder Structure

How to Run

🎯 Project Objective
To design and develop a practical online shopping platform for women’s apparel, implementing core e-commerce features such as product listings, cart operations, user authentication, wishlist handling, and order tracking using industry-standard Java web technologies.

🔧 Features
User Module

User registration & login

Session-based authentication

User-specific wishlist

Order history tracking

Functional Modules

Category-wise product browsing (Tops, Kurtis, Dresses, Shrugs)

Add to Cart / Remove from Cart

Add to Wishlist / Remove from Wishlist

Dynamic product details page

Search functionality

Secure order placement

💡 Technologies Used
Component	Technology
Backend	Java Spring MVC, Servlets, JSP
ORM	Hibernate ORM
Database	MySQL
Build Tool	Maven
Tools	JSTL, Apache Tomcat

📦 Dependencies Used (pom.xml)
Dependency Group	Artifact
org.springframework	spring-webmvc
org.hibernate	hibernate-core
jakarta.servlet.jsp	jsp-api
mysql	mysql-connector-java
jakarta.servlet	jakarta.servlet-api
javax.servlet.jsp.jstl	jstl

🧱 System Architecture
The project uses a classic layered MVC architecture:

Presentation Layer: JSP pages, JSTL tags for dynamic content

Controller Layer: Spring MVC controllers handle requests and responses

Service Layer: Business logic for user operations, wishlist, cart, and orders

Data Access Layer: Hibernate DAOs for managing database operations

Entity Layer: Java POJOs mapped to database tables

📂 Folder Structure
graphql
Copy
Edit
com.sran
 ├── controllers       # Spring MVC controllers (e.g., CartController, ProductController)
 ├── services          # Service interfaces & implementations
 ├── dao               # DAO interfaces & implementations (Hibernate)
 ├── model             # Entity classes (Product, Customer, Order, Wishlist, etc.)
 ├── resources         # Static resources (CSS, images)
 ├── webapp            # JSP pages (home, product, login, etc.)
 ├── WEB-INF           # web.xml configuration
🛠 How to Run
Backend & Frontend Deployment

Open project in your IDE (e.g., Eclipse or IntelliJ).

Configure Apache Tomcat server.

Set up the MySQL database with required tables & seed data.

Run the application on Tomcat.

Access the website at http://localhost:8080/SranWebsite.
