--****PLEASE ENTER YOUR DETAILS BELOW****
--Q3-tds-mods.sql
--Student ID:
--Student Name:
--Tutorial No: 

/* Comments for your marker:

*/


/*
3(i) Changes to live database 1
*/
--PLEASE PLACE REQUIRED SQL STATEMENTS FOR THIS PART HERE

ALTER TABLE officer ADD (
    officer_qty_booked NUMBER(8)
);

COMMENT ON COLUMN officer.officer_qty_booked IS
    'Number of times booked';

UPDATE officer o
SET
    o.officer_qty_booked = (
        SELECT
            total
        FROM
            (
                SELECT
                    officer_id,
                    COUNT(*) AS total
                FROM
                    officer
                    NATURAL JOIN offence
                    NATURAL JOIN driver
                GROUP BY
                    officer_id
            ) t
        WHERE
            t.officer_id = o.officer_id
    );

COMMIT;

/*
3(ii) Changes to live database 2
*/
--PLEASE PLACE REQUIRED SQL STATEMENTS FOR THIS PART HERE

-------------------------

------------------------------
--CREATE TABLE statements
--
DROP TABLE revoked_offence CASCADE CONSTRAINTS PURGE;

DROP TABLE revoke_reason CASCADE CONSTRAINTS PURGE;

CREATE TABLE revoked_offence (
    off_no             NUMBER(8) NOT NULL,
    rev_off_date       DATE NOT NULL,
    officer_id         NUMBER(8) NOT NULL,
    revoke_reason_id   NUMBER(4) NOT NULL
);

COMMENT ON COLUMN revoked_offence.off_no IS
    'Offence number';

COMMENT ON COLUMN revoked_offence.rev_off_date IS
    'Date of offence revoke';

COMMENT ON COLUMN revoked_offence.officer_id IS
    'Officer revoked offence';

COMMENT ON COLUMN revoked_offence.revoke_reason_id IS
    'Identifier for revoked reason';


ALTER TABLE revoked_offence ADD CONSTRAINT revoked_offence_pk PRIMARY KEY ( off_no
,
                                                                            rev_off_date
                                                                            );
                                                                                                                         

CREATE TABLE revoke_reason (
    revoke_reason_id     NUMBER(4) NOT NULL,
    revoke_reason_desc   CHAR(3) NOT NULL
);
COMMENT ON COLUMN revoke_reason.revoke_reason_id IS
    'Identifier for revoke reason';

COMMENT ON COLUMN revoke_reason.revoke_reason_desc IS
    'Revoke reason
    FOS = First offence exceeding the speed limit by less than 10km/h
    FEU = Faulty equipment used
    DOU = Driver objection upheld
    COH = Court hearing
    EIP = Error in proceedings
    '
    ;
ALTER TABLE revoke_reason ADD CONSTRAINT revoke_reason_pk PRIMARY KEY ( revoke_reason_id );

ALTER TABLE revoke_reason ADD CONSTRAINT revoke_reason_desc_uk UNIQUE ( revoke_reason_desc ); 

ALTER TABLE revoked_offence
    ADD CONSTRAINT revoke_reason_fk FOREIGN KEY ( revoke_reason_id )
        REFERENCES revoke_reason ( revoke_reason_id );
        
ALTER TABLE revoked_offence
    ADD CONSTRAINT offence_revoked_offence FOREIGN KEY ( off_no )
        REFERENCES offence ( off_no );

ALTER TABLE revoked_offence
    ADD CONSTRAINT officer_revoked_offence FOREIGN KEY ( officer_id )
        REFERENCES officer ( officer_id );

ALTER TABLE offence ADD (
    offence_revoked VARCHAR(3)
);

ALTER TABLE offence
    ADD CHECK ( offence_revoked IN (
        'Yes',
        'No'
    ) );

COMMENT ON COLUMN offence.offence_revoked IS
    'Offence revoked or not';

UPDATE offence
SET
    offence_revoked = 'No';

ALTER TABLE offence MODIFY (
    offence_revoked NOT NULL
);


/*
3(iii) Changes to live database 3
*/
--PLEASE PLACE REQUIRED SQL STATEMENTS FOR THIS PART HERE


DROP TABLE colour CASCADE CONSTRAINTS PURGE;

CREATE TABLE colour (
    col_number   NUMBER(6) NOT NULL,
    col_descr    VARCHAR(30) NOT NULL
);

COMMENT ON COLUMN colour.col_number IS
    'unique colour numberr';

COMMENT ON COLUMN colour.col_descr IS
    'colour description';

ALTER TABLE colour ADD CONSTRAINT colour_pk PRIMARY KEY ( col_number );

ALTER TABLE colour ADD CONSTRAINT colour_uk UNIQUE ( col_descr );

DROP SEQUENCE colour_seq;

CREATE SEQUENCE colour_seq START WITH 1 INCREMENT BY 1;

INSERT INTO colour
    ( SELECT
        colour_seq.NEXTVAL,
        color
    FROM
        (
            SELECT DISTINCT
                veh_maincolor AS color
            FROM
                vehicle
        )
    );


UPDATE vehicle v
SET
    v.col_number = (
        SELECT
            c.col_number
        FROM
            colour c
        WHERE
            c.col_descr = v.veh_maincolor
    );
    
ALTER TABLE vehicle
    ADD CONSTRAINT colour_vehicle_fk FOREIGN KEY ( col_number )
        REFERENCES colour ( col_number );

COMMENT ON COLUMN vehicle.col_number IS
    'color identification';
        
DROP TABLE outer_parts_colour CASCADE CONSTRAINTS PURGE;

CREATE TABLE outer_parts (
    out_part_id     NUMBER(6) NOT NULL,
    out_part_code   CHAR(2) NOT NULL,
    col_number      NUMBER(6) NOT NULL,
    veh_vin         CHAR(17) NOT NULL
);

COMMENT ON COLUMN outer_parts.out_part_id IS
    'unique outer part number';

COMMENT ON COLUMN outer_parts.out_part_code IS
    'outer part code
    SP = spoiler
    BM = bumper
    GR = grilles
    ';

COMMENT ON COLUMN outer_parts.col_number IS
    'colour number';

COMMENT ON COLUMN outer_parts.veh_vin IS
    'vehicle vin';
    
ALTER TABLE outer_parts ADD CONSTRAINT outer_parts_pk PRIMARY KEY ( out_part_id);

ALTER TABLE outer_parts
    ADD CONSTRAINT colour_outer_parts_fk FOREIGN KEY ( col_number )
        REFERENCES colour ( col_number );

ALTER TABLE outer_parts
    ADD CONSTRAINT vehicle_outer_parts_fk FOREIGN KEY ( veh_vin )
        REFERENCES vehicle ( veh_vin );
        
ALTER TABLE vehicle DROP COLUMN veh_maincolor;

ALTER TABLE vehicle MODIFY (
    col_number NOT NULL
);






































