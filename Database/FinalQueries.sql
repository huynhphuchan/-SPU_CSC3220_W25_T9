PRAGMA foreign_keys = off;
BEGIN TRANSACTION;


SELECT t.Title, t.Task_id,p.Progress, p.Status
FROM Task t
INNER JOIN Project p ON t.Project_id=p.Project_id
WHERE p.Name = 'Website Redesign';

UPDATE Project
SET Status = 'Completed', Progress = '100'
WHERE Name IN ('Mobile App Development','No Task Project');

INSERT INTO Reminder (Title, Due_date, Reminder_date, Priority, Task_id) 
SELECT 'Homepage Design First Draft', '2025-02-18', '2025-02-11', 1, Task_id 
FROM Task WHERE Title = 'Design new homepage';


DELETE FROM Reminder
WHERE Title = 'Homepage Design Finalization';


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
