--****PLEASE ENTER YOUR DETAILS BELOW****
--Q2-tds-queries.sql
--Student ID: 31069282
--Student Name: Pavel Zemnukhov
--Tutorial No: 6

/* Comments for your marker:

*/


/*
2(i) Query 1
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE

SELECT
    dem_points        AS "Demerit Points",
    dem_description   AS "Demerit Description"
FROM
    demerit
WHERE
    dem_description LIKE '%heavy%'
    OR dem_description LIKE '%Heavy%'
    OR dem_description LIKE 'Exceed%'
ORDER BY
    dem_points,
    dem_description;

/*
2(ii) Query 2
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE

SELECT
    veh_maincolor   AS "Main Colour",
    veh_vin         AS vin,
    to_char(veh_yrmanuf, 'YYYY') AS "Year
Manufactured"
FROM
    vehicle
WHERE
    ( veh_modname = 'Range Rover'
      OR veh_modname = 'Range Rover Sport' )
    AND to_char(veh_yrmanuf, 'YYYY') BETWEEN '2012' AND '2014'
ORDER BY
    veh_yrmanuf DESC,
    veh_maincolor;

/*
2(iii) Query 3
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE

SELECT
    lic_no AS "Licence No.",
    lic_fname
    || ' '
    || lic_lname AS "Driver Fullname",
    to_char(lic_dob, 'DD-Mon-YYYY') AS dob,
    lic_street
    || ' '
    || lic_town
    || ' '
    || lic_postcode AS "Driver Address",
    to_char(sus_date, 'DD/MON/YY') AS "Suspended On",
    to_char(sus_enddate, 'DD/MON/YY') AS "Suspended Till"
FROM
    driver
    NATURAL JOIN suspension
WHERE
    to_date(sus_date) BETWEEN to_date(add_months(sysdate, - 30), 'DD/MON/YY') AND
    to_date(sysdate, 'DD/MON/YY')
ORDER BY
    lic_no,
    sus_date DESC;

/*
2(iv) Query 4
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE

SELECT
    d.dem_code          AS "Demerit Code",
    d.dem_description   AS "Demerit Description",
    COUNT(o.off_datetime) AS "Total Offences (All Months)",
    COUNT(
        CASE
            WHEN to_char(off_datetime, 'Mon') = 'Jan' THEN
                1
        END
    ) AS "Jan",
    COUNT(
        CASE
            WHEN to_char(off_datetime, 'Mon') = 'Feb' THEN
                1
        END
    ) AS "Feb",
    COUNT(
        CASE
            WHEN to_char(off_datetime, 'Mon') = 'Mar' THEN
                1
        END
    ) AS "Mar",
    COUNT(
        CASE
            WHEN to_char(off_datetime, 'Mon') = 'Apr' THEN
                1
        END
    ) AS "Apr",
    COUNT(
        CASE
            WHEN to_char(off_datetime, 'Mon') = 'May' THEN
                1
        END
    ) AS "May",
    COUNT(
        CASE
            WHEN to_char(off_datetime, 'Mon') = 'Jun' THEN
                1
        END
    ) AS "Jun",
    COUNT(
        CASE
            WHEN to_char(off_datetime, 'Mon') = 'Jul' THEN
                1
        END
    ) AS "Jul",
    COUNT(
        CASE
            WHEN to_char(off_datetime, 'Mon') = 'Aug' THEN
                1
        END
    ) AS "Aug",
    COUNT(
        CASE
            WHEN to_char(off_datetime, 'Mon') = 'Sep' THEN
                1
        END
    ) AS "Sep",
    COUNT(
        CASE
            WHEN to_char(off_datetime, 'Mon') = 'Oct' THEN
                1
        END
    ) AS "Oct",
    COUNT(
        CASE
            WHEN to_char(off_datetime, 'Mon') = 'Nov' THEN
                1
        END
    ) AS "Nov",
    COUNT(
        CASE
            WHEN to_char(off_datetime, 'Mon') = 'Dec' THEN
                1
        END
    ) AS "Dec"
FROM
    demerit   d
    LEFT JOIN offence   o
    ON d.dem_code = o.dem_code
GROUP BY
    d.dem_code,
    d.dem_description
ORDER BY
    "Total Offences (All Months)" DESC,
    d.dem_code;

/*
2(v) Query 5
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE

SELECT
    v.veh_manufname AS "Manufacturer Name",
    COUNT(v.veh_manufname) AS "Total No. of Offences"
FROM
    demerit   d
    JOIN offence   o
    ON d.dem_code = o.dem_code
    JOIN vehicle   v
    ON o.veh_vin = v.veh_vin
WHERE
    dem_points >= 2
GROUP BY
    v.veh_manufname
HAVING
    COUNT(v.veh_manufname) = (
        SELECT
            MAX(COUNT(v.veh_manufname))
        FROM
            demerit   d
            JOIN offence   o
            ON d.dem_code = o.dem_code
            JOIN vehicle   v
            ON o.veh_vin = v.veh_vin
        WHERE
            dem_points >= 2
        GROUP BY
            v.veh_manufname
    )
ORDER BY
    "Total No. of Offences" DESC,
    "Manufacturer Name";

/*
2(vi) Query 6
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE

SELECT
    lic_no       AS "Licence No.",
    lic_fname
    || ' '
    || lic_lname AS "Driver Name",
    officer_id   AS "Officer ID",
    officer_fname
    || ' '
    || officer_lname AS "Officer Name"
FROM
    officer
    NATURAL JOIN offence
    NATURAL JOIN driver
WHERE
    officer_lname = lic_lname
GROUP BY
    dem_code,
    lic_no,
    lic_fname
    || ' '
    || lic_lname,
    officer_id,
    officer_fname
    || ' '
    || officer_lname
HAVING
    COUNT(dem_code) > 1
ORDER BY
    "Licence No.";

/*
2(vii) Query 7
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE

SELECT
    d.dem_code AS "Demerit Code",
    d.dem_description as "Demerit Description" ,
    dr.lic_no as "Licence No.",
    dr.lic_fname|| ' ' ||dr.lic_lname as "Driver Fullname",
    COUNT(*) AS "Total Times Booked"
FROM
    demerit   d
    JOIN offence   o
    ON d.dem_code = o.dem_code
    JOIN driver    dr
    ON o.lic_no = dr.lic_no
GROUP BY
    d.dem_code,
    d.dem_description,
    dr.lic_no,
    dr.lic_fname|| ' ' ||dr.lic_lname
    
HAVING
    COUNT(*) = (
        SELECT
            MAX(tot)
        FROM
            (
                SELECT
                    dem_code,
                    dem_description,
                    lic_no,
                    COUNT(*) AS tot
                FROM
                    demerit
                    NATURAL JOIN offence
                    NATURAL JOIN driver
                GROUP BY
                    dem_code,
                    dem_description,
                    lic_no
                    
            ) t1
        WHERE
            t1.dem_code = d.dem_code
    )
ORDER BY
    d.dem_code,
    dr.lic_no
;

/*
2(viii) Query 8
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE

SELECT
    "Region",
    "Total Vehicles Manufactured",
    "Percentage of Vehicles Manufactured"
FROM
    (
        SELECT
            CASE
                WHEN substr(veh_vin, 1, 1) BETWEEN 'A' AND 'C' THEN
                    'Africa'
                WHEN substr(veh_vin, 1, 1) BETWEEN 'J' AND 'R' THEN
                    'Asia'
                WHEN substr(veh_vin, 1, 1) BETWEEN 'S' AND 'Z' THEN
                    'Europe'
                WHEN substr(veh_vin, 1, 1) BETWEEN '1' AND '5' THEN
                    'North America'
                WHEN substr(veh_vin, 1, 1) BETWEEN '6' AND '7' THEN
                    'Oceania'
                WHEN substr(veh_vin, 1, 1) BETWEEN '8' AND '9' THEN
                    'South America'
                ELSE
                    'Unknown'
            END AS "Region",
            COUNT(*) AS "Total Vehicles Manufactured",
            lpad(to_char((COUNT(*) * 100 /(
                SELECT
                    COUNT(*)
                FROM
                    vehicle
            )), '990.99')
                 || '%', 28, ' ') AS "Percentage of Vehicles Manufactured"
        FROM
            vehicle
        GROUP BY
            CASE
                WHEN substr(veh_vin, 1, 1) BETWEEN 'A' AND 'C' THEN
                    'Africa'
                WHEN substr(veh_vin, 1, 1) BETWEEN 'J' AND 'R' THEN
                    'Asia'
                WHEN substr(veh_vin, 1, 1) BETWEEN 'S' AND 'Z' THEN
                    'Europe'
                WHEN substr(veh_vin, 1, 1) BETWEEN '1' AND '5' THEN
                    'North America'
                WHEN substr(veh_vin, 1, 1) BETWEEN '6' AND '7' THEN
                    'Oceania'
                WHEN substr(veh_vin, 1, 1) BETWEEN '8' AND '9' THEN
                    'South America'
                ELSE
                    'Unknown'
            END
        ORDER BY
            "Total Vehicles Manufactured"
    )
UNION ALL
SELECT
    lpad('TOTAL', 13, ' '),
    ( SUM(COUNT(*)) ),
    lpad(to_char(SUM(to_char((COUNT(*) * 100 /(
        SELECT
            COUNT(*)
        FROM
            vehicle
    )), '990.99')))
         || '%', 28, ' ') AS "Percentage of Vehicles Manufactured"
FROM
    vehicle v
GROUP BY
    CASE
        WHEN substr(veh_vin, 1, 1) BETWEEN 'A' AND 'C' THEN
            'Africa'
        WHEN substr(veh_vin, 1, 1) BETWEEN 'J' AND 'R' THEN
            'Asia'
        WHEN substr(veh_vin, 1, 1) BETWEEN 'S' AND 'Z' THEN
            'Europe'
        WHEN substr(veh_vin, 1, 1) BETWEEN '1' AND '5' THEN
            'North America'
        WHEN substr(veh_vin, 1, 1) BETWEEN '6' AND '7' THEN
            'Oceania'
        WHEN substr(veh_vin, 1, 1) BETWEEN '8' AND '9' THEN
            'South America'
        ELSE
            'Unknown'
    END;