--
-- File generated with SQLiteStudio v3.4.16 on Wed Feb 12 17:55:56 2025
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: project
CREATE TABLE project (
    Project_ID  INTEGER PRIMARY KEY AUTOINCREMENT,
    Name        TEXT    NOT NULL,
    Description TEXT,
    status      TEXT    NOT NULL
                        REFERENCES Status (status) 
);


-- Table: Reminder
CREATE TABLE Reminder (
    Reminder_id   INTEGER PRIMARY KEY AUTOINCREMENT,
    Title         TEXT    NOT NULL,
    Description   TEXT,
    Due_Date      TEXT    NOT NULL,
    Priority      INTEGER CHECK (Priority BETWEEN 1 AND 5),
    Reminder_date TEXT    NOT NULL,
    Project_ID    INTEGER NOT NULL
                          REFERENCES project (Project_ID) 
);


-- Table: Status
CREATE TABLE Status (
    status   TEXT    PRIMARY KEY,
    Progress INTEGER NOT NULL
);


-- Table: Task
CREATE TABLE Task (
    Task_ID           INTEGER PRIMARY KEY
                              NOT NULL,
    is_recuring       INTEGER NOT NULL,
    recuring_interval INTEGER NOT NULL,
    category          TEXT,
    Project_ID        INTEGER REFERENCES project (Project_ID) 
                              NOT NULL
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
