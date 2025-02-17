PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

INSERT INTO Project (Name, Description, Status, Progress) VALUES
('Website Redesign', 'Revamp the company website for better UX', 'In Progress', 40),
('Mobile App Development', 'Build a mobile app for the product', 'In Progress', 20),
('No Task Project', 'This project has no tasks', 'Planned', 0);

INSERT INTO Task (Is_recurring, Recurring_interval, Title, Project_id) 
SELECT 0, 0, 'Design new homepage', Project_id FROM Project WHERE Name = 'Website Redesign';
INSERT INTO Task (Is_recurring, Recurring_interval, Title, Project_id) 
SELECT 0, 0, 'Optimize loading speed', Project_id FROM Project WHERE Name = 'Website Redesign';
INSERT INTO Task (Is_recurring, Recurring_interval, Title, Project_id) 
SELECT 1, 7, 'Weekly app testing', Project_id FROM Project WHERE Name = 'Mobile App Development';

INSERT INTO Reminder (Title, Due_date, Reminder_date, Priority, Project_id) 
SELECT 'Website Launch Reminder', '2025-03-01', '2025-02-28', 1, Project_id FROM Project WHERE Name = 'Website Redesign';
INSERT INTO Reminder (Title, Due_date, Reminder_date, Priority, Project_id) 
SELECT 'App Release Deadline', '2025-03-10', '2025-03-09', 1, Project_id FROM Project WHERE Name = 'Mobile App Development';
INSERT INTO Reminder (Title, Due_date, Reminder_date, Priority, Project_id) 
SELECT 'No Task Project Reminder', '2025-04-01', '2025-03-31', 3, Project_id FROM Project WHERE Name = 'No Task Project';

INSERT INTO Reminder (Title, Due_date, Reminder_date, Priority, Task_id) 
SELECT 'Homepage Design Finalization', '2025-02-25', '2025-02-24', 1, Task_id 
FROM Task WHERE Title = 'Design new homepage';
INSERT INTO Reminder (Title, Due_date, Reminder_date, Priority, Task_id) 
SELECT 'Speed Optimization Check', '2025-02-27', '2025-02-26', 2, Task_id 
FROM Task WHERE Title = 'Optimize loading speed';
INSERT INTO Reminder (Title, Due_date, Reminder_date, Priority, Task_id) 
SELECT 'Weekly Testing Reminder', '2025-02-21', '2025-02-20', 2, Task_id 
FROM Task WHERE Title = 'Weekly app testing';

UPDATE Project
SET Status = 'Completed', Progress = 100
WHERE Name = 'Website Redesign';

UPDATE Reminder
SET Reminder_date = '2025-02-23'
WHERE Title = 'Homepage Design Finalization';


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
