INSERT INTO Books (BookID, Title, Author, Genre, Availability) VALUES
(101, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 'Available'),
(102, '1984', 'George Orwell', 'Dystopian', 'Unavailable'),
(103, 'To Kill a Mockingbird', 'Harper Lee', 'Classic', 'Available'),
(104, 'A Brief History of Time', 'Stephen Hawking', 'Science', 'Available'),
(105, 'The Art of War', 'Sun Tzu', 'Philosophy', 'Unavailable'),
(106, 'The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 'Available'),
(107, 'Pride and Prejudice', 'Jane Austen', 'Romance', 'Unavailable'),
(108, 'The Catcher in the Rye', 'J.D. Salinger', 'Fiction', 'Unavailable'),
(109, 'Sapiens', 'Yuval Noah Harari', 'History', 'Available'),
(110, 'The Alchemist', 'Paulo Coelho', 'Adventure', 'Available');

INSERT INTO Members(MemberID,Name,Contact,MembershipDate) VALUES
(1,'ROHIT AGARWAL',9846583320,'2022-08-29'),
(2,'SANDIPTO ROY',8841486845,'2024-03-16'),
(3,'PRACHI YADAV',9756823210,'2021-12-09'),
(4,'PRANAV VERMA',7649583201,'2019-01-11'),
(5,'SIDDARDHA REDDY',9848123200,'2025-02-01');

INSERT INTO Transactions(TransactionID,MemberID,BookID,BorrowDate,ReturnDate) VALUES
(169,4,107,'2020-03-14','2022-06-19'),
(201,2,103,'2024-09-14',NULL),
(208,1,101,'2023-06-29','2023-06-29'),
(221,3,107,'2020-03-14',NULL),
(229,1,110,'2025-02-14','2022-02-21'),
(236,4,102,'2024-06-26',NULL), 
(298,3,107,'2023-09-13','2024-04-31');
