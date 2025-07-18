
-- Triggers.sql

-- Trigger to update availability when a book is borrowed
DELIMITER //
CREATE TRIGGER AfterBookBorrow
AFTER INSERT ON Transactions
FOR EACH ROW
BEGIN
    UPDATE Books SET Availability = 'No'
    WHERE BookID = NEW.BookID;
END //
DELIMITER ;

-- Trigger to update availability when a book is returned
DELIMITER //
CREATE TRIGGER AfterBookReturn
AFTER UPDATE ON Transactions
FOR EACH ROW
BEGIN
    IF NEW.ReturnDate IS NOT NULL THEN
        UPDATE Books SET Availability = 'Yes'
        WHERE BookID = NEW.BookID;
    END IF;
END //
DELIMITER ;
