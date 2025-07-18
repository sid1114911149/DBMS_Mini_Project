-- • Books (BookID, Title, Author, Genre, Availability)
-- • Members (MemberID, Name, Contact, MembershipDate)
-- • Transactions (TransactionID, MemberID, BookID, BorrowDate, ReturnDate)
CREATE TABLE Books(
    BookID INT PRIMARY KEY,
    Title VARCHAR(50) NOT NULL,
    Author varchar(50),
    Genre varchar(50),
    Availability ENUM('Available','Unavailable')
);
CREATE TABLE Members(
    MemberID INT PRIMARY KEY,
    Name varchar(50) NOT NULL,
    Contact NUMBER(10),
    MembershipDate DATE
);
CREATE TABLE Transactions(
    TransactionID INT PRIMARY KEY,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    BorrowDate DATE,
    ReturnDate DATE
);