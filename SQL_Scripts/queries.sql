-- --QUERY-1:Retrieve all books currently available.
SELECT * FROM Books WHERE Availability = 'Available';

-- --QUERY-2:List all members who have borrowed books.
SELECT DISTINCT M.MemberID, M.Name, M.Contact, M.MembershipDate
FROM Members M
INNER JOIN Transactions T ON M.MemberID = T.MemberID;

-- --QUERY-3:Display borrowing history of a specific member.
SELECT * FROM Transactions WHERE MemberID = 4;

-- - -QUERY-4:Find the most borrowed book.
SELECT B.BookID, B.Title, COUNT(T.TransactionID) AS TimesBorrowed
FROM Books B
JOIN Transactions T ON B.BookID = T.BookID
GROUP BY B.BookID, B.Title
ORDER BY TimesBorrowed DESC
LIMIT 1;

-- QUERY-5:Update book availability upon return.
UPDATE Transactions
SET ReturnDate = '2021-02-19'
WHERE TransactionID = 221;
UPDATE Books
SET Availability = 'Available'
WHERE BookID = (SELECT BookID FROM Transactions WHERE TransactionID = 221);


-- QUERY-6:Delete a book record.
DELETE FROM Books
WHERE BookID = 107;

-- QUERY-7:Retrieve books borrowed within the last month.
SELECT B.BookID, B.Title, B.Author, B.Genre, B.Availability
FROM Books B
JOIN Transactions T ON B.BookID = T.BookID
WHERE T.BorrowDate BETWEEN CURDATE() - INTERVAL 1 MONTH AND CURDATE();

-- QUERY-8:List members who have never borrowed a book.
SELECT M.MemberID, M.Name, M.Contact, M.MembershipDate
FROM Members M
WHERE NOT EXISTS (
    SELECT 1 FROM Transactions T WHERE T.MemberID = M.MemberID
);

-- QUERY-9:Find the author with the most books in the library.
SELECT Author, COUNT(*) AS TotalBooks
FROM Books
GROUP BY Author
ORDER BY TotalBooks DESC
LIMIT 1;

-- QUERY-10:Get the top 5 most borrowed books.
SELECT B.BookID, B.Title, T.TimesBorrowed
FROM Books B
JOIN (
    SELECT BookID, COUNT(*) AS TimesBorrowed
    FROM Transactions
    GROUP BY BookID
    ORDER BY TimesBorrowed DESC
    LIMIT 5
) T ON B.BookID = T.BookID;

-- QUERY-11:Retrieve overdue books and their respective borrowers.
SELECT B.BookID, B.Title, M.MemberID, M.Name
FROM Books B
JOIN Transactions T ON B.BookID = T.BookID
JOIN Members M ON T.MemberID = M.MemberID
WHERE T.ReturnDate IS NULL
  AND T.BorrowDate < CURDATE() - INTERVAL 6 MONTH;

-- QUERY-12:Find members who have borrowed more than 3 books in a month.
SELECT T.MemberID, YEAR(T.BorrowDate) AS YearBorrowed, MONTH(T.BorrowDate) AS MonthBorrowed, COUNT(*) AS TotalBorrows
FROM Transactions T
GROUP BY T.MemberID, YEAR(T.BorrowDate), MONTH(T.BorrowDate)
HAVING COUNT(*) > 3;

-- QUERY-13:Retrieve books by a specific genre with availability status.
SELECT * FROM Books
WHERE Genre = 'History' AND Availability = 'Available';

-- QUERY-14:Find the longest borrowed book duration. 
WITH DurationStats AS (
    SELECT BookID, DATEDIFF(ReturnDate, BorrowDate) AS DaysHeld
    FROM Transactions
    WHERE ReturnDate IS NOT NULL

    UNION ALL

    SELECT BookID, DATEDIFF(CURDATE(), BorrowDate)
    FROM Transactions
    WHERE ReturnDate IS NULL
),
MaxHold AS (
    SELECT MAX(DaysHeld) AS MaxDays FROM DurationStats
)
SELECT DISTINCT B.BookID, B.Title, B.Author, B.Genre
FROM Books B
JOIN DurationStats DS ON B.BookID = DS.BookID
JOIN MaxHold MH ON DS.DaysHeld = MH.MaxDays;

-- QUERY-15:List books borrowed and returned on the same day.
SELECT *
FROM Books
WHERE BookID IN (
    SELECT BookID
    FROM Transactions
    WHERE DATEDIFF(ReturnDate, BorrowDate) = 0
);

-- QUERY-16:Retrieve the most recent borrowing transaction.
SELECT *
FROM Transactions
WHERE BorrowDate = (
    SELECT MAX(BorrowDate)
    FROM Transactions
);