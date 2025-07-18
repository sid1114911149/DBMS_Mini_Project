-- Stored_procedures.sql

-- Sample: Procedure to retrieve available books
DELIMITER //
CREATE PROCEDURE GetAvailableBooks()
BEGIN
    SELECT * FROM Books WHERE Availability = 'Yes';
END //
DELIMITER ;

-- Procedure to get borrowing history of a specific member
DELIMITER //
CREATE PROCEDURE GetBorrowingHistory(IN member_id INT)
BEGIN
    SELECT * FROM Transactions WHERE MemberID = member_id;
END //
DELIMITER ;

-- Procedure to find the most borrowed book
DELIMITER //
CREATE PROCEDURE GetMostBorrowedBook()
BEGIN
    SELECT BookID, COUNT(*) AS BorrowCount
    FROM Transactions
    GROUP BY BookID
    ORDER BY BorrowCount DESC
    LIMIT 1;
END //
DELIMITER ;

-- Procedure to get top 5 most borrowed books
DELIMITER //
CREATE PROCEDURE GetTop5Books()
BEGIN
    SELECT BookID, COUNT(*) AS TimesBorrowed
    FROM Transactions
    GROUP BY BookID
    ORDER BY TimesBorrowed DESC
    LIMIT 5;
END //
DELIMITER ;

-- Procedure to find overdue books
DELIMITER //
CREATE PROCEDURE GetOverdueBooks()
BEGIN
    SELECT * FROM Transactions
    WHERE ReturnDate IS NULL AND DATEDIFF(CURDATE(), BorrowDate) > 30;
END //
DELIMITER ;

-- Add more procedures as needed for the rest of the operations