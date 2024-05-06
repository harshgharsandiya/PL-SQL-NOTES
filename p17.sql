--logon to database as sys dba or user have administer database trigger system privileges
--Alt + F10 = new sql worksheet

SHOW USER;

CREATE TABLE startup_audit (
    event_type VARCHAR(3O),
    event_date DATE,
    event_time VARCHAR(15)
);

CREATE OR REPLACE TRIGGER tr_startup_audit 
AFTER STARTUP ON DATABASE
BEGIN
    INSERT INTO startup_audit VALUES (
        ora_sysevent,
        SYSDATE,
        TO_CHAR(sysdate, 'hh24:mm:ss')
    );
END;
/
