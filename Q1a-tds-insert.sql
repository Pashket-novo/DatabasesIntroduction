--****PLEASE ENTER YOUR DETAILS BELOW****
--Q1a-tds-insert.sql
--Student ID: 31069282
--Student Name: Pavel Zemnukhov
--Tutorial No: 6

SET SERVEROUTPUT ON;


/* Comments for your marker:

*/

/*
1(a) Load selected tables with your own additional test data
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE

INSERT INTO offence VALUES (1, to_date('1-Jan-2016 14:10', 'DD-MON-YYYY HH24:MI'),'Whitehorse road, Box Hill between Station street and Watts street', 110, 10000004, 100241, 'WBAAM333XYKC67114');
commit;
INSERT INTO offence VALUES (2, to_date('24-Feb-2016 11:36', 'DD-MON-YYYY HH24:MI'),'Intersection of Booran road and Forch street,Ormond', 107, 10000015, 100239, 'JM0ER10L200236251');
commit;
INSERT INTO offence VALUES (3, to_date('24-Feb-2016 11:36', 'DD-MON-YYYY HH24:MI'),'Intersection of Booran road and Forch street,Ormond', 102, 10000015, 100239, 'JM0ER10L200236251');
commit;
INSERT INTO offence VALUES (4, to_date('4-May-2016 17:14', 'DD-MON-YYYY HH24:MI'),'Bakers road, Hawthorn in front of building 348', 127, 10000017, 100294, 'JT4RN55D1J7027072');
commit;
INSERT INTO offence VALUES (5, to_date('18-May-2016 23:44', 'DD-MON-YYYY HH24:MI'),'Traffic light at Coleman Rd and Gateshead Dr, Wantirna South', 130, 10000006, 100239, 'JM0ER10L200236251');
commit;
INSERT INTO offence VALUES (6, to_date('18-May-2016 23:44', 'DD-MON-YYYY HH24:MI'),'Traffic light at Coleman Rd and Gateshead Dr, Wantirna South', 100, 10000006, 100239, 'JM0ER10L200236251');
INSERT INTO suspension VALUES (100239, to_date('18-May-2016', 'DD-MON-YYYY'), to_date('18-Nov-2016', 'DD-MON-YYYY'));
commit;
INSERT INTO offence VALUES (7, to_date('15-Jul-2016 10:16', 'DD-MON-YYYY HH24:MI'),'State route 40, Chelsea Heights towards east in front of Egret Dr', 99, 10000001, 100001, '1HFSC2213SA700065');
commit;
INSERT INTO offence VALUES (8, to_date('25-Dec-2016 15:15', 'DD-MON-YYYY HH24:MI'),'Intersection Dolphin St and Foam St, Aspendale', 118, 10000002, 100003, 'ZHWEF4ZF2LLA13803');
commit;
INSERT INTO offence VALUES (9, to_date('2-Jan-2017 00:33', 'DD-MON-YYYY HH24:MI'),'Sophia Ave, Aspendale in front of house 5', 111, 10000003, 100005, 'WAUZZZF15KD038432');
commit;
INSERT INTO offence VALUES (10, to_date('4-Feb-2017 07:40', 'DD-MON-YYYY HH24:MI'),'State Route 12, Braeside toward east after Industrial dr', 104, 10000004, 100007, '6FMM12H83HD808815');
commit;
INSERT INTO offence VALUES (11, to_date('7-Mar-2017 14:41', 'DD-MON-YYYY HH24:MI'),'Intersection Nepean Hwy and McLeod Rd,Carrum', 109, 10000005, 100009, '1HD4CP2169K423351');
commit;
INSERT INTO offence VALUES (12, to_date('19-Apr-2017 19:22', 'DD-MON-YYYY HH24:MI'),'Colemans Rd, Carrum Downs between Access way and Progress Dr', 115, 10000005, 100007, '6FMM12H83HD808815');
commit;
INSERT INTO offence VALUES (13, to_date('19-Apr-2017 19:22', 'DD-MON-YYYY HH24:MI'),'Colemans Rd, Carrum Downs between Access way and Progress Dr', 110, 10000005, 100007, '6FMM12H83HD808815');
commit;
INSERT INTO offence VALUES (14, to_date('21-Jun-2017 05:55', 'DD-MON-YYYY HH24:MI'),'Frankston - Dandenong Rd, Carrum Downs in front of Yazaki Way', 123, 10000007, 100011, 'ZHWES4ZF8KLA12259');
commit;
INSERT INTO offence VALUES (15, to_date('12-Aug-2017 12:32', 'DD-MON-YYYY HH24:MI'),'Rowellyn Ave, Carrum Downs by building 5', 119, 10000009, 100007, '6FMM12H83HD808815');
INSERT INTO suspension VALUES (100007, to_date('12-Aug-2017', 'DD-MON-YYYY'), to_date('12-Feb-2018', 'DD-MON-YYYY'));
commit;
INSERT INTO offence VALUES (16, to_date('11-Sep-2017 03:03', 'DD-MON-YYYY HH24:MI'),'Boyd Ave, Oakleigh East in front of house 8', 106, 10000010, 100013, '6FMM12H83HD808815');
commit;
INSERT INTO offence VALUES (17, to_date('20-Oct-2017 17:38', 'DD-MON-YYYY HH24:MI'),'K-Mart parking lot Princes Hwy, Clayton', 108, 10000013, 100239, 'JM0ER10L200236251');
commit;
INSERT INTO offence VALUES (18, to_date('13-Nov-2017 22:22', 'DD-MON-YYYY HH24:MI'),'Rayhur St and Kombi Road, Clayton South', 125, 10000014, 100021, 'MPATFS85JDT005836');
commit;
INSERT INTO offence VALUES (19, to_date('03-Jan-2018 10:14', 'DD-MON-YYYY HH24:MI'),'Nursery Ave, Clayton South service road Australian unity', 122, 10000016, 100037, 'JYA3HHE05RA070562');
commit;
INSERT INTO offence VALUES (20, to_date('10-Feb-2018 19:18', 'DD-MON-YYYY HH24:MI'),'Redpath Cres, Springvale', 99, 10000018, 100011, 'ZHWES4ZF8KLA12259');
commit;
INSERT INTO offence VALUES (21, to_date('10-Feb-2018 19:18', 'DD-MON-YYYY HH24:MI'),'Redpath Cres, Springvale', 100, 10000018, 100011, 'ZHWES4ZF8KLA12259');
commit;
INSERT INTO offence VALUES (22, to_date('22-Mar-2018 04:44', 'DD-MON-YYYY HH24:MI'),'In front of 54-20 Gray St, Springvale', 116, 10000019, 100040, 'WDB9506422L330446');
commit;
INSERT INTO offence VALUES (23, to_date('28-Apr-2018 13:33', 'DD-MON-YYYY HH24:MI'),'Springvale Rd, Springvale behind Puma gas station', 106, 10000020, 100011, 'ZHWES4ZF8KLA12259');
INSERT INTO suspension VALUES (100011, to_date('28-Apr-2018', 'DD-MON-YYYY'), to_date('28-Oct-2018', 'DD-MON-YYYY'));
commit;
INSERT INTO offence VALUES (24, to_date('31-Jul-2018 17:17', 'DD-MON-YYYY HH24:MI'),'Heatherton Rd, Springvale South behind McDonalds towards south', 131, 10000021, 100235, '1HFSC3901XA100459');
commit;
INSERT INTO offence VALUES (25, to_date('29-Sep-2018 14:10', 'DD-MON-YYYY HH24:MI'),'Bambara St and Milpera Cres intersection, Wantirna', 124, 10000004, 100037, 'JYA3HHE05RA070562');
commit;
INSERT INTO offence VALUES (26, to_date('13-Oct-2018 02:01', 'DD-MON-YYYY HH24:MI'),'Miriam Cl, Wantirna South dead end', 120, 10000010, 100247, '5UXZV4C52BL739734');
commit;
INSERT INTO offence VALUES (27, to_date('26-Oct-2018 11:11', 'DD-MON-YYYY HH24:MI'),'State Route 28, Wantirna towards south after Remington Pl', 99, 10000009, 100037, 'JYA3HHE05RA070562');
commit;
INSERT INTO offence VALUES (28, to_date('4-Jan-2019 10:10', 'DD-MON-YYYY HH24:MI'),'Dudley Ave, Wantirna in front of house 4', 103, 10000002, 100249, 'JA3AJ46EX2U027924');
commit;
INSERT INTO offence VALUES (29, to_date('10-Jan-2019 12:56', 'DD-MON-YYYY HH24:MI'),'Canterbury Rd, Forest Hill in front of KFC', 109, 10000010, 100037, 'JYA3HHE05RA070562');
INSERT INTO suspension VALUES (100037, to_date('10-Jan-2019', 'DD-MON-YYYY'), to_date('10-Jul-2019', 'DD-MON-YYYY'));
commit;
INSERT INTO offence VALUES (30, to_date('7-Feb-2019 13:49', 'DD-MON-YYYY HH24:MI'),'Canterbury Rd, Forest Hill service rd towards Thornhill Dr', 113, 10000004, 100312, 'JHEFY1EUPA0010911');
commit;
INSERT INTO offence VALUES (31, to_date('16-Mar-2019 01:11', 'DD-MON-YYYY HH24:MI'),'Intersection Wilkes Pl and State Route 23, Blackburn South', 126, 10000015, 100258, '5XYKWDA70EG526849');
commit;
INSERT INTO offence VALUES (32, to_date('20-May-2019 12:18', 'DD-MON-YYYY HH24:MI'),'Sim Ct, Box Hill South dead end', 120, 10000009, 100398, 'VF1AA39A0C0105476');
commit;
INSERT INTO offence VALUES (33, to_date('25-May-2019 15:17', 'DD-MON-YYYY HH24:MI'),'33 Franklyn St, Huntingdale', 120, 10000010, 100383, 'JN8DR09X24W803357');
commit;
INSERT INTO offence VALUES (34, to_date('29-May-2019 05:23', 'DD-MON-YYYY HH24:MI'),'Bulban Rd intersection with Racecourse Rd, Werribee', 117, 10000011, 100094, 'SALTK12471A294286');
commit;
INSERT INTO offence VALUES (35, to_date('1-Jun-2019 13:59', 'DD-MON-YYYY HH24:MI'),'500 Geelong Ring Rd, Lovely Banks Truckstop', 117, 10000011, 100094, 'SALTK12471A294286');
commit;
INSERT INTO offence VALUES (36, to_date('2-Jun-2019 10:40', 'DD-MON-YYYY HH24:MI'),'Ballan Rd, Anakie behind Staughton Vale Rd', 128, 10000011, 100011, '2T2BKAB1XFC289347');
commit;
INSERT INTO offence VALUES (37, to_date('5-Jun-2019 00:45', 'DD-MON-YYYY HH24:MI'),'11-25 Brunel St, Lethbridge', 129, 10000011, 100094, 'SALTK12471A294286');
commit;
INSERT INTO offence VALUES (38, to_date('6-Jun-2019 13:13', 'DD-MON-YYYY HH24:MI'),'C143  towards east between Tolson St and Cunningham St, Shelford', 127, 10000003, 100294, 'JT4RN55D1J7027072');
commit;
INSERT INTO offence VALUES (39, to_date('7-Jun-2019 10:18', 'DD-MON-YYYY HH24:MI'),'154-144 Beach St, Frankston', 117, 10000012, 100379, 'WMWRE334X2PD53395');
commit;
INSERT INTO offence VALUES (40, to_date('10-Jun-2019 02:22', 'DD-MON-YYYY HH24:MI'),'Burrow St intersection Stanley St, Frankston', 117, 10000003, 100379, 'WMWRE334X2PD53395');
commit;
INSERT INTO offence VALUES (41, to_date('12-Jun-2019 19:19', 'DD-MON-YYYY HH24:MI'),'28 Seaford Rd, Seaford', 117, 10000009, 100379, 'WMWRE334X2PD53395');
commit;