DESC vw_RebellionRider;
--Not able to update view
UPDATE vw_RebellionRider SET full_name = 'Tony Stark'
WHERE subject_name = 'Java';

-- Instead Of Update Trigger
CREATE OR REPLACE TRIGGER io_update
INSTEAD OF UPDATE ON vw_RebellionRider
FOR EACH ROW
BEGIN
    UPDATE trainer SET full_name = :new.full_name
    WHERE full_name = :old.full_name;

    UPDATE subject SET subject_name = :new.subject_name
    WHERE subject_name = :old.subject_name;

END;
/

--Now you able to update view
UPDATE vw_RebellionRider SET full_name = 'Tony Stark'
WHERE subject_name = 'Java';