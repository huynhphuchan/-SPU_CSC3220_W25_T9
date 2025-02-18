PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

DELETE FROM Project;
DELETE FROM sqlite_sequence WHERE name = 'Task';
DELETE FROM Task;
DELETE FROM sqlite_sequence WHERE name = 'Reminder';
DELETE FROM Reminder;

SELECT * FROM Reminder;

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;