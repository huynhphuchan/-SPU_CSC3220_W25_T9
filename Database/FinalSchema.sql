--
-- File generated with SQLiteStudio v3.4.16 on Fri Feb 21 14:46:07 2025
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: projectID
DROP TABLE IF EXISTS projectID;

CREATE TABLE IF NOT EXISTS projectID (
    Project_ID  INTEGER PRIMARY KEY AUTOINCREMENT,
    Name        TEXT    NOT NULL,
    Description TEXT,
    status      TEXT    NOT NULL
                        REFERENCES Status (status) 
);

-- Table: Reminder
DROP TABLE IF EXISTS Reminder;

CREATE TABLE IF NOT EXISTS Reminder (
    Reminder_id   INTEGER PRIMARY KEY AUTOINCREMENT,
    Title         TEXT    NOT NULL,
    Due_Date      TEXT    NOT NULL,
    Priority      INTEGER CHECK (Priority BETWEEN 1 AND 5),
    Reminder_date TEXT    NOT NULL,
    Project_ID    INTEGER NOT NULL
                          REFERENCES projectID (Project_ID),
    Task_ID       INTEGER REFERENCES Task (Task_ID) 
                          NOT NULL
);

-- Table: Task
DROP TABLE IF EXISTS Task;

CREATE TABLE IF NOT EXISTS Task (
    Task_ID            INTEGER PRIMARY KEY
                               NOT NULL,
    is_recurring       INTEGER NOT NULL,
    recurring_interval INTEGER NOT NULL,
    category           TEXT,
    Project_ID         INTEGER REFERENCES projectID (Project_ID) 
                               NOT NULL
);
COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
