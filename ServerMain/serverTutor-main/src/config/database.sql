-- Create database if not exists
CREATE DATABASE IF NOT EXISTS tutor_system;
USE tutor_system;

-- Users table
CREATE TABLE IF NOT EXISTS Users (
    userID INT AUTO_INCREMENT PRIMARY KEY,
    userName VARCHAR(50) NOT NULL UNIQUE,
    fullName VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    avatar VARCHAR(255),
    dateOfBirth DATE,
    role ENUM('Student', 'Tutor', 'Moderator', 'Admin') NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    isActive BOOLEAN DEFAULT TRUE,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Students table
CREATE TABLE IF NOT EXISTS Students (
    studentID VARCHAR(10) PRIMARY KEY,
    userID INT NOT NULL,
    grade VARCHAR(50),
    school VARCHAR(100),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (userID) REFERENCES Users(userID) ON DELETE CASCADE
);

-- Tutors table
CREATE TABLE IF NOT EXISTS Tutors (
    tutorID VARCHAR(10) PRIMARY KEY,
    userID INT NOT NULL,
    degrees TEXT,
    identityCard VARCHAR(20),
    workplace VARCHAR(100),
    description TEXT,
    rating FLOAT DEFAULT 0,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (userID) REFERENCES Users(userID) ON DELETE CASCADE
);

-- Classes table
CREATE TABLE IF NOT EXISTS Classes (
    classID INT AUTO_INCREMENT PRIMARY KEY,
    className VARCHAR(100) NOT NULL,
    videoLink VARCHAR(255),
    subject VARCHAR(100) NOT NULL,
    tutorID VARCHAR(10) NOT NULL,
    studentID VARCHAR(10),
    paymentID INT,
    length INT NOT NULL,
    available BOOLEAN DEFAULT TRUE,
    type VARCHAR(50),
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    isActive BOOLEAN DEFAULT TRUE,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (tutorID) REFERENCES Tutors(tutorID),
    FOREIGN KEY (studentID) REFERENCES Students(studentID)
);

-- Complains table
CREATE TABLE IF NOT EXISTS Complains (
    complainID INT AUTO_INCREMENT PRIMARY KEY,
    uID INT NOT NULL,
    message TEXT NOT NULL,
    status ENUM('Pending', 'Resolved') DEFAULT 'Pending',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (uID) REFERENCES Users(userID) ON DELETE CASCADE
);

-- Payments table
CREATE TABLE IF NOT EXISTS Payments (
    paymentID INT AUTO_INCREMENT PRIMARY KEY,
    amount DECIMAL(10,2) NOT NULL,
    status ENUM('Pending', 'Completed', 'Failed') DEFAULT 'Pending',
    paymentMethod VARCHAR(50),
    transactionID VARCHAR(100),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Messages table
CREATE TABLE IF NOT EXISTS Messages (
    messageID INT AUTO_INCREMENT PRIMARY KEY,
    senderID INT NOT NULL,
    receiverID INT NOT NULL,
    messageText TEXT NOT NULL,
    senderType ENUM('Student', 'Tutor', 'Moderator', 'Admin') NOT NULL,
    receiverType ENUM('Student', 'Tutor', 'Moderator', 'Admin') NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (senderID) REFERENCES Users(userID) ON DELETE CASCADE,
    FOREIGN KEY (receiverID) REFERENCES Users(userID) ON DELETE CASCADE
);

-- Create Requests table
CREATE TABLE IF NOT EXISTS Requests (
    requestID INT AUTO_INCREMENT PRIMARY KEY,
    studentID VARCHAR(10) NOT NULL,
    tutorID VARCHAR(10) NOT NULL,
    subject VARCHAR(50) NOT NULL,
    description TEXT,
    status ENUM('Pending', 'Accepted', 'Rejected') DEFAULT 'Pending',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (studentID) REFERENCES Students(studentID),
    FOREIGN KEY (tutorID) REFERENCES Tutors(tutorID)
);

-- Insert test requests
INSERT INTO Requests (studentID, tutorID, subject, description, status) VALUES
('S1', 'T1', 'Mathematics', 'Need help with calculus homework', 'Pending'),
('S2', 'T2', 'Physics', 'Looking for physics tutoring sessions', 'Accepted'),
('S1', 'T2', 'Physics', 'Need help with thermodynamics', 'Pending');