
## 📚 Library Management System

---

### **Project Details**

- **Group:** 1 
- **Roll Numbers:** 1-5
- **Problem Statement:** Develop a database for a Library Management System

### 📘 About the Project

We created this **Library Management System** database to help library systems keep track of their **books**, **members**, and **transactions**.  
Our system makes it easy to:

-  See which books are currently **available**
-  Track **member borrowing history**
-  Analyze **transaction patterns**

This system simplifies library operations and improves efficiency through organized and accessible data.


### Virtual Database
For this project, we set up a virtual database using MySQL Command Line Client. We chose this approach because:

--It gave us a safe environment to test all our SQL queries without any risk

--We could easily reset the database when needed during development

--Everyone in our group could work with the same database structure

--It's perfect for demonstrating how the system works during evaluation

The MySQL Command Line Client let us directly execute our queries and see results immediately, which made development and testing much faster.

 ### Our Database Structure
We kept the database simple with three main tables:

 Books (BookID, Title, Author, Genre, Availability)
 
 Members (MemberID, Name, Contact, MembershipDate)

Transactions (TransactionID, MemberID, BookID, BorrowDate, ReturnDate)
### How We Organized Everything
![image](https://github.com/user-attachments/assets/74f3a3e0-ff6a-4813-a3c0-0a5cd21c9c01)

### Getting Started
If you want to test our system:

 Open MySQL Command Line Client

![image](https://github.com/user-attachments/assets/a0efda45-4b47-4d22-9682-baa17ce21a3c)

### Key Features (Implemented as Queries)
We implemented all these features as SQL queries:

### Note
This is our submission for the DBMS course project. We've implemented everything using MySQL Command Line Client as our virtual database environment.
