DESC hr_event_audit;
SELECT * FROM hr_event_audit
TRUNCATE TABLE hr_event_audit;

CREATE OR REPLACE TRIGGER log_off_audit
BEFORE LOGOFF ON SCHEMA
BEGIN
    INSERT INTO hr_event_audit VALUES (
        ora_sysevent,
        NULL,
        NULL,
        SYSDATE,
        TO_CHAR(sysdate, 'hh24:mi:ss')
    );
    COMMIT;
END;
/

SELECT * FROM hr_event_audit;

DISC;
CONN username/password;

SELECT * FROM hr_event_audit;

--logon with sys database which have high privileges--
SHOW USER;

CREATE TABLE db_event_audit (
    user_name VARCHAR(15),
    event_type VARCHAR(30),
    logon_date DATE,
    logon_time VARCHAR(15),
    logoff_date DATE,
    logoff_time VARCHAR(15)
);

SELECT * FROM db_event_audit;

--DATABASE LEVEL SYSTEM EVENT TRIGGER

CREATE OR REPLACE TRIGGER db_logof_audit
BEFORE LOGOFF ON DATABASE
BEGIN
    INSERT INTO db_event_audit VALUES (
        user,
        ora_sysevent,
        NULL,
        NULL,
        SYSDATE,
        TO_CHAR(sysdate, 'hh24:mi:ss')
    );
    COMMIT;
END;
/

SELECT * FROM db_event_audit;
SHOW USER;
DISC;


