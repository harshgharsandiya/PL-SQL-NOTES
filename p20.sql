DESC vw_RebellionRider;

--Instead of DELETE trigger
CREATE OR REPLACE TRIGGER io_delete
INSTEAD OF DELETE ON vw_RebellionRider
FOR EACH ROW
BEGIN
    DELETE FROM trainer WHERE full_name = :old.full_name;
    DELETE FROM subject WHERE subject_name = :old.subject_name;
END;
/

DELETE FROM vw_RebellionRider WHERE full_name = 'Tony Stark';