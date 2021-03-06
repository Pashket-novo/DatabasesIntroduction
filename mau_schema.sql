-- Generated by Oracle SQL Developer Data Modeler 19.2.0.182.1216
--   at:        2020-05-12 20:30:55 AEST
--   site:      Oracle Database 12c
--   type:      Oracle Database 12c

--student id: 31069282
--student name: Pavel Zemnukhov

SET ECHO ON
SPOOL mau_schema_output.txt


DROP TABLE artist CASCADE CONSTRAINTS;

DROP TABLE artwork CASCADE CONSTRAINTS;

DROP TABLE artwork_style CASCADE CONSTRAINTS;

DROP TABLE customer CASCADE CONSTRAINTS;

DROP TABLE exhibit CASCADE CONSTRAINTS;

DROP TABLE gallery CASCADE CONSTRAINTS;

DROP TABLE sale CASCADE CONSTRAINTS;

DROP TABLE status_history CASCADE CONSTRAINTS;

CREATE TABLE artist (
    artist_code           NUMBER(5) NOT NULL,
    artist_givenname      VARCHAR2(30),
    artist_famname        VARCHAR2(30),
    artist_street         VARCHAR2(40) NOT NULL,
    artist_town           VARCHAR2(30) NOT NULL,
    artist_state          CHAR(3) NOT NULL,
    artist_phone          CHAR(10),
    artiist_qtq_artwork   NUMBER(4) NOT NULL
);

COMMENT ON COLUMN artist.artist_code IS
    'artist number';

COMMENT ON COLUMN artist.artist_givenname IS
    'artist given name';

COMMENT ON COLUMN artist.artist_famname IS
    'artist family name';

COMMENT ON COLUMN artist.artist_street IS
    'artist street';

COMMENT ON COLUMN artist.artist_town IS
    'artist town';

COMMENT ON COLUMN artist.artist_state IS
    'artist state';

COMMENT ON COLUMN artist.artist_phone IS
    'artist phone';

COMMENT ON COLUMN artist.artiist_qtq_artwork IS
    'number of artworks';

ALTER TABLE artist ADD CONSTRAINT artist_pk PRIMARY KEY ( artist_code );

CREATE TABLE artwork (
    artwork_id           NUMBER(7) NOT NULL,
    artwork_no           NUMBER(5) NOT NULL,
    artist_code          NUMBER(5) NOT NULL,
    artwork_title        VARCHAR2(50) NOT NULL,
    artwork_date_stock   DATE NOT NULL,
    artwork_min_price    NUMBER(7, 2) NOT NULL,
    artwork_media_desc   VARCHAR2(100) NOT NULL,
    artwork_style_name   VARCHAR2(100) NOT NULL
);

COMMENT ON COLUMN artwork.artwork_id IS
    'surrogate key';

COMMENT ON COLUMN artwork.artwork_no IS
    'artwork number';

COMMENT ON COLUMN artwork.artist_code IS
    'artist number';

COMMENT ON COLUMN artwork.artwork_title IS
    'artwork title';

COMMENT ON COLUMN artwork.artwork_date_stock IS
    'artwork date add to stock';

COMMENT ON COLUMN artwork.artwork_min_price IS
    'artwork minumum price';

COMMENT ON COLUMN artwork.artwork_media_desc IS
    'artwork media description';

COMMENT ON COLUMN artwork.artwork_style_name IS
    'artwork style name';

CREATE UNIQUE INDEX artwork__idx ON
    artwork (
        artwork_style_name
    ASC );

ALTER TABLE artwork ADD CONSTRAINT artwork_pk PRIMARY KEY ( artwork_id );

ALTER TABLE artwork ADD CONSTRAINT nk_artwork UNIQUE ( artwork_no,
                                                       artist_code );

CREATE TABLE artwork_style (
    artwork_style_name   VARCHAR2(100) NOT NULL,
    parent_style_name    VARCHAR2(100)
);

COMMENT ON COLUMN artwork_style.artwork_style_name IS
    'artwork style name';

COMMENT ON COLUMN artwork_style.parent_style_name IS
    'artwork style name';

ALTER TABLE artwork_style ADD CONSTRAINT artwork_style_pk PRIMARY KEY ( artwork_style_name
);

CREATE TABLE customer (
    cust_id              NUMBER(7) NOT NULL,
    cust_famname         VARCHAR2(30),
    cust_givenname       VARCHAR2(30),
    cust_street          VARCHAR2(40) NOT NULL,
    cust_town            VARCHAR2(30) NOT NULL,
    cust_state           CHAR(3) NOT NULL,
    cust_phone           CHAR(10) NOT NULL,
    cust_business_name   VARCHAR2(50)
);

COMMENT ON COLUMN customer.cust_id IS
    'customer id';

COMMENT ON COLUMN customer.cust_famname IS
    'customer family name';

COMMENT ON COLUMN customer.cust_givenname IS
    'customer given name';

COMMENT ON COLUMN customer.cust_street IS
    'customer street';

COMMENT ON COLUMN customer.cust_town IS
    'customer street';

COMMENT ON COLUMN customer.cust_state IS
    'customer state';

COMMENT ON COLUMN customer.cust_phone IS
    'customer phone';

COMMENT ON COLUMN customer.cust_business_name IS
    'customer business name';

ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY ( cust_id );

CREATE TABLE exhibit (
    exhibit_id         NUMBER(7) NOT NULL,
    artwork_id         NUMBER(7) NOT NULL,
    gallery_id         NUMBER(4) NOT NULL,
    date_exhib_start   DATE NOT NULL, 
/*  featured in catalogue*/
    feautured_in_cat   CHAR(3) NOT NULL,
    date_exhib_end     DATE
);

ALTER TABLE exhibit
    ADD CONSTRAINT chk_catalog CHECK ( feautured_in_cat IN (
        'N',
        'Y'
    ) );

COMMENT ON COLUMN exhibit.exhibit_id IS
    'surrogate key';

COMMENT ON COLUMN exhibit.artwork_id IS
    'surrogate key';

COMMENT ON COLUMN exhibit.gallery_id IS
    'gallery id';

COMMENT ON COLUMN exhibit.date_exhib_start IS
    'Date exhibit started';

COMMENT ON COLUMN exhibit.feautured_in_cat IS
    'Featured in Catalog';

COMMENT ON COLUMN exhibit.date_exhib_end IS
    'Date exhibit ended';

ALTER TABLE exhibit ADD CONSTRAINT exhibit_pk PRIMARY KEY ( exhibit_id );

ALTER TABLE exhibit ADD CONSTRAINT nk_exhibit UNIQUE ( gallery_id,
                                                       artwork_id );

CREATE TABLE gallery (
    gallery_id          NUMBER(4) NOT NULL,
    gallery_comission   NUMBER(3) NOT NULL,
    gallery_name        VARCHAR2(100) NOT NULL,
    gallery_man_fname   VARCHAR2(30),
    gallery_man_gname   VARCHAR2(30),
    gallery_street      VARCHAR2(40) NOT NULL,
    gallery_town        VARCHAR2(30) NOT NULL,
    gallery_state       CHAR(3) NOT NULL,
    gallery_phone       CHAR(10) NOT NULL,
    gallery_open        DATE NOT NULL,
    gallery_close       DATE NOT NULL
);

COMMENT ON COLUMN gallery.gallery_id IS
    'gallery id';

COMMENT ON COLUMN gallery.gallery_comission IS
    'gallery commision';

COMMENT ON COLUMN gallery.gallery_name IS
    'gallery name';

COMMENT ON COLUMN gallery.gallery_man_fname IS
    'gallery manager''s family name';

COMMENT ON COLUMN gallery.gallery_man_gname IS
    'gallery manager''s given name';

COMMENT ON COLUMN gallery.gallery_street IS
    'gallery street';

COMMENT ON COLUMN gallery.gallery_town IS
    'gallery town';

COMMENT ON COLUMN gallery.gallery_state IS
    'gallery_state';

COMMENT ON COLUMN gallery.gallery_phone IS
    'gallery phone';

COMMENT ON COLUMN gallery.gallery_open IS
    'glallery opens';

COMMENT ON COLUMN gallery.gallery_close IS
    'gallery closes';

ALTER TABLE gallery ADD CONSTRAINT gallery_pk PRIMARY KEY ( gallery_id );

CREATE TABLE sale (
    sale_id      NUMBER(7) NOT NULL,
    sale_date    DATE NOT NULL,
    sale_price   NUMBER(7, 2) NOT NULL,
    cust_id      NUMBER(7) NOT NULL,
    exhibit_id   NUMBER(7) NOT NULL
);

COMMENT ON COLUMN sale.sale_id IS
    'sale id';

COMMENT ON COLUMN sale.sale_date IS
    'sale date';

COMMENT ON COLUMN sale.sale_price IS
    'sale price';

COMMENT ON COLUMN sale.cust_id IS
    'customer id';

COMMENT ON COLUMN sale.exhibit_id IS
    'surrogate key';

CREATE UNIQUE INDEX sale__idx ON
    sale (
        exhibit_id
    ASC );

ALTER TABLE sale ADD CONSTRAINT sale_pk PRIMARY KEY ( sale_id );

CREATE TABLE status_history (
    artwork_status_date   DATE NOT NULL,
    artwork_id            NUMBER(7) NOT NULL,
    artwork_status        VARCHAR2(50) NOT NULL,
    gallery_id            NUMBER(4)
);

ALTER TABLE status_history
    ADD CONSTRAINT chk_art_stat CHECK ( artwork_status IN (
        'D',
        'R',
        'S',
        'T',
        'W'
    ) );

COMMENT ON COLUMN status_history.artwork_status_date IS
    'artwork status date';

COMMENT ON COLUMN status_history.artwork_id IS
    'surrogate key';

COMMENT ON COLUMN status_history.artwork_status IS
    'artwork status (in MAU warehouse, in transit, on display, sold, returned)';

COMMENT ON COLUMN status_history.gallery_id IS
    'gallery id';

ALTER TABLE status_history ADD CONSTRAINT status_history_pk PRIMARY KEY ( artwork_status_date
,
                                                                          artwork_id
                                                                          );

ALTER TABLE artwork_style
    ADD CONSTRAINT art_style_par_style FOREIGN KEY ( parent_style_name )
        REFERENCES artwork_style ( artwork_style_name );

ALTER TABLE artwork
    ADD CONSTRAINT artist_artwork FOREIGN KEY ( artist_code )
        REFERENCES artist ( artist_code );

ALTER TABLE status_history
    ADD CONSTRAINT artw_stat_hist FOREIGN KEY ( artwork_id )
        REFERENCES artwork ( artwork_id );

ALTER TABLE exhibit
    ADD CONSTRAINT artwork_exhibit FOREIGN KEY ( artwork_id )
        REFERENCES artwork ( artwork_id );

ALTER TABLE artwork
    ADD CONSTRAINT artwork_style FOREIGN KEY ( artwork_style_name )
        REFERENCES artwork_style ( artwork_style_name );

ALTER TABLE sale
    ADD CONSTRAINT customer_sale FOREIGN KEY ( cust_id )
        REFERENCES customer ( cust_id );

ALTER TABLE sale
    ADD CONSTRAINT exhibit_sale FOREIGN KEY ( exhibit_id )
        REFERENCES exhibit ( exhibit_id );

ALTER TABLE status_history
    ADD CONSTRAINT gall_stat_hist FOREIGN KEY ( gallery_id )
        REFERENCES gallery ( gallery_id );

ALTER TABLE exhibit
    ADD CONSTRAINT gallery_exhibit FOREIGN KEY ( gallery_id )
        REFERENCES gallery ( gallery_id );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                             2
-- ALTER TABLE                             21
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- TSDP POLICY                              0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0

SPOOL OFF
SET ECHO OFF
