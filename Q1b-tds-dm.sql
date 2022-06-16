--****PLEASE ENTER YOUR DETAILS BELOW****
--Q1b-tds-dm.sql
--Student ID: 31069282
--Student Name: Pavel Zemnukhov
--Tutorial No: 6

SET SERVEROUTPUT ON;


/* Comments for your marker:

*/


/*
1b(i) Create a sequence 
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE

DROP SEQUENCE offence_seq;
CREATE SEQUENCE offence_seq START WITH 100 INCREMENT BY 1;

/*
1b(ii) Take the necessary steps in the database to record data.
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE

INSERT INTO offence VALUES (offence_seq.nextval, to_date('10-Aug-2019 08:04 AM', 'DD-MON-YYYY HH:MI AM'),'Darling Rd, Malvern East between Maroora St and Washington Ln', (select dem_code from demerit where dem_description='Blood alcohol charge'), 10000011, 100389, 'JYA3HHE05RA070562');
commit;
INSERT INTO offence VALUES (offence_seq.nextval, to_date('16-Oct-2019 9:00 PM', 'DD-MON-YYYY HH:MI PM'),'37 Abbott St, Sandringham', (select dem_code from demerit where dem_description='Level crossing offence'), 10000015, 100389, 'JYA3HHE05RA070562');
commit;
INSERT INTO offence VALUES (offence_seq.nextval, to_date('7-Jan-2020 7:07 AM', 'DD-MON-YYYY HH:MI AM'),'Nepean Hwy, Brighton after Patterson Rd towards east', (select dem_code from demerit where dem_description='Exceeding the speed limit by 25 km/h or more'), 10000015, 100389, 'JYA3HHE05RA070562');
INSERT INTO suspension VALUES (100389, to_date('7-Jan-2020', 'DD-MON-YYYY'), ADD_MONTHS(to_date('7-Jan-2020', 'DD-MON-YYYY'),6));
commit;

/*
1b(iii) Take the necessary steps in the database to record changes. 
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE

UPDATE offence
SET
    dem_code = (
        SELECT
            dem_code
        FROM
            demerit
        WHERE
            dem_description = 'Exceeding the speed limit by 10 km/h or more but less than 25 km/h'
    )
WHERE
    lic_no = 100389
    AND off_datetime = TO_DATE('07-Jan-2020 7:07 AM', 'dd-Mon-yyyy HH:MI AM');

DELETE FROM suspension
WHERE
    lic_no = 100389;

COMMIT;







