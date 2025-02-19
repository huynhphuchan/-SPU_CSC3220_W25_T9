--
-- File generated with SQLiteStudio v3.4.16 on Wed Feb 19 12:48:49 2025
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Project
DROP TABLE IF EXISTS Project;

CREATE TABLE IF NOT EXISTS Project (
    Project_id  INTEGER NOT NULL
                        PRIMARY KEY AUTOINCREMENT,
    Name        TEXT    NOT NULL,
    Description TEXT,
    Status      TEXT    NOT NULL,
    Progress    INTEGER NOT NULL
);


-- Table: Reminder
DROP TABLE IF EXISTS Reminder;

CREATE TABLE IF NOT EXISTS Reminder (
    Reminder_id   INTEGER PRIMARY KEY AUTOINCREMENT
                          NOT NULL,
    Title         TEXT    NOT NULL,
    Due_date      TEXT    NOT NULL,
    Reminder_date TEXT    NOT NULL,
    Priority      INTEGER NOT NULL,
    Project_id    INTEGER REFERENCES Project (Project_id),
    Task_id       INTEGER REFERENCES Task (Task_id) 
);


-- Table: Task
DROP TABLE IF EXISTS Task;

CREATE TABLE IF NOT EXISTS Task (
    Task_id            INTEGER PRIMARY KEY AUTOINCREMENT
                               NOT NULL,
    Is_recurring       INTEGER NOT NULL,
    Recurring_interval INTEGER NOT NULL,
    Title              TEXT    NOT NULL,
    Project_id         INTEGER REFERENCES Project (Project_id) 
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
