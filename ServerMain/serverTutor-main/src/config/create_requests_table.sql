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