--TABLE 1
CREATE TABLE trainer
(
    full_name VARCHAR2(20)
);
--TABLE 2
CREATE TABLE subject
(
    subject_name VARCHAR2(20)
);
INSERT INTO trainer VALUES ('Manish Sharma');
INSERT INTO subject VALUES ('Oracle');

--VIEW
CREATE VIEW vw_RebellionRider AS
SELECT full_name, subject_name FROM trainer, subject;
--NOT UPDATABLE VIEW LETS SEE WHAT HAPPEN WHEN UPDATE
INSERT INTO vw_RebellionRider VALUES ('Manish', 'Java');

--Instead of INSERT trigger
CREATE OR REPLACE TRIGGER tr_io_insert
INSTEAD OF INSERT ON vw_RebellionRider
FOR EACH ROW
BEGIN 
    INSERT INTO trainer (full_name) VALUES (:new.full_name);
    INSERT INTO subject (subject_name) VALUES (:new.subject_name);
END;
/

INSERT INTO vw_RebellionRider VALUES ('Manish', 'Java');

SELECT * FROM trainer;
SELECT * FROM subject;



