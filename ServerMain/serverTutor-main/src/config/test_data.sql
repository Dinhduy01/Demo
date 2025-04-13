-- Insert test users
INSERT INTO Users (userName, fullName, email, password, role, phone, address) VALUES
('admin1', 'Admin User', 'admin@example.com', '$2a$10$X7Q8Y9Z0A1B2C3D4E5F6G7H8I9J0K1L2M3N4O5P6Q7R8S9T0U1V2W3X4Y5Z', 'Admin', '1234567890', 'Admin Address'),
('tutor1', 'John Tutor', 'tutor1@example.com', '$2a$10$X7Q8Y9Z0A1B2C3D4E5F6G7H8I9J0K1L2M3N4O5P6Q7R8S9T0U1V2W3X4Y5Z', 'Tutor', '1234567891', 'Tutor Address 1'),
('tutor2', 'Jane Tutor', 'tutor2@example.com', '$2a$10$X7Q8Y9Z0A1B2C3D4E5F6G7H8I9J0K1L2M3N4O5P6Q7R8S9T0U1V2W3X4Y5Z', 'Tutor', '1234567892', 'Tutor Address 2'),
('student1', 'Alice Student', 'student1@example.com', '$2a$10$X7Q8Y9Z0A1B2C3D4E5F6G7H8I9J0K1L2M3N4O5P6Q7R8S9T0U1V2W3X4Y5Z', 'Student', '1234567893', 'Student Address 1'),
('student2', 'Bob Student', 'student2@example.com', '$2a$10$X7Q8Y9Z0A1B2C3D4E5F6G7H8I9J0K1L2M3N4O5P6Q7R8S9T0U1V2W3X4Y5Z', 'Student', '1234567894', 'Student Address 2'),
('moderator1', 'Mike Moderator', 'moderator@example.com', '$2a$10$X7Q8Y9Z0A1B2C3D4E5F6G7H8I9J0K1L2M3N4O5P6Q7R8S9T0U1V2W3X4Y5Z', 'Moderator', '1234567895', 'Moderator Address');

-- Insert test tutors
INSERT INTO Tutors (tutorID, userID, degrees, identityCard, workplace, description, rating) VALUES
('T1', 2, 'PhD in Mathematics', 'ID123456', 'University of Science', 'Experienced math tutor with 5 years of teaching', 4.5),
('T2', 3, 'MSc in Physics', 'ID123457', 'High School Teacher', 'Physics expert with 3 years of tutoring experience', 4.8);

-- Insert test students
INSERT INTO Students (studentID, userID, grade, school) VALUES
('S1', 4, 'Grade 10', 'High School A'),
('S2', 5, 'Grade 11', 'High School B');

-- Insert test payments
INSERT INTO Payments (amount, status, paymentMethod, transactionID) VALUES
(100.00, 'Completed', 'Credit Card', 'TRX123456'),
(150.00, 'Pending', 'Bank Transfer', 'TRX123457'),
(200.00, 'Completed', 'Credit Card', 'TRX123458');

-- Insert test classes
INSERT INTO Classes (className, subject, tutorID, studentID, paymentID, length, price, description) VALUES
('Advanced Mathematics', 'Mathematics', 'T1', 'S1', 1, 60, 100.00, 'Advanced math concepts for high school students'),
('Physics Basics', 'Physics', 'T2', 'S2', 2, 90, 150.00, 'Introduction to physics principles'),
('Calculus 101', 'Mathematics', 'T1', NULL, NULL, 60, 200.00, 'Basic calculus course');

-- Insert test complains
INSERT INTO Complains (uID, message, status) VALUES
(4, 'The class schedule is not convenient', 'Pending'),
(5, 'Need more practice materials', 'Resolved');

-- Insert test messages
INSERT INTO Messages (senderID, receiverID, messageText, senderType, receiverType) VALUES
(4, 2, 'Hello, I have a question about the math assignment', 'Student', 'Tutor'),
(2, 4, 'Sure, what would you like to know?', 'Tutor', 'Student'),
(5, 3, 'Can we schedule a physics tutoring session?', 'Student', 'Tutor'),
(3, 5, 'Yes, I have availability tomorrow at 2 PM', 'Tutor', 'Student'),
(4, 6, 'I need help with a technical issue', 'Student', 'Moderator'),
(6, 4, 'I can help you with that. What seems to be the problem?', 'Moderator', 'Student'); 