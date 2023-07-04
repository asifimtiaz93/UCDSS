CREATE TABLE Courses (
  Course_ID INT PRIMARY KEY,
  Course_Name VARCHAR(50) NOT NULL,
  Lvl VARCHAR(50) NOT NULL
);

CREATE TABLE users (
  user_ID NUMBER PRIMARY KEY NOT NULL,
  username VARCHAR2(255) NOT NULL,
  type VARCHAR2(255),
  password VARCHAR2(255)
);

CREATE TABLE Sldrs_Basic_Info (
  Sldr_ID NUMBER PRIMARY KEY NOT NULL,
  Name VARCHAR2(255) NOT NULL,
  Trade VARCHAR2(255),
  Marital_Status VARCHAR2(255),
  Address VARCHAR2(255),
  Blood_Group VARCHAR2(255),
  Rank_ID NUMBER,
  Age NUMBER,
  DOB DATE,
  Svc_Age NUMBER,
  Dt_of_Joining DATE,
  Mobile_No NUMBER,
  Med_Cat VARCHAR2(20),
  Promotion_Dt DATE,
  Height NUMBER,
  Weight NUMBER,
  Last_Served_Unit VARCHAR2(255),
  Last_Served_Appt VARCHAR2(255),
  Last_OPR_Mks NUMBER,
  Living_Status VARCHAR2(255),
  Sex VARCHAR2(255),
  FOREIGN KEY (Rank_ID) REFERENCES Rank (Rank_ID)
);
CREATE TABLE command_channel (
  coy_ID NUMBER PRIMARY KEY NOT NULL,
  coy_name VARCHAR2(255),
  coy_comd VARCHAR2(255),
  SJCO VARCHAR2(255),
  CSM VARCHAR2(255),
  sldr_ID NUMBER,
  FOREIGN KEY (sldr_ID) REFERENCES Sldrs_Basic_Info (sldr_ID)
);


CREATE TABLE Appt (
  Appt_ID NUMBER PRIMARY KEY NOT NULL,
  Appt_name VARCHAR2(255),
  sldr_ID NUMBER,
  FOREIGN KEY (sldr_ID) REFERENCES Sldrs_Basic_Info (sldr_ID)
);


CREATE TABLE overweight_chart (
  Max_Age NUMBER,
  Min_age NUMBER,
  height NUMBER,
  Max_weight NUMBER
);


CREATE TABLE career_plan (
  plan_ID NUMBER PRIMARY KEY NOT NULL,
  first_cycle VARCHAR2(255),
  second_cycle VARCHAR2(255),
  third_cycle VARCHAR2(255),
  fourth_cycle VARCHAR2(255),
  sldr_ID NUMBER,
  FOREIGN KEY (sldr_ID) REFERENCES Sldrs_Basic_Info (sldr_ID)
);


CREATE TABLE follows (
  sldr_ID NUMBER,
  plan_ID NUMBER,
  FOREIGN KEY (sldr_ID) REFERENCES sldrs_basic_info (sldr_ID),
  FOREIGN KEY (plan_ID) REFERENCES career_plan (plan_ID)
);


CREATE TABLE events (
  Event_ID NUMBER PRIMARY KEY NOT NULL,
  event_name VARCHAR2(255) NOT NULL
);



CREATE TABLE resp_for (
  sldr_ID NUMBER,
  Event_ID NUMBER,
  FOREIGN KEY (sldr_ID) REFERENCES sldrs_basic_info (sldr_ID),
  FOREIGN KEY (Event_ID) REFERENCES events (Event_ID)
);



CREATE TABLE Completes_course (
  Soldier_ID INT NOT NULL,
  Course_ID INT NOT NULL,
  Date_of_Completion DATE NOT NULL,
  PRIMARY KEY (Soldier_ID, Course_ID),
  FOREIGN KEY (Soldier_ID) REFERENCES Sldrs_basic_info (sldr_ID),
  FOREIGN KEY (Course_ID) REFERENCES Courses (Course_ID)
);



CREATE TABLE IPFT (
  IPFT_ID INT NOT NULL PRIMARY KEY,
  Year INT NOT NULL,
  Period VARCHAR(50) NOT NULL
);



CREATE TABLE Undertakes (
  Soldier_ID INT NOT NULL,
  IPFT_ID INT NOT NULL,
  Result VARCHAR(50) NOT NULL,
  PRIMARY KEY (Soldier_ID, IPFT_ID),
  FOREIGN KEY (Soldier_ID) REFERENCES Sldrs_basic_info (sldr_ID),
  FOREIGN KEY (IPFT_ID) REFERENCES IPFT (IPFT_ID)
);



CREATE TABLE Leave_Register (
  Leave_ID INT NOT NULL PRIMARY KEY,
  From_Dt DATE NOT NULL,
  To_Dt DATE NOT NULL,
  Total_Leave INT NOT NULL,
  Leave_Type VARCHAR(50) NOT NULL
);



CREATE TABLE Granted_Lve (
  Soldier_ID INT NOT NULL,
  Leave_ID INT NOT NULL,
  PRIMARY KEY (Soldier_ID, Leave_ID),
  FOREIGN KEY (Soldier_ID) REFERENCES Sldrs_basic_info (sldr_ID),
  FOREIGN KEY (Leave_ID) REFERENCES Leave_Register (Leave_ID)
);



CREATE TABLE Med_Disposal (
  Disp_ID INT PRIMARY KEY,
  Disposal VARCHAR(50),
  Date_of_adm DATE,
  Total_Disp INT,
  Reason VARCHAR(100),
  Patient_ID INT,
  Soldier_ID INT,
  FOREIGN KEY (Soldier_ID) REFERENCES Sldrs_basic_info (sldr_ID)
);


CREATE TABLE Rank (
  Rank_ID INT PRIMARY KEY,
  Rank VARCHAR(50) NOT NULL
);



CREATE TABLE Punishment (
  Punishment_ID INT PRIMARY KEY,
  Punishment VARCHAR(50) NOT NULL,
  Incident VARCHAR(100) NOT NULL
);



CREATE TABLE AWARDED (
    SOLDIER_ID INT NOT NULL,
    PUNISHMENT_ID INT NOT NULL,
    PRIMARY KEY (SOLDIER_ID, PUNISHMENT_ID),
    FOREIGN KEY (SOLDIER_ID) REFERENCES SLDRS_BASIC_INFO (sldr_ID),
    FOREIGN KEY (PUNISHMENT_ID) REFERENCES PUNISHMENT (PUNISHMENT_ID)
);



CREATE TABLE Firing_Standard (
  Firing_ID INT PRIMARY KEY,
  Avg_Gp DECIMAL(10,2) NOT NULL,
  Avg_Total_Point DECIMAL(10,2) NOT NULL,
  Date_of_fire DATE NOT NULL
);



CREATE TABLE Achieves (
  Soldier_ID INT,
  Firing_ID INT,
  PRIMARY KEY (Soldier_ID, Firing_ID),
  FOREIGN KEY (Soldier_ID) REFERENCES Sldrs_basic_info (sldr_ID),
  FOREIGN KEY (Firing_ID) REFERENCES Firing_Standard (Firing_ID)
);


CREATE TABLE RET (
  RET_ID INT PRIMARY KEY,
  Year INT
);


CREATE TABLE Undertake_RET (
  Soldier_ID INT,
  RET_ID INT,
  Result VARCHAR(50),
  PRIMARY KEY (Soldier_ID, RET_ID),
  FOREIGN KEY (Soldier_ID) REFERENCES Sldrs_basic_info (sldr_ID),
  FOREIGN KEY (RET_ID) REFERENCES RET (RET_ID)
);


CREATE TABLE Competition (
  Competition_ID INT PRIMARY KEY,
  Competition_name VARCHAR(50)
);



CREATE TABLE Participates (
  Soldier_ID INT,
  Competition_ID INT,
  PRIMARY KEY (Soldier_ID, Competition_ID),
  FOREIGN KEY (Soldier_ID) REFERENCES Sldrs_basic_info (sldr_ID),
  FOREIGN KEY (Competition_ID) REFERENCES Competition (Competition_ID)
);


INSERT INTO Rank (Rank_ID, Rank) 
VALUES (1, 'Snk');

INSERT INTO Rank (Rank_ID, Rank) 
VALUES (2, 'LCpl');

INSERT INTO Rank (Rank_ID, Rank) 
VALUES (3, 'Cpl');

INSERT INTO Rank (Rank_ID, Rank) 
VALUES (4, 'Sgt');

INSERT INTO Rank (Rank_ID, Rank) 
VALUES (5, 'WO');

INSERT INTO Rank (Rank_ID, Rank) 
VALUES (6, 'SWO');

INSERT INTO Rank (Rank_ID, Rank) 
VALUES (7, 'MWO');

INSERT INTO users (user_ID, username, type, password)
VALUES (1, 'admin', 'admin', 'admin');

INSERT INTO users (user_ID, username, type, password)
VALUES (2, 'entry_clk', 'entry', '1234');

INSERT INTO users (user_ID, username, type, password)
VALUES (3, 'CO', 'admin', 'co1234');


 select Sldr_ID, Rank, Sldrs_basic_info.Name, Marital_Status 
                                from Sldrs_Basic_Info, Rank
                                where Rank.Rank_ID=Sldrs_basic_info.Rank_ID

select Sldr_ID, Rank, Sldrs_basic_info.Name, Competition_name
from Sldrs_Basic_Info, Rank, Competition, Participates
where Rank.Rank_ID=Sldrs_basic_info.Rank_ID and
Participates.Competition_ID=Competition.Competition_ID and
Participates.Soldier_ID= Sldrs_basic_info.Sldr_ID
order by  Sldr_ID ASC            


select Sldr_ID, Rank, Sldrs_basic_info.Name, BLOOD_GROUP 
                                from Sldrs_Basic_Info, Rank
                                where Rank.Rank_ID=Sldrs_basic_info.Rank_ID 


                                select COUNT(Result)
                                from Sldrs_Basic_Info, IPFT,  Undertakes            
                                where Undertakes.Soldier_ID=Sldrs_basic_info.Sldr_ID and
                                Undertakes.IPFT_ID=IPFT.IPFT_ID and
                                Result= 'Passed'

SELECT SYSDATE AS Current_Date FROM DUAL;         

 select count(Soldier_ID) AS LeaveCount
                                from Granted_Lve, Leave_Register
                                where Granted_Lve.Leave_ID=Leave_Register.Leave_ID and
                                CURRENT_DATE <= To_Dt


                                select *
                                from Sldrs_Basic_Info, Rank,Leave_Register, Granted_Lve
                                where Rank.Rank_ID=Sldrs_basic_info.Rank_ID and
                                Sldrs_Basic_Info.Sldr_ID=Granted_Lve.Soldier_ID and
                                Granted_Lve.Leave_ID=Leave_Register.Leave_ID 


INSERT INTO MED_DISPOSAL (
    DISP_ID,
    DISPOSAL,
    DATE_OF_ADM,
    TOTAL_DISP,
    REASON,
    SOLDIER_ID
) VALUES (
    1234,
    'SIQ',
    TO_DATE('2023-06-17', 'YYYY-MM-DD'),
    5,
    'Medical check-up',
    123
)


select 'Total disposal holders at present: ' || count(Sldrs_Basic_Info.Sldr_ID)
from Sldrs_Basic_Info, Med_Disposal 
where Med_Disposal.Soldier_ID = Sldrs_Basic_Info.Sldr_ID and
CURRENT_DATE <= (select DATE_ADD(Date_of_adm, INTERVAL Total_Disp DAY) AS disp_end_date
from Med_Disposal
where Med_Disposal.Soldier_ID = Sldrs_Basic_Info.Sldr_ID)

SELECT 'Total disposal holders at present: ' || COUNT(Sldrs_Basic_Info.Sldr_ID)
FROM Sldrs_Basic_Info, Med_Disposal
WHERE Med_Disposal.Soldier_ID = Sldrs_Basic_Info.Sldr_ID


SELECT *
FROM Sldrs_Basic_Info, Med_Disposal
WHERE Med_Disposal.Soldier_ID = Sldrs_Basic_Info.Sldr_ID
  AND CURRENT_DATE <= (
    SELECT MAX(Date_of_adm + Total_Disp) AS disp_end_date
    FROM Med_Disposal
    WHERE Med_Disposal.Soldier_ID = Sldrs_Basic_Info.Sldr_ID
  );


SELECT count(Sldrs_Basic_Info.Sldr_ID) AS DISPCOUNT
                                FROM Sldrs_Basic_Info, Med_Disposal
                                WHERE Med_Disposal.Soldier_ID = Sldrs_Basic_Info.Sldr_ID
                                AND CURRENT_DATE <= (
                                    SELECT MAX(Date_of_adm + Total_Disp) AS disp_end_date
                                    FROM Med_Disposal
                                    WHERE Med_Disposal.Soldier_ID = Sldrs_Basic_Info.Sldr_ID
                                );

                                
select count(Soldier_ID) AS LEAVECOUNT
                                from Granted_Lve, Leave_Register
                                where Granted_Lve.Leave_ID=Leave_Register.Leave_ID and
                                CURRENT_DATE <= To_Dt




select DISTINCT SLDRS_BASIC_INFO.SLDR_ID, RANK.RANK,  Sldrs_Basic_Info.NAME, UNDERTAKES.RESULT, UNDERTAKE_RET.RESULT, SLDRS_BASIC_INFO.SVC_AGE
from Sldrs_Basic_Info, Rank, Punishment, Awarded, RET, Undertake_RET, IPFT, Undertakes, courses, completes_course 
where Rank.Rank_ID=Sldrs_basic_info.Rank_ID and
Undertake_RET.Soldier_ID=Sldrs_basic_info.Sldr_ID and
Undertake_RET.RET_ID= RET.RET_ID and
Undertakes.Soldier_ID=Sldrs_basic_info.Sldr_ID and
Undertakes.IPFT_ID=IPFT.IPFT_ID and 
Punishment.Punishment_ID=Awarded.Punishment_ID and
Awarded.Soldier_ID=Sldrs_basic_info.Sldr_ID and
courses.Course_ID=completes_course.Course_ID and
completes_course.Soldier_ID=Sldrs_basic_info.Sldr_ID and 
Rank.RANK_ID= 1 and
svc_age> 7 and
Med_cat= 'A' and
Undertakes.result= 'Passed' and
Undertake_RET.result= 'Passed' and
COMPLETES_COURSE.COURSE_ID in (103, 104, 105)    


select DISTINCT SLDRS_BASIC_INFO.SLDR_ID, RANK.RANK,  Sldrs_Basic_Info.NAME, UNDERTAKES.RESULT, UNDERTAKE_RET.RESULT, SLDRS_BASIC_INFO.SVC_AGE
from Sldrs_Basic_Info, Rank, Punishment, Awarded, RET, Undertake_RET, IPFT, Undertakes, courses, completes_course 
where Rank.Rank_ID=Sldrs_basic_info.Rank_ID and
Undertake_RET.Soldier_ID=Sldrs_basic_info.Sldr_ID and
Undertake_RET.RET_ID= RET.RET_ID and
Undertakes.Soldier_ID=Sldrs_basic_info.Sldr_ID and
Undertakes.IPFT_ID=IPFT.IPFT_ID and 
Punishment.Punishment_ID=Awarded.Punishment_ID and
Awarded.Soldier_ID=Sldrs_basic_info.Sldr_ID and
courses.Course_ID=completes_course.Course_ID and
completes_course.Soldier_ID=Sldrs_basic_info.Sldr_ID and 
Rank.RANK_ID= 2 and
svc_age> 11 and
Med_cat= 'A' and
Undertakes.result= 'Passed' and
Undertake_RET.result= 'Passed' and
COMPLETES_COURSE.COURSE_ID in (106, 107)  


select DISTINCT SLDRS_BASIC_INFO.SLDR_ID, RANK.RANK,  Sldrs_Basic_Info.NAME, UNDERTAKES.RESULT, UNDERTAKE_RET.RESULT, SLDRS_BASIC_INFO.SVC_AGE
from Sldrs_Basic_Info, Rank, Punishment, Awarded, RET, Undertake_RET, IPFT, Undertakes, courses, completes_course 
where Rank.Rank_ID=Sldrs_basic_info.Rank_ID and
Undertake_RET.Soldier_ID=Sldrs_basic_info.Sldr_ID and
Undertake_RET.RET_ID= RET.RET_ID and
Undertakes.Soldier_ID=Sldrs_basic_info.Sldr_ID and
Undertakes.IPFT_ID=IPFT.IPFT_ID and 
Punishment.Punishment_ID=Awarded.Punishment_ID and
Awarded.Soldier_ID=Sldrs_basic_info.Sldr_ID and
courses.Course_ID=completes_course.Course_ID and
completes_course.Soldier_ID=Sldrs_basic_info.Sldr_ID and 
Rank.RANK_ID= 3 and
svc_age> 18 and
Med_cat= 'A' and
Undertakes.result= 'Passed' and
Undertake_RET.result= 'Passed' and
COMPLETES_COURSE.COURSE_ID in (108, 109)  


select Sldr_ID, Rank, Sldrs_basic_info.Name, svc_age, Med_cat, Undertakes.result, Undertake_RET.result, Punishment 
from Sldrs_Basic_Info, Rank, Punishment, Awarded, RET, Undertake_RET, IPFT, Undertakes
where Rank.Rank_ID=Sldrs_basic_info.Rank_ID and
Undertake_RET.Soldier_ID=Sldrs_basic_info.Sldr_ID and
Undertake_RET.RET_ID= RET.RET_ID and
Undertakes.Soldier_ID=Sldrs_basic_info.Sldr_ID and
Undertakes.IPFT_ID=IPFT.IPFT_ID and 
Punishment.Punishment_ID=Awarded.Punishment_ID and
Awarded.Soldier_ID=Sldrs_basic_info.Sldr_ID and
Med_cat= 'A' and
Height > 68 and
Undertakes.result= 'Passed' and
Undertake_RET.result= 'Passed' and
incident not in ('moral_turpitude', 'Theft', 'Violation of good order')

select Sldr_ID, Rank, Sldrs_basic_info.Name, svc_age, Med_cat, Undertakes.result, Undertake_RET.result,course_name, Punishment 
from Sldrs_Basic_Info, Rank, Punishment, Awarded, RET, Undertake_RET, IPFT, Undertakes, courses, completes_course 
where Rank.Rank_ID=Sldrs_basic_info.Rank_ID and
Undertake_RET.Soldier_ID=Sldrs_basic_info.Sldr_ID and
Undertake_RET.RET_ID= RET.RET_ID and
Undertakes.Soldier_ID=Sldrs_basic_info.Sldr_ID and
Undertakes.IPFT_ID=IPFT.IPFT_ID and 
Punishment.Punishment_ID=Awarded.Punishment_ID and
Awarded.Soldier_ID=Sldrs_basic_info.Sldr_ID and
courses.Course_ID=completes_course.Course_ID and
completes_course.Soldier_ID=Sldrs_basic_info.Sldr_ID and 
Rank= 'X' and
Med_cat= 'A' and
Undertakes.result= 'Passed' and
Undertake_RET.result= 'Passed' and
course_name in ('ORBIC') and
Punishment IS NULL


CREATE TYPE address_type AS OBJECT (
    village VARCHAR2(255),
    post_office VARCHAR2(255),
    district VARCHAR2(255)
);

CREATE TABLE "kkk"
(
    "SLDR_ID" NUMBER NOT NULL ENABLE,
    "NAME" VARCHAR2(255) NOT NULL ENABLE,
    "TRADE" VARCHAR2(255),
    "MARITAL_STATUS" VARCHAR2(255),
    "ADDRESS" ADDRESS_TYPE,
    "BLOOD_GROUP" VARCHAR2(255),
    "RANK_ID" NUMBER,
    "DOB" DATE,
    "DT_OF_JOINING" DATE,
    "MOBILE_NO" NUMBER,
    "MED_CAT" VARCHAR2(20),
    "PROMOTION_DT" DATE,
    "HEIGHT" NUMBER,
    "WEIGHT" NUMBER,
    "LAST_SERVED_UNIT" VARCHAR2(255),
    "LAST_SERVED_APPT" VARCHAR2(255),
    "LAST_OPR_MKS" NUMBER,
    "LIVING_STATUS" VARCHAR2(255),
    "SEX" VARCHAR2(255),
    "AGE" NUMBER GENERATED ALWAYS AS (TRUNC(MONTHS_BETWEEN(SYSDATE, DOB) / 12)),
    "SVC_AGE" NUMBER GENERATED ALWAYS AS (TRUNC(MONTHS_BETWEEN(SYSDATE, DT_OF_JOINING) / 12)),
    PRIMARY KEY ("SLDR_ID") ENABLE
);

ALTER TABLE "SLDRS_BASIC_INFO" ADD FOREIGN KEY ("RANK_ID")
    REFERENCES "RANK" ("RANK_ID") ENABLE;

SELECT
    SLDR_ID,
    NAME,
    TRADE,
    MARITAL_STATUS,
    ADDRESS,
    BLOOD_GROUP,
    RANK_ID,
    DOB,
    DT_OF_JOINING,
    MOBILE_NO,
    MED_CAT,
    PROMOTION_DT,
    HEIGHT,
    WEIGHT,
    LAST_SERVED_UNIT,
    LAST_SERVED_APPT,
    LAST_OPR_MKS,
    LIVING_STATUS,
    SEX,
    TRUNC(MONTHS_BETWEEN(SYSDATE, DOB) / 12) AS AGE,
    TRUNC(MONTHS_BETWEEN(SYSDATE, DT_OF_JOINING) / 12) AS SVC_AGE
FROM
    SLDRS_BASIC_INFO;


CREATE TABLE jkl
(
    "SLDR_ID" NUMBER NOT NULL ENABLE,
    "NAME" VARCHAR2(255) NOT NULL ENABLE,
    "TRADE" VARCHAR2(255),
    "MARITAL_STATUS" VARCHAR2(255),
    "ADDRESS" ADDRESS_TYPE,
    "BLOOD_GROUP" VARCHAR2(255),
    "RANK_ID" NUMBER,
    "DOB" DATE,
    "DT_OF_JOINING" DATE,
    "MOBILE_NO" NUMBER,
    "MED_CAT" VARCHAR2(20),
    "PROMOTION_DT" DATE,
    "HEIGHT" NUMBER,
    "WEIGHT" NUMBER,
    "LAST_SERVED_UNIT" VARCHAR2(255),
    "LAST_SERVED_APPT" VARCHAR2(255),
    "LAST_OPR_MKS" NUMBER,
    "LIVING_STATUS" VARCHAR2(255),
    "SEX" VARCHAR2(255),
   
    PRIMARY KEY ("SLDR_ID") ENABLE
);

ALTER TABLE "SLDRS_BASIC_INFO" ADD FOREIGN KEY ("RANK_ID")
    REFERENCES "RANK" ("RANK_ID") ENABLE;

    INSERT INTO kkk (SLDR_ID, NAME, TRADE, MARITAL_STATUS, ADDRESS, BLOOD_GROUP, RANK_ID, DOB, DT_OF_JOINING, MOBILE_NO, MED_CAT, PROMOTION_DT, HEIGHT, WEIGHT, LAST_SERVED_UNIT, LAST_SERVED_APPT, LAST_OPR_MKS, LIVING_STATUS, SEX)
VALUES (1614287, 'Hasanur Rahman', 'Operator', 'Married',  address_type('Borovita', 'Borovita', 'Nilfamari'), 'A+', 6, TO_DATE('1982-04-23', 'YYYY-MM-DD'), TO_DATE('2000-03-05', 'YYYY-MM-DD'), 01717818387, 'A', TO_DATE('2020-03-05', 'YYYY-MM-DD'), 65, 72, '3 Sig Bn', 'Coy SJCO', 90, 'outliving', 'Male');

INSERT INTO kkk
    (SLDR_ID, NAME, TRADE, MARITAL_STATUS, ADDRESS, BLOOD_GROUP, RANK_ID, DOB, DT_OF_JOINING, MOBILE_NO, MED_CAT,
     PROMOTION_DT, HEIGHT, WEIGHT, LAST_SERVED_UNIT, LAST_SERVED_APPT, LAST_OPR_MKS, LIVING_STATUS, SEX)
VALUES
    (1, 'John Doe', 'Soldier', 'Married',
     address_type('Village 1', 'Post Office 1', 'District 1'),
     'A+', 1, TO_DATE('1990-01-01', 'YYYY-MM-DD'), TO_DATE('2010-01-01', 'YYYY-MM-DD'),
     1234567890, 'A', TO_DATE('2015-01-01', 'YYYY-MM-DD'), 180, 75, 'Unit 1', 'Appointment 1', 90, 'Alive', 'Male');


     INSERT INTO SLDRS_BASIC_INFO (SLDR_ID, NAME, TRADE, MARITAL_STATUS, ADDRESS, BLOOD_GROUP, RANK_ID, AGE, DOB, SVC_AGE, DT_OF_JOINING, MOBILE_NO, MED_CAT, PROMOTION_DT, HEIGHT, WEIGHT, LAST_SERVED_UNIT, LAST_SERVED_APPT, LAST_OPR_MKS, LIVING_STATUS, SEX)
VALUES (1614287, 'Hasanur Rahman', 'Operator', 'Married', 'Vill: Borovita, PO: Borovita, PS: KishoreGonj, Dist: Nilfamari', 'A+', 6, 42, TO_DATE('1982-04-23', 'YYYY-MM-DD'), 23, TO_DATE('2000-03-05', 'YYYY-MM-DD'), '01717818387', 'A', TO_DATE('2020-03-05', 'YYYY-MM-DD'), 65, 72, '3 Sig Bn', 'Coy SJCO', 90, 'outliving', 'Male');

INSERT INTO SLDRS_BASIC_INFO (SLDR_ID, NAME, TRADE, MARITAL_STATUS, ADDRESS, BLOOD_GROUP, RANK_ID, AGE, DOB, SVC_AGE, DT_OF_JOINING, MOBILE_NO, MED_CAT, PROMOTION_DT, HEIGHT, WEIGHT, LAST_SERVED_UNIT, LAST_SERVED_APPT, LAST_OPR_MKS, LIVING_STATUS, SEX)
VALUES (1614132, 'Shahadat Hossen', 'Operator', 'Married', 'Vill: Lotoney, PO: Kakara, PS: Chakaria, Dist: Coxs''bazar', 'A+', 5, 38, TO_DATE('1986-04-23', 'YYYY-MM-DD'), 19, TO_DATE('2004-03-05', 'YYYY-MM-DD'), '01917818387', 'C', TO_DATE('2018-03-05', 'YYYY-MM-DD'), 63, 72, '1 Sig Bn', 'Kote NCO', 88, 'outliving', 'Male');

INSERT INTO SLDRS_BASIC_INFO (SLDR_ID, NAME, TRADE, MARITAL_STATUS, ADDRESS, BLOOD_GROUP, RANK_ID, AGE, DOB, SVC_AGE, DT_OF_JOINING, MOBILE_NO, MED_CAT, PROMOTION_DT, HEIGHT, WEIGHT, LAST_SERVED_UNIT, LAST_SERVED_APPT, LAST_OPR_MKS, LIVING_STATUS, SEX)
VALUES (1613793, 'Md Abdur Rahman', 'Operator', 'Married', 'Vill: Gosail, PO: Bijrol, PS: Nondigram, Dist: Bogura', 'A-', 4, 35, TO_DATE('1989-04-23', 'YYYY-MM-DD'), 19, TO_DATE('2007-03-05', 'YYYY-MM-DD'), '01817818387', 'A', TO_DATE('2014-03-05', 'YYYY-MM-DD'), 66, 70, '2 Sig Bn', 'Ammo NCO', 87, 'inliving', 'Male');

INSERT INTO SLDRS_BASIC_INFO (SLDR_ID, NAME, TRADE, MARITAL_STATUS, ADDRESS, BLOOD_GROUP, RANK_ID, AGE, DOB, SVC_AGE, DT_OF_JOINING, MOBILE_NO, MED_CAT, PROMOTION_DT, HEIGHT, WEIGHT, LAST_SERVED_UNIT, LAST_SERVED_APPT, LAST_OPR_MKS, LIVING_STATUS, SEX)
VALUES (1612880, 'Md Shahjahan', 'Driver', 'Married', 'Vill: North Tetabhumi, PO: Horimongol, PS: B.Para, Dist: Cumilla', 'B+', 4, 36, TO_DATE('1985-04-07', 'YYYY-MM-DD'), 20, TO_DATE('2006-03-08', 'YYYY-MM-DD'), '01817888387', 'A', TO_DATE('2013-03-05', 'YYYY-MM-DD'), 67, 75, '4 Sig Bn', 'CQMS', 85, 'inliving', 'Male');

INSERT INTO SLDRS_BASIC_INFO (SLDR_ID, NAME, TRADE, MARITAL_STATUS, ADDRESS, BLOOD_GROUP, RANK_ID, AGE, DOB, SVC_AGE, DT_OF_JOINING, MOBILE_NO, MED_CAT, PROMOTION_DT, HEIGHT, WEIGHT, LAST_SERVED_UNIT, LAST_SERVED_APPT, LAST_OPR_MKS, LIVING_STATUS, SEX)
VALUES (1614635, 'Md Nazmul Hasan', 'Operator', 'Married', 'Vill: Ponguai, PO: Dadra, PS: Tarakanda, Dist: Mymensingh', 'B+', 4, 37, TO_DATE('1984-10-06', 'YYYY-MM-DD'), 24, TO_DATE('2006-09-08', 'YYYY-MM-DD'), '01817088997', 'A', TO_DATE('2019-03-05', 'YYYY-MM-DD'), 64, 81, '6 Sig Bn', 'CSM', 79, 'inliving', 'Male');

INSERT INTO SLDRS_BASIC_INFO (SLDR_ID, NAME, TRADE, MARITAL_STATUS, ADDRESS, BLOOD_GROUP, RANK_ID, AGE, DOB, SVC_AGE, DT_OF_JOINING, MOBILE_NO, MED_CAT, PROMOTION_DT, HEIGHT, WEIGHT, LAST_SERVED_UNIT, LAST_SERVED_APPT, LAST_OPR_MKS, LIVING_STATUS, SEX)
VALUES (1613595, 'Mirza Mohibullah', 'Operator', 'Married', 'Vill: Shat Kahon, PO: Laxmigonj, PS: Netrokona, Dist: Netrokona', 'B-', 3, 35, TO_DATE('1986-08-25', 'YYYY-MM-DD'), 21, TO_DATE('2013-06-27', 'YYYY-MM-DD'), '01317818689', 'A', TO_DATE('2013-06-27', 'YYYY-MM-DD'), 63, 76, 'EW Coy', 'Rd Storeman', 76, 'outliving', 'Male');

INSERT INTO SLDRS_BASIC_INFO (SLDR_ID, NAME, TRADE, MARITAL_STATUS, ADDRESS, BLOOD_GROUP, RANK_ID, AGE, DOB, SVC_AGE, DT_OF_JOINING, MOBILE_NO, MED_CAT, PROMOTION_DT, HEIGHT, WEIGHT, LAST_SERVED_UNIT, LAST_SERVED_APPT, LAST_OPR_MKS, LIVING_STATUS, SEX)
VALUES (1616732, 'Md Younus Ali', 'Crypto', 'Married', 'Vill: Mosrot Madati, PO: Bhutmari, PS: Kaligonj, Dist: Lalmonirhat', 'O-', 3, 30, TO_DATE('1993-08-25', 'YYYY-MM-DD'), 16, TO_DATE('2011-06-27', 'YYYY-MM-DD'), '01617818689', 'C', TO_DATE('2011-06-27', 'YYYY-MM-DD'), 63, 76, 'ASSB', 'POL NCO', 76, 'outliving', 'Male');

INSERT INTO SLDRS_BASIC_INFO (SLDR_ID, NAME, TRADE, MARITAL_STATUS, ADDRESS, BLOOD_GROUP, RANK_ID, AGE, DOB, SVC_AGE, DT_OF_JOINING, MOBILE_NO, MED_CAT, PROMOTION_DT, HEIGHT, WEIGHT, LAST_SERVED_UNIT, LAST_SERVED_APPT, LAST_OPR_MKS, LIVING_STATUS, SEX)
VALUES (1613079, 'Md Abdul Wahed', 'Cook', 'Married', 'Vill: West Matapur, PO: jamalgong, PS: Akkelpur, Dist: Joipurhat', 'O+', 3, 30, TO_DATE('1993-08-25', 'YYYY-MM-DD'), 15, TO_DATE('2005-04-03', 'YYYY-MM-DD'), '016174489', 'A', TO_DATE('2010-06-27', 'YYYY-MM-DD'), 63, 76, '10 sig bn', 'Cook', 76, 'inliving', 'Male');

INSERT INTO SLDRS_BASIC_INFO (SLDR_ID, NAME, TRADE, MARITAL_STATUS, ADDRESS, BLOOD_GROUP, RANK_ID, AGE, DOB, SVC_AGE, DT_OF_JOINING, MOBILE_NO, MED_CAT, PROMOTION_DT, HEIGHT, WEIGHT, LAST_SERVED_UNIT, LAST_SERVED_APPT, LAST_OPR_MKS, LIVING_STATUS, SEX)
VALUES (1614671, 'Md Rakibullah', 'Driver', 'Married', 'Vill: Ghupkhali, PO: Betmor Nutonhat, PS: Motbaria, Dist: Pirojpur', 'O+', 2, 28, TO_DATE('1995-08-25', 'YYYY-MM-DD'), 11, TO_DATE('2007-04-03', 'YYYY-MM-DD'), '016174489', 'A', TO_DATE('2014-06-27', 'YYYY-MM-DD'), 63, 76, '10 sig bn', 'Driver', 78, 'inliving', 'Male');

INSERT INTO SLDRS_BASIC_INFO (SLDR_ID, NAME, TRADE, MARITAL_STATUS, ADDRESS, BLOOD_GROUP, RANK_ID, AGE, DOB, SVC_AGE, DT_OF_JOINING, MOBILE_NO, MED_CAT, PROMOTION_DT, HEIGHT, WEIGHT, LAST_SERVED_UNIT, LAST_SERVED_APPT, LAST_OPR_MKS, LIVING_STATUS, SEX)
VALUES (1616911, 'Md Monowar Hossain', 'Operator', 'Married', 'Vill: Keshobpur, PO: Keshobpur, PS: Alamdanga, Dist: Chuadanga', 'O+', 2, 28, TO_DATE('1995-05-25', 'YYYY-MM-DD'), 10, TO_DATE('2007-07-03', 'YYYY-MM-DD'), '016174489', 'A', TO_DATE('2014-06-27', 'YYYY-MM-DD'), 63, 76, '10 sig bn', 'Admin Duty', 78, 'inliving', 'Male');

INSERT INTO SLDRS_BASIC_INFO (SLDR_ID, NAME, TRADE, MARITAL_STATUS, ADDRESS, BLOOD_GROUP, RANK_ID, AGE, DOB, SVC_AGE, DT_OF_JOINING, MOBILE_NO, MED_CAT, PROMOTION_DT, HEIGHT, WEIGHT, LAST_SERVED_UNIT, LAST_SERVED_APPT, LAST_OPR_MKS, LIVING_STATUS, SEX)
VALUES (1615829, 'Mostafa Kamal', 'Operator', 'Married', 'Vill: Debipur, PO: Kaliapara, PS: Shahrasti, Dist: Chandpur', 'O+', 2, 27, TO_DATE('1994-05-25', 'YYYY-MM-DD'), 8, TO_DATE('2005-07-03', 'YYYY-MM-DD'), '01617448944', 'A', TO_DATE('2014-06-27', 'YYYY-MM-DD'), 61, 69, '11 sig bn', 'Admin Duty', 70, 'inliving', 'Male');

INSERT INTO SLDRS_BASIC_INFO (SLDR_ID, NAME, TRADE, MARITAL_STATUS, ADDRESS, BLOOD_GROUP, RANK_ID, AGE, DOB, SVC_AGE, DT_OF_JOINING, MOBILE_NO, MED_CAT, PROMOTION_DT, HEIGHT, WEIGHT, LAST_SERVED_UNIT, LAST_SERVED_APPT, LAST_OPR_MKS, LIVING_STATUS, SEX)
VALUES (1614187, 'Kamal Uddin Ahmed', 'Operator', 'Married', 'Vill: Rudarpudda, PO: Jaroitola, PS: Nikli, Dist: Kishorgonj', 'O+', 2, 27, TO_DATE('1994-05-28', 'YYYY-MM-DD'), 8, TO_DATE('2004-07-03', 'YYYY-MM-DD'), '016448944', 'A', TO_DATE('2014-06-27', 'YYYY-MM-DD'), 61, 69, '9 sig bn', 'Admin Duty', 70, 'outliving', 'Male');

INSERT INTO SLDRS_BASIC_INFO (SLDR_ID, NAME, TRADE, MARITAL_STATUS, ADDRESS, BLOOD_GROUP, RANK_ID, AGE, DOB, SVC_AGE, DT_OF_JOINING, MOBILE_NO, MED_CAT, PROMOTION_DT, HEIGHT, WEIGHT, LAST_SERVED_UNIT, LAST_SERVED_APPT, LAST_OPR_MKS, LIVING_STATUS, SEX)
VALUES (1615568, 'Md Iqbal Hossain', 'Clk', 'Married', 'Vill: North Korapur, PO: Korapur, PS: Sadar, Dist: Barishal', 'O+', 2, 29, TO_DATE('1992-05-28', 'YYYY-MM-DD'), 8, TO_DATE('2002-07-03', 'YYYY-MM-DD'), '016448944', 'A', TO_DATE('2016-06-27', 'YYYY-MM-DD'), 65, 65, '9 sig bn', 'Company Clk', 78, 'inliving', 'Male');

INSERT INTO SLDRS_BASIC_INFO (SLDR_ID, NAME, TRADE, MARITAL_STATUS, ADDRESS, BLOOD_GROUP, RANK_ID, AGE, DOB, SVC_AGE, DT_OF_JOINING, MOBILE_NO, MED_CAT, PROMOTION_DT, HEIGHT, WEIGHT, LAST_SERVED_UNIT, LAST_SERVED_APPT, LAST_OPR_MKS, LIVING_STATUS, SEX)
VALUES (1613992, 'Md Golap Hossain', 'Driver', 'Unmarried', 'Vill: Shimulbari, PO: Barkona, PS: Sha ghata, Dist: Gaibanda', 'O+', 1, 24, TO_DATE('1999-05-28', 'YYYY-MM-DD'), 7, TO_DATE('2009-05-07', 'YYYY-MM-DD'), '016448944', 'A', TO_DATE('2016-06-27', 'YYYY-MM-DD'), 67, 63, '9 sig bn', 'Driver', 78, 'inliving', 'Male');

INSERT INTO SLDRS_BASIC_INFO (SLDR_ID, NAME, TRADE, MARITAL_STATUS, ADDRESS, BLOOD_GROUP, RANK_ID, AGE, DOB, SVC_AGE, DT_OF_JOINING, MOBILE_NO, MED_CAT, PROMOTION_DT, HEIGHT, WEIGHT, LAST_SERVED_UNIT, LAST_SERVED_APPT, LAST_OPR_MKS, LIVING_STATUS, SEX)
VALUES (1613754, 'Md Tariqul Alam', 'Operator', 'Unmarried', 'Vill: Neyamotpur, PO: Mulgram, PS: Kosba, Dist: Brammanbaria', 'B+', 1, 24, TO_DATE('1999-05-28', 'YYYY-MM-DD'), 6, TO_DATE('2009-01-07', 'YYYY-MM-DD'), '016448944', 'A', TO_DATE('2016-06-27', 'YYYY-MM-DD'), 63, 60, '7 sig bn', 'Driver', 79, 'inliving', 'Male');

INSERT INTO SLDRS_BASIC_INFO (SLDR_ID, NAME, TRADE, MARITAL_STATUS, ADDRESS, BLOOD_GROUP, RANK_ID, AGE, DOB, SVC_AGE, DT_OF_JOINING, MOBILE_NO, MED_CAT, PROMOTION_DT, HEIGHT, WEIGHT, LAST_SERVED_UNIT, LAST_SERVED_APPT, LAST_OPR_MKS, LIVING_STATUS, SEX)
VALUES (1612735, 'Md Abdul Malek', 'Operator', 'Unmarried', 'Vill: Charkatari, PO: Daulatpur, PS: Daulatpur, Dist: Manikgonj', 'B+', 1, 23, TO_DATE('2000-05-28', 'YYYY-MM-DD'), 6, TO_DATE('2017-01-07', 'YYYY-MM-DD'), '016448944', 'A', TO_DATE('2019-06-27', 'YYYY-MM-DD'), 63, 60, '7 sig bn', 'Driver', 79, 'inliving', 'Male');

INSERT INTO SLDRS_BASIC_INFO (SLDR_ID, NAME, TRADE, MARITAL_STATUS, ADDRESS, BLOOD_GROUP, RANK_ID, AGE, DOB, SVC_AGE, DT_OF_JOINING, MOBILE_NO, MED_CAT, PROMOTION_DT, HEIGHT, WEIGHT, LAST_SERVED_UNIT, LAST_SERVED_APPT, LAST_OPR_MKS, LIVING_STATUS, SEX)
VALUES (1612739, 'Sweety Khatun', 'Tech', 'Unmarried', 'Vill: Charkatari, PO: Daulatpur, PS: Daulatpur, Dist: Manikgonj', 'B+', 1, 23, TO_DATE('2000-05-28', 'YYYY-MM-DD'), 6, TO_DATE('2017-01-07', 'YYYY-MM-DD'), '016448944', 'A', TO_DATE('2019-06-27', 'YYYY-MM-DD'), 63, 60, '7 sig bn', 'Admin Duty', 79, 'inliving', 'Female');


INSERT INTO IPFT (IPFT_ID, Year, Period) VALUES(1, 2023, '1st_bi-annual');
INSERT INTO IPFT (IPFT_ID, Year, Period) VALUES (2, 2023, '2nd_bi-annual');

INSERT INTO Undertakes (Soldier_ID, IPFT_ID, Result) VALUES  (1614287, 1, 'passed');
INSERT INTO Undertakes (Soldier_ID, IPFT_ID, Result) VALUES  (1614287, 2, 'failed');
INSERT INTO Undertakes (Soldier_ID, IPFT_ID, Result) VALUES  (1614132, 1, 'passed');
INSERT INTO Undertakes (Soldier_ID, IPFT_ID, Result) VALUES  (1614132, 2, 'passed');
INSERT INTO Undertakes (Soldier_ID, IPFT_ID, Result) VALUES  (1613793, 1, 'failed');
INSERT INTO Undertakes (Soldier_ID, IPFT_ID, Result) VALUES  (1613793, 2, 'failed');
INSERT INTO Undertakes (Soldier_ID, IPFT_ID, Result) VALUES  (1612880, 1, 'passed');
INSERT INTO Undertakes (Soldier_ID, IPFT_ID, Result) VALUES  (1612880, 2, 'passed');
INSERT INTO Undertakes (Soldier_ID, IPFT_ID, Result) VALUES  (1614635, 1, 'failed');
INSERT INTO Undertakes (Soldier_ID, IPFT_ID, Result) VALUES  (1614635, 2, 'failed');
INSERT INTO Undertakes (Soldier_ID, IPFT_ID, Result) VALUES  (1613595, 1, 'passed');
INSERT INTO Undertakes (Soldier_ID, IPFT_ID, Result) VALUES  (1613595, 2, 'failed');
INSERT INTO Undertakes (Soldier_ID, IPFT_ID, Result) VALUES  (1616732, 1, 'failed');
INSERT INTO Undertakes (Soldier_ID, IPFT_ID, Result) VALUES  (1616732, 2, 'passed');
INSERT INTO Undertakes (Soldier_ID, IPFT_ID, Result) VALUES  (1613079, 1, 'passed');
INSERT INTO Undertakes (Soldier_ID, IPFT_ID, Result) VALUES  (1613079, 2, 'failed');
INSERT INTO Undertakes (Soldier_ID, IPFT_ID, Result) VALUES  (1614671, 1, 'failed');
INSERT INTO Undertakes (Soldier_ID, IPFT_ID, Result) VALUES  (1614671, 2, 'failed');
INSERT INTO Undertakes (Soldier_ID, IPFT_ID, Result) VALUES  (1616911, 1, 'passed');
INSERT INTO Undertakes (Soldier_ID, IPFT_ID, Result) VALUES  (1616911, 2, 'failed');
INSERT INTO Undertakes (Soldier_ID, IPFT_ID, Result) VALUES  (1615829, 1, 'passed');
INSERT INTO Undertakes (Soldier_ID, IPFT_ID, Result) VALUES  (1615829, 2, 'failed');
INSERT INTO Undertakes (Soldier_ID, IPFT_ID, Result) VALUES  (1614187, 1, 'passed');
INSERT INTO Undertakes (Soldier_ID, IPFT_ID, Result) VALUES  (1614187, 2, 'failed');
INSERT INTO Undertakes (Soldier_ID, IPFT_ID, Result) VALUES  (1615568, 1, 'passed');
INSERT INTO Undertakes (Soldier_ID, IPFT_ID, Result) VALUES  (1615568, 2, 'failed');
INSERT INTO Undertakes (Soldier_ID, IPFT_ID, Result) VALUES  (1613992, 1, 'passed');
INSERT INTO Undertakes (Soldier_ID, IPFT_ID, Result) VALUES  (1613992, 2, 'failed');
INSERT INTO Undertakes (Soldier_ID, IPFT_ID, Result) VALUES  (1613754, 1, 'passed');
INSERT INTO Undertakes (Soldier_ID, IPFT_ID, Result) VALUES  (1613754, 2, 'failed');
INSERT INTO Undertakes (Soldier_ID, IPFT_ID, Result) VALUES  (1612735, 1, 'passed');
INSERT INTO Undertakes (Soldier_ID, IPFT_ID, Result) VALUES  (1612735, 2, 'failed');
INSERT INTO Undertakes (Soldier_ID, IPFT_ID, Result) VALUES  (1612739, 1, 'passed');
INSERT INTO Undertakes (Soldier_ID, IPFT_ID, Result) VALUES  (1612739, 2, 'failed');


INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES  (1614287, 1, TO_DATE('2013-01-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES  (1614287, 2, TO_DATE('2014-02-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES  (1614287, 3, TO_DATE('2015-03-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES  (1614287, 5, TO_DATE('2016-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES  (1614287, 6, TO_DATE('2017-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES  (1614287, 7, TO_DATE('2018-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES  (1614287, 8, TO_DATE('2019-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES  (1614287, 9, TO_DATE('2020-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES  (1614287, 10, TO_DATE('2021-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES  (1614287, 11, TO_DATE('2022-04-01', 'YYYY-MM-DD'));
  
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1614132, 1, TO_DATE('2013-01-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1614132, 2, TO_DATE('2014-02-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1614132, 3, TO_DATE('2015-03-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1614132, 4, TO_DATE('2016-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1614132, 5, TO_DATE('2017-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1614132, 6, TO_DATE('2018-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1614132, 7, TO_DATE('2019-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1614132, 8, TO_DATE('2020-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1614132, 9, TO_DATE('2021-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1614132, 10, TO_DATE('2022-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1614132, 11, TO_DATE('2023-04-01', 'YYYY-MM-DD'));
   
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1613793, 1, TO_DATE('2013-01-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1613793, 2, TO_DATE('2014-02-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1613793, 3, TO_DATE('2015-03-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1613793, 4, TO_DATE('2016-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1613793, 5, TO_DATE('2017-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1613793, 6, TO_DATE('2018-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1613793, 7, TO_DATE('2019-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1613793, 8, TO_DATE('2020-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1613793, 9, TO_DATE('2021-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1613793, 10, TO_DATE('2022-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1613793, 11, TO_DATE('2023-04-01', 'YYYY-MM-DD'));
   
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1612880, 1, TO_DATE('2013-01-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1612880, 2, TO_DATE('2014-02-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1612880, 3, TO_DATE('2015-03-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1612880, 4, TO_DATE('2016-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1612880, 5, TO_DATE('2017-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1612880, 6, TO_DATE('2018-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1612880, 7, TO_DATE('2019-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1612880, 8, TO_DATE('2020-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1612880, 9, TO_DATE('2021-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1612880, 10, TO_DATE('2022-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1612880, 11, TO_DATE('2023-04-01', 'YYYY-MM-DD'));
   
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1614635, 1, TO_DATE('2013-01-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1614635, 2, TO_DATE('2014-02-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1614635, 3, TO_DATE('2015-03-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1614635, 4, TO_DATE('2016-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1614635, 5, TO_DATE('2017-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1614635, 6, TO_DATE('2018-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1614635, 7, TO_DATE('2019-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1614635, 8, TO_DATE('2020-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1614635, 9, TO_DATE('2021-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1614635, 10, TO_DATE('2022-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1614635, 11, TO_DATE('2023-04-01', 'YYYY-MM-DD'));
    
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1613595, 1, TO_DATE('2013-01-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1613595, 2, TO_DATE('2014-02-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1613595, 3, TO_DATE('2015-03-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1613595, 4, TO_DATE('2016-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1613595, 5, TO_DATE('2017-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1613595, 6, TO_DATE('2018-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1613595, 7, TO_DATE('2019-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1613595, 8, TO_DATE('2020-04-01', 'YYYY-MM-DD'));
  
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1616732, 1, TO_DATE('2013-01-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1616732, 2, TO_DATE('2014-02-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1616732, 3, TO_DATE('2015-03-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1616732, 4, TO_DATE('2016-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1616732, 5, TO_DATE('2017-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1616732, 6, TO_DATE('2018-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1616732, 7, TO_DATE('2019-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1616732, 8, TO_DATE('2020-04-01', 'YYYY-MM-DD'));

INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1613079, 1, TO_DATE('2016-01-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1613079, 2, TO_DATE('2017-02-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1613079, 3, TO_DATE('2018-03-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1613079, 4, TO_DATE('2019-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1613079, 5, TO_DATE('2020-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1613079, 6, TO_DATE('2021-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1613079, 7, TO_DATE('2022-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1613079, 8, TO_DATE('2023-04-01', 'YYYY-MM-DD'));

INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1614671, 1, TO_DATE('2018-01-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1614671, 2, TO_DATE('2019-02-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1614671, 3, TO_DATE('2020-03-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1614671, 4, TO_DATE('2021-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1614671, 5, TO_DATE('2022-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1614671, 6, TO_DATE('2023-04-01', 'YYYY-MM-DD'));

INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1616911, 1, TO_DATE('2018-01-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1616911, 2, TO_DATE('2019-02-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1616911, 3, TO_DATE('2020-03-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1616911, 4, TO_DATE('2021-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1616911, 5, TO_DATE('2022-04-01', 'YYYY-MM-DD'));

INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1615829, 1, TO_DATE('2018-01-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1615829, 2, TO_DATE('2019-02-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1615829, 3, TO_DATE('2020-03-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1615829, 4, TO_DATE('2021-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1615829, 5, TO_DATE('2022-04-01', 'YYYY-MM-DD'));

INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1614187, 1, TO_DATE('2018-01-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1614187, 2, TO_DATE('2019-02-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1614187, 3, TO_DATE('2020-03-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1614187, 4, TO_DATE('2021-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1614187, 5, TO_DATE('2022-04-01', 'YYYY-MM-DD'));

INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1615568, 1, TO_DATE('2018-01-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1615568, 2, TO_DATE('2019-02-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1615568, 3, TO_DATE('2020-03-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1615568, 4, TO_DATE('2021-04-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1615568, 5, TO_DATE('2022-04-01', 'YYYY-MM-DD'));

INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1613992, 1, TO_DATE('2020-01-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1613992, 2, TO_DATE('2021-01-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1613992, 3, TO_DATE('2022-01-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1613992, 4, TO_DATE('2023-01-01', 'YYYY-MM-DD'));

INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1613754, 1, TO_DATE('2020-01-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1613754, 2, TO_DATE('2021-01-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1613754, 3, TO_DATE('2022-01-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1613754, 4, TO_DATE('2023-01-01', 'YYYY-MM-DD'));

INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1612735, 1, TO_DATE('2020-01-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1612735, 3, TO_DATE('2022-01-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1612735, 4, TO_DATE('2023-01-01', 'YYYY-MM-DD'));

INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1612739, 1, TO_DATE('2020-01-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1612739, 3, TO_DATE('2022-01-01', 'YYYY-MM-DD'));
INSERT INTO Completes_course (Soldier_ID, Course_ID, Date_of_Completion) VALUES (1612739, 4, TO_DATE('2023-01-01', 'YYYY-MM-DD'));


INSERT INTO Courses (Course_ID, Course_Name, lvl) VALUES  (1, 'BTT', 'Army');
INSERT INTO Courses (Course_ID, Course_Name, lvl) VALUES  (2, 'PC Snk to Lcpl', 'Fmn');
INSERT INTO Courses (Course_ID, Course_Name, lvl) VALUES  (3, 'CDO', 'Fmn');
INSERT INTO Courses (Course_ID, Course_Name, lvl) VALUES  (4, 'HSC', 'Army');
INSERT INTO Courses (Course_ID, Course_Name, lvl) VALUES  (5, 'ATT', 'Army');
INSERT INTO Courses (Course_ID, Course_Name, lvl) VALUES  (6, 'PC Lcpl to Cpl', 'Fmn');
INSERT INTO Courses (Course_ID, Course_Name, lvl) VALUES  (7, 'NCOC', 'Army');
INSERT INTO Courses (Course_ID, Course_Name, lvl) VALUES  (8, 'PC Cpl to Sgt', 'Army');
INSERT INTO Courses (Course_ID, Course_Name, lvl) VALUES  (9, 'WOC', 'Army');
INSERT INTO Courses (Course_ID, Course_Name, lvl) VALUES  (10, 'Utility', 'Army');
INSERT INTO Courses (Course_ID, Course_Name, lvl) VALUES  (11, 'PC Sgt to WO', 'Army');
INSERT INTO Courses (Course_ID, Course_Name, lvl) VALUES  (12, 'Crypto Course', 'Fmn');
INSERT INTO Courses (Course_ID, Course_Name, lvl) VALUES  (13, 'ORBIC', 'Army');
INSERT INTO Courses (Course_ID, Course_Name, lvl) VALUES  (14, 'Staff driver', 'Army');
INSERT INTO Courses (Course_ID, Course_Name, lvl) VALUES  (15, 'RR course', 'Fmn');
INSERT INTO Courses (Course_ID, Course_Name, lvl) VALUES  (16, 'Ammo course', 'Army');
INSERT INTO Courses (Course_ID, Course_Name, lvl) VALUES  (17, 'Kote Magazine course', 'Army');
INSERT INTO Courses (Course_ID, Course_Name, lvl) VALUES  (18, 'Bugle course', 'Army');


select DISTINCT SLDRS_BASIC_INFO.SLDR_ID, RANK.RANK,  Sldrs_Basic_Info.NAME, UNDERTAKES.RESULT, UNDERTAKE_RET.RESULT, SLDRS_BASIC_INFO.SVC_AGE
									from Sldrs_Basic_Info, Rank, Punishment, Awarded, RET, Undertake_RET, IPFT, Undertakes, courses, completes_course 
									where Rank.Rank_ID=Sldrs_basic_info.Rank_ID and
									Undertake_RET.Soldier_ID=Sldrs_basic_info.Sldr_ID and
									Undertake_RET.RET_ID= RET.RET_ID and
									Undertakes.Soldier_ID=Sldrs_basic_info.Sldr_ID and
									Undertakes.IPFT_ID=IPFT.IPFT_ID and 
									Punishment.Punishment_ID=Awarded.Punishment_ID and
									Awarded.Soldier_ID=Sldrs_basic_info.Sldr_ID and
									courses.Course_ID=completes_course.Course_ID and
									completes_course.Soldier_ID=Sldrs_basic_info.Sldr_ID and 
									Rank.RANK_ID= 1 and
									svc_age> 4 and
									Med_cat= 'A' and
									Undertakes.result= 'Passed' and
									Undertake_RET.result= 'Passed' 

                  select * from SLDRS_BASIC_INFO





INSERT INTO Leave_Register (Leave_ID, From_Dt, To_Dt, Total_Leave, Leave_Type) VALUES (1, TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-01-05', 'YYYY-MM-DD'), 5, 'clve');
INSERT INTO Leave_Register (Leave_ID, From_Dt, To_Dt, Total_Leave, Leave_Type) VALUES (2, TO_DATE('2023-02-01', 'YYYY-MM-DD'), TO_DATE('2023-02-27', 'YYYY-MM-DD'), 28, 'plve');
INSERT INTO Leave_Register (Leave_ID, From_Dt, To_Dt, Total_Leave, Leave_Type) VALUES (3, TO_DATE('2023-03-20', 'YYYY-MM-DD'), TO_DATE('2023-03-25', 'YYYY-MM-DD'), 6, 'slve');
INSERT INTO Leave_Register (Leave_ID, From_Dt, To_Dt, Total_Leave, Leave_Type) VALUES (4, TO_DATE('2023-04-12', 'YYYY-MM-DD'), TO_DATE('2023-04-16', 'YYYY-MM-DD'), 5, 'clve');
INSERT INTO Leave_Register (Leave_ID, From_Dt, To_Dt, Total_Leave, Leave_Type) VALUES (5, TO_DATE('2023-05-01', 'YYYY-MM-DD'), TO_DATE('2023-05-27', 'YYYY-MM-DD'), 28, 'plve');
INSERT INTO Leave_Register (Leave_ID, From_Dt, To_Dt, Total_Leave, Leave_Type) VALUES (6, TO_DATE('2023-06-10', 'YYYY-MM-DD'), TO_DATE('2023-06-15', 'YYYY-MM-DD'), 6, 'clve');
INSERT INTO Leave_Register (Leave_ID, From_Dt, To_Dt, Total_Leave, Leave_Type) VALUES (7, TO_DATE('2023-06-20', 'YYYY-MM-DD'), TO_DATE('2023-06-25', 'YYYY-MM-DD'), 6, 'slve');
INSERT INTO Leave_Register (Leave_ID, From_Dt, To_Dt, Total_Leave, Leave_Type) VALUES (8, TO_DATE('2023-02-01', 'YYYY-MM-DD'), TO_DATE('2023-02-28', 'YYYY-MM-DD'), 28, 'plve');
INSERT INTO Leave_Register (Leave_ID, From_Dt, To_Dt, Total_Leave, Leave_Type) VALUES (9, TO_DATE('2023-03-05', 'YYYY-MM-DD'), TO_DATE('2023-03-07', 'YYYY-MM-DD'), 3, 'clve');
INSERT INTO Leave_Register (Leave_ID, From_Dt, To_Dt, Total_Leave, Leave_Type) VALUES (10, TO_DATE('2023-01-10', 'YYYY-MM-DD'), TO_DATE('2023-01-15', 'YYYY-MM-DD'), 6, 'clve');
INSERT INTO Leave_Register (Leave_ID, From_Dt, To_Dt, Total_Leave, Leave_Type) VALUES (11, TO_DATE('2023-01-20', 'YYYY-MM-DD'), TO_DATE('2023-01-25', 'YYYY-MM-DD'), 6, 'slve');
INSERT INTO Leave_Register (Leave_ID, From_Dt, To_Dt, Total_Leave, Leave_Type) VALUES (12, TO_DATE('2023-05-12', 'YYYY-MM-DD'), TO_DATE('2023-05-16', 'YYYY-MM-DD'), 5, 'clve');
INSERT INTO Leave_Register (Leave_ID, From_Dt, To_Dt, Total_Leave, Leave_Type) VALUES (13, TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-01-27', 'YYYY-MM-DD'), 28, 'plve');
INSERT INTO Leave_Register (Leave_ID, From_Dt, To_Dt, Total_Leave, Leave_Type) VALUES (14, TO_DATE('2023-02-10', 'YYYY-MM-DD'), TO_DATE('2023-02-15', 'YYYY-MM-DD'), 6, 'slve');
INSERT INTO Leave_Register (Leave_ID, From_Dt, To_Dt, Total_Leave, Leave_Type) VALUES (15, TO_DATE('2023-03-20', 'YYYY-MM-DD'), TO_DATE('2023-03-25', 'YYYY-MM-DD'), 6, 'clve');
INSERT INTO Leave_Register (Leave_ID, From_Dt, To_Dt, Total_Leave, Leave_Type) VALUES (16, TO_DATE('2023-04-01', 'YYYY-MM-DD'), TO_DATE('2023-04-27', 'YYYY-MM-DD'), 28, 'plve');
INSERT INTO Leave_Register (Leave_ID, From_Dt, To_Dt, Total_Leave, Leave_Type) VALUES (17, TO_DATE('2023-05-05', 'YYYY-MM-DD'), TO_DATE('2023-05-07', 'YYYY-MM-DD'), 3, 'slve');


INSERT INTO Granted_Lve (Soldier_ID, Leave_ID) VALUES (1612735, 1);
INSERT INTO Granted_Lve (Soldier_ID, Leave_ID) VALUES (1612739, 2);
INSERT INTO Granted_Lve (Soldier_ID, Leave_ID) VALUES (1612880, 3);
INSERT INTO Granted_Lve (Soldier_ID, Leave_ID) VALUES (1613079, 4);
INSERT INTO Granted_Lve (Soldier_ID, Leave_ID) VALUES (1613595, 5);
INSERT INTO Granted_Lve (Soldier_ID, Leave_ID) VALUES (1613754, 6);
INSERT INTO Granted_Lve (Soldier_ID, Leave_ID) VALUES (1613793, 7);
INSERT INTO Granted_Lve (Soldier_ID, Leave_ID) VALUES (1613992, 8);
INSERT INTO Granted_Lve (Soldier_ID, Leave_ID) VALUES (1614132, 9);
INSERT INTO Granted_Lve (Soldier_ID, Leave_ID) VALUES (1614187, 10);
INSERT INTO Granted_Lve (Soldier_ID, Leave_ID) VALUES (1614287, 11);
INSERT INTO Granted_Lve (Soldier_ID, Leave_ID) VALUES (1614635, 12);
INSERT INTO Granted_Lve (Soldier_ID, Leave_ID) VALUES (1614671, 13);
INSERT INTO Granted_Lve (Soldier_ID, Leave_ID) VALUES (1615568, 14);
INSERT INTO Granted_Lve (Soldier_ID, Leave_ID) VALUES (1615829, 15);
INSERT INTO Granted_Lve (Soldier_ID, Leave_ID) VALUES (1616732, 16);
INSERT INTO Granted_Lve (Soldier_ID, Leave_ID) VALUES (1616911, 17);		


INSERT INTO Appt (Appt_ID, Appt_name, soldier_id) VALUES (1, 'SM', 1614287);
INSERT INTO Appt (Appt_ID, Appt_name, soldier_id) VALUES (2, 'Hclk', 1614132);
INSERT INTO Appt (Appt_ID, Appt_name, soldier_id) VALUES (3, 'BSM', 1613793);
INSERT INTO Appt (Appt_ID, Appt_name, soldier_id) VALUES (4, 'CSM-1', 1612880);
INSERT INTO Appt (Appt_ID, Appt_name, soldier_id) VALUES (5, 'CQ-1', 1614635);
INSERT INTO Appt (Appt_ID, Appt_name, soldier_id) VALUES (6, 'RP NCO', 1613595);
INSERT INTO Appt (Appt_ID, Appt_name, soldier_id) VALUES (7, 'Ammo NCO', 1616732);
INSERT INTO Appt (Appt_ID, Appt_name, soldier_id) VALUES (8, 'Head cook', 1613079);
INSERT INTO Appt (Appt_ID, Appt_name, soldier_id) VALUES (9, 'MT NCO', 1614671);
INSERT INTO Appt (Appt_ID, Appt_name, soldier_id) VALUES (10, 'Field mess NCO', 1616911);
INSERT INTO Appt (Appt_ID, Appt_name, soldier_id) VALUES (11, 'Trg NCO', 1615829);
INSERT INTO Appt (Appt_ID, Appt_name, soldier_id) VALUES (12, 'Snk mess NCO', 1614187);


INSERT INTO Med_Disposal (Disp_ID, Disposal, Date_of_adm, Total_Disp, Reason, Patient_ID, Soldier_ID) VALUES (1, 'SIQ', TO_DATE('2023-01-01', 'YYYY-MM-DD'), 4, 'Loose motion', 1001, 1615829);
INSERT INTO Med_Disposal (Disp_ID, Disposal, Date_of_adm, Total_Disp, Reason, Patient_ID, Soldier_ID) VALUES (2, 'PPGF', TO_DATE('2023-02-15', 'YYYY-MM-DD'), 2, 'Fever', 1002, 1615829);
INSERT INTO Med_Disposal (Disp_ID, Disposal, Date_of_adm, Total_Disp, Reason, Patient_ID, Soldier_ID) VALUES (3, 'Admitted', TO_DATE('2023-03-10', 'YYYY-MM-DD'), 7, 'Injury', 1003, 1614187);
INSERT INTO Med_Disposal (Disp_ID, Disposal, Date_of_adm, Total_Disp, Reason, Patient_ID, Soldier_ID) VALUES (4, 'PPG', TO_DATE('2023-04-05', 'YYYY-MM-DD'), 3, 'Headache', 1004, 1615568);
INSERT INTO Med_Disposal (Disp_ID, Disposal, Date_of_adm, Total_Disp, Reason, Patient_ID, Soldier_ID) VALUES (5, 'SIQ', TO_DATE('2023-05-20', 'YYYY-MM-DD'), 5, 'Stomachache', 1005, 1613992);
INSERT INTO Med_Disposal (Disp_ID, Disposal, Date_of_adm, Total_Disp, Reason, Patient_ID, Soldier_ID) VALUES (6, 'Admitted', TO_DATE('2023-06-12', 'YYYY-MM-DD'), 10, 'Accident', 1006, 1613754);
INSERT INTO Med_Disposal (Disp_ID, Disposal, Date_of_adm, Total_Disp, Reason, Patient_ID, Soldier_ID) VALUES (7, 'SIQ', TO_DATE('2023-07-08', 'YYYY-MM-DD'), 3, 'Flu', 1007, 1612735);
INSERT INTO Med_Disposal (Disp_ID, Disposal, Date_of_adm, Total_Disp, Reason, Patient_ID, Soldier_ID) VALUES (8, 'PPG', TO_DATE('2023-08-18', 'YYYY-MM-DD'), 4, 'Back pain', 1008, 1612739);


INSERT INTO Med_Disposal (Disp_ID, Disposal, Date_of_adm, Total_Disp, Reason, Soldier_ID)
VALUES (1, 'SIQ', TO_DATE('2023-01-01', 'YYYY-MM-DD'), 4, 'Loose motion', 1615829);

INSERT INTO Med_Disposal (Disp_ID, Disposal, Date_of_adm, Total_Disp, Reason, Soldier_ID)
VALUES (2, 'PPGF', TO_DATE('2023-02-15', 'YYYY-MM-DD'), 2, 'Fever', 1615829);

INSERT INTO Med_Disposal (Disp_ID, Disposal, Date_of_adm, Total_Disp, Reason, Soldier_ID)
VALUES (3, 'Admitted', TO_DATE('2023-03-10', 'YYYY-MM-DD'), 7, 'Injury', 1614187);

INSERT INTO Med_Disposal (Disp_ID, Disposal, Date_of_adm, Total_Disp, Reason, Soldier_ID)
VALUES (4, 'PPG', TO_DATE('2023-04-05', 'YYYY-MM-DD'), 3, 'Headache', 1615568);

INSERT INTO Med_Disposal (Disp_ID, Disposal, Date_of_adm, Total_Disp, Reason, Soldier_ID)
VALUES (5, 'SIQ', TO_DATE('2023-05-20', 'YYYY-MM-DD'), 5, 'Stomachache', 1613992);

INSERT INTO Med_Disposal (Disp_ID, Disposal, Date_of_adm, Total_Disp, Reason, Soldier_ID)
VALUES (6, 'Admitted', TO_DATE('2023-06-12', 'YYYY-MM-DD'), 10, 'Accident', 1613754);

INSERT INTO Med_Disposal (Disp_ID, Disposal, Date_of_adm, Total_Disp, Reason, Soldier_ID)
VALUES (7, 'SIQ', TO_DATE('2023-07-08', 'YYYY-MM-DD'), 3, 'Flu', 1612735);

INSERT INTO Med_Disposal (Disp_ID, Disposal, Date_of_adm, Total_Disp, Reason, Soldier_ID)
VALUES (8, 'PPG', TO_DATE('2023-08-18', 'YYYY-MM-DD'), 4, 'Back pain', 1612739);


INSERT INTO RET (RET_ID, Year)
VALUES (1, 2023);

INSERT INTO Undertake_RET (Soldier_ID, RET_ID, Result) VALUES (1612735, 1, 'pass');
INSERT INTO Undertake_RET (Soldier_ID, RET_ID, Result) VALUES (1612739, 1, 'pass');
INSERT INTO Undertake_RET (Soldier_ID, RET_ID, Result) VALUES (1612880, 1, 'fail');
INSERT INTO Undertake_RET (Soldier_ID, RET_ID, Result) VALUES (1613079, 1, 'pass');
INSERT INTO Undertake_RET (Soldier_ID, RET_ID, Result) VALUES (1613595, 1, 'pass');
INSERT INTO Undertake_RET (Soldier_ID, RET_ID, Result) VALUES (1613754, 1, 'pass');
INSERT INTO Undertake_RET (Soldier_ID, RET_ID, Result) VALUES (1613793, 1, 'fail');
INSERT INTO Undertake_RET (Soldier_ID, RET_ID, Result) VALUES (1613992, 1, 'pass');
INSERT INTO Undertake_RET (Soldier_ID, RET_ID, Result) VALUES (1614132, 1, 'fail');
INSERT INTO Undertake_RET (Soldier_ID, RET_ID, Result) VALUES (1614187, 1, 'fail');
INSERT INTO Undertake_RET (Soldier_ID, RET_ID, Result) VALUES (1614287, 1, 'pass');
INSERT INTO Undertake_RET (Soldier_ID, RET_ID, Result) VALUES (1614635, 1, 'pass');
INSERT INTO Undertake_RET (Soldier_ID, RET_ID, Result) VALUES (1614671, 1, 'fail');
INSERT INTO Undertake_RET (Soldier_ID, RET_ID, Result) VALUES (1615568, 1, 'pass');
INSERT INTO Undertake_RET (Soldier_ID, RET_ID, Result) VALUES (1615829, 1, 'pass');
INSERT INTO Undertake_RET (Soldier_ID, RET_ID, Result) VALUES (1616732, 1, 'fail');
INSERT INTO Undertake_RET (Soldier_ID, RET_ID, Result) VALUES (1616911, 1, 'pass');


INSERT INTO Punishment (Punishment_ID, Punishment, Incident) VALUES (1, '07xDays RI', 'moral_turpitude');
INSERT INTO Punishment (Punishment_ID, Punishment, Incident) VALUES (2, '10xDays RI', 'Theft');
INSERT INTO Punishment (Punishment_ID, Punishment, Incident) VALUES (3, '07xDays RI', 'violation_of_good_order');
INSERT INTO Punishment (Punishment_ID, Punishment, Incident) VALUES (4, '07XDays RI', 'absent_from_duty');


 INSERT INTO AWARDED (SOLDIER_ID, PUNISHMENT_ID) VALUES (1616732, 1);
 INSERT INTO AWARDED (SOLDIER_ID, PUNISHMENT_ID) VALUES (1615568, 2);
 INSERT INTO AWARDED (SOLDIER_ID, PUNISHMENT_ID) VALUES (1612739, 3);

   INSERT INTO Firing_Standard (Firing_ID, Avg_Gp, Avg_Total_Point, Date_of_fire) VALUES (1, 8, 16, TO_DATE('2023-01-04', 'YYYY-MM-DD'));
  INSERT INTO Firing_Standard (Firing_ID, Avg_Gp, Avg_Total_Point, Date_of_fire) VALUES (2, 9, 15, TO_DATE('2023-02-09', 'YYYY-MM-DD'));
  INSERT INTO Firing_Standard (Firing_ID, Avg_Gp, Avg_Total_Point, Date_of_fire) VALUES (3, 7, 17, TO_DATE('2023-04-07', 'YYYY-MM-DD'));
  INSERT INTO Firing_Standard (Firing_ID, Avg_Gp, Avg_Total_Point, Date_of_fire) VALUES(4, 8, 16, TO_DATE('2023-06-20', 'YYYY-MM-DD'));


   INSERT INTO Achieves (Soldier_ID, Firing_ID) VALUES (1612735, 1);
  INSERT INTO Achieves (Soldier_ID, Firing_ID) VALUES(1612739, 1);
  INSERT INTO Achieves (Soldier_ID, Firing_ID) VALUES(1612880, 1);
  INSERT INTO Achieves (Soldier_ID, Firing_ID) VALUES(1613079, 1);
  INSERT INTO Achieves (Soldier_ID, Firing_ID) VALUES (1613595, 2);
  INSERT INTO Achieves (Soldier_ID, Firing_ID) VALUES(1613754, 2);
  INSERT INTO Achieves (Soldier_ID, Firing_ID) VALUES(1613793, 2);
  INSERT INTO Achieves (Soldier_ID, Firing_ID) VALUES(1613992, 2);
  INSERT INTO Achieves (Soldier_ID, Firing_ID) VALUES (1614132, 3);
  INSERT INTO Achieves (Soldier_ID, Firing_ID) VALUES(1614187, 3);
  INSERT INTO Achieves (Soldier_ID, Firing_ID) VALUES(1614287, 3);
  INSERT INTO Achieves (Soldier_ID, Firing_ID) VALUES(1614635, 3);
  INSERT INTO Achieves (Soldier_ID, Firing_ID) VALUES (1614671, 4);
  INSERT INTO Achieves (Soldier_ID, Firing_ID) VALUES(1615568, 4);
  INSERT INTO Achieves (Soldier_ID, Firing_ID) VALUES(1615829, 4);
  INSERT INTO Achieves (Soldier_ID, Firing_ID) VALUES(1616732, 4);
INSERT INTO Achieves (Soldier_ID, Firing_ID) VALUES(1616911, 4);


  INSERT INTO Competition (Competition_ID, Competition_name) VALUES(1, 'Volleyball');
 INSERT INTO Competition (Competition_ID, Competition_name) VALUES (2, 'Basketball');
 INSERT INTO Competition (Competition_ID, Competition_name) VALUES (3, 'Football');
 INSERT INTO Competition (Competition_ID, Competition_name) VALUES (4, 'Rugby');
 INSERT INTO Competition (Competition_ID, Competition_name) VALUES (5, 'Swimming');
  INSERT INTO Competition (Competition_ID, Competition_name) VALUES(6, 'Firing');
  INSERT INTO Competition (Competition_ID, Competition_name) VALUES(7, 'Aslt Course');


    INSERT INTO Participates (Soldier_ID, Competition_ID) VALUES(1616732, 1);
  INSERT INTO Participates (Soldier_ID, Competition_ID) VALUES(1615829, 2);
  INSERT INTO Participates (Soldier_ID, Competition_ID) VALUES(1615568, 3);
  INSERT INTO Participates (Soldier_ID, Competition_ID) VALUES(1614671, 4);
  INSERT INTO Participates (Soldier_ID, Competition_ID) VALUES(1614635, 5);

    INSERT INTO events (Event_ID, event_name) VALUES (1, 'Darbar');
  INSERT INTO events (Event_ID, event_name) VALUES(2, 'Boro khana');
  INSERT INTO events (Event_ID, event_name) VALUES(3, 'Quiz Cmpt Arrangement');
  INSERT INTO events (Event_ID, event_name) VALUES(4, 'Azan Qirat Cmpt Arrangment');
  INSERT INTO events (Event_ID, event_name) VALUES(5, 'GOC Guard');


    INSERT INTO resp_for (sldr_id, Event_ID) VALUES(1614187, 1);
  INSERT INTO resp_for (sldr_id, Event_ID) VALUES(1614132, 2);
  INSERT INTO resp_for (sldr_id, Event_ID) VALUES(1613793, 3);
  INSERT INTO resp_for (sldr_id, Event_ID) VALUES(1613754, 4);
  INSERT INTO resp_for (sldr_id, Event_ID) VALUES(1613754, 2);

  INSERT INTO career_plan (plan_ID, first_cycle, second_cycle, third_cycle, fourth_cycle)
VALUES (1, 'Admin', 'Leave', 'Course', 'Misc');

INSERT INTO career_plan (plan_ID, first_cycle, second_cycle, third_cycle, fourth_cycle)
VALUES (2, 'Misc', 'Admin', 'Leave', 'Course');

INSERT INTO career_plan (plan_ID, first_cycle, second_cycle, third_cycle, fourth_cycle)
VALUES (3, 'Course', 'Misc', 'Admin', 'Leave');

INSERT INTO career_plan (plan_ID, first_cycle, second_cycle, third_cycle, fourth_cycle)
VALUES (4, 'Leave', 'Course', 'Misc', 'Admin');


  INSERT INTO follows (SLDR_ID, plan_ID) VALUES (1612735, 1);
  INSERT INTO follows (SLDR_ID, plan_ID) VALUES (1612739, 1);
  INSERT INTO follows (SLDR_ID, plan_ID) VALUES (1612880, 1);
  INSERT INTO follows (SLDR_ID, plan_ID) VALUES (1613079, 1);
  INSERT INTO follows (SLDR_ID, plan_ID) VALUES (1613595, 2);
  INSERT INTO follows (SLDR_ID, plan_ID) VALUES (1613754, 2);
  INSERT INTO follows (SLDR_ID, plan_ID) VALUES (1613793, 2);
  INSERT INTO follows (SLDR_ID, plan_ID) VALUES (1613992, 2);
  INSERT INTO follows (SLDR_ID, plan_ID) VALUES (1614132, 3);
  INSERT INTO follows (SLDR_ID, plan_ID) VALUES (1614187, 3);
  INSERT INTO follows (SLDR_ID, plan_ID) VALUES (1614287, 3);
  INSERT INTO follows (SLDR_ID, plan_ID) VALUES (1614635, 3);
  INSERT INTO follows (SLDR_ID, plan_ID) VALUES (1614671, 3);
  INSERT INTO follows (SLDR_ID, plan_ID) VALUES (1615568, 4);
  INSERT INTO follows (SLDR_ID, plan_ID) VALUES (1615829, 4);
  INSERT INTO follows (SLDR_ID, plan_ID) VALUES (1616732, 4);
  INSERT INTO follows (SLDR_ID, plan_ID) VALUES (1616911, 4);


    INSERT INTO overweight_chart (Wt_Upto_30, Wt_yrs_31_to_40, Wt_yrs_41_to_50, Wt_over_50, height)
  VALUES (62, 66, 67, 68, 62);
  
  INSERT INTO overweight_chart (Wt_Upto_30, Wt_yrs_31_to_40, Wt_yrs_41_to_50, Wt_over_50, height)
  VALUES (64, 68, 69, 70, 63);
  
  INSERT INTO overweight_chart (Wt_Upto_30, Wt_yrs_31_to_40, Wt_yrs_41_to_50, Wt_over_50, height)
  VALUES (66, 70, 71, 73, 64);
  
  INSERT INTO overweight_chart (Wt_Upto_30, Wt_yrs_31_to_40, Wt_yrs_41_to_50, Wt_over_50, height)
  VALUES (68, 72, 74, 75, 65);
  
  INSERT INTO overweight_chart (Wt_Upto_30, Wt_yrs_31_to_40, Wt_yrs_41_to_50, Wt_over_50, height)
  VALUES (70, 74, 76, 77, 66);

  INSERT INTO overweight_chart (Wt_Upto_30, Wt_yrs_31_to_40, Wt_yrs_41_to_50, Wt_over_50, height)
  VALUES (72, 77, 78, 80, 67);
  
  INSERT INTO overweight_chart (Wt_Upto_30, Wt_yrs_31_to_40, Wt_yrs_41_to_50, Wt_over_50, height)
  VALUES (75, 79, 81, 82, 68);
  
  INSERT INTO overweight_chart (Wt_Upto_30, Wt_yrs_31_to_40, Wt_yrs_41_to_50, Wt_over_50, height)
  VALUES (77, 81, 83, 84, 69);
  
  INSERT INTO overweight_chart (Wt_Upto_30, Wt_yrs_31_to_40, Wt_yrs_41_to_50, Wt_over_50, height)
  VALUES (79, 84, 85, 87, 70);
  
  INSERT INTO overweight_chart (Wt_Upto_30, Wt_yrs_31_to_40, Wt_yrs_41_to_50, Wt_over_50, height)
  VALUES (81, 86, 88, 89, 71);
  
  INSERT INTO overweight_chart (Wt_Upto_30, Wt_yrs_31_to_40, Wt_yrs_41_to_50, Wt_over_50, height)
  VALUES (84, 89, 90, 92, 72);
  
  INSERT INTO overweight_chart (Wt_Upto_30, Wt_yrs_31_to_40, Wt_yrs_41_to_50, Wt_over_50, height)
  VALUES (86, 91, 93, 95, 73);
  
  INSERT INTO overweight_chart (Wt_Upto_30, Wt_yrs_31_to_40, Wt_yrs_41_to_50, Wt_over_50, height)
  VALUES (88, 94, 95, 97, 74);


  CREATE TABLE overweight_chart (
  Wt_Upto_30 NUMBER,
  Wt_yrs_31_to_40 NUMBER,
  Wt_yrs_41_to_50 NUMBER,
  Wt_over_50 NUMBER,
  height NUMBER
  
);


select DISTINCT SLDRS_BASIC_INFO.SLDR_ID, RANK.RANK,  Sldrs_Basic_Info.NAME, UNDERTAKES.RESULT, UNDERTAKE_RET.RESULT, SLDRS_BASIC_INFO.SVC_AGE
									from Sldrs_Basic_Info, Rank, Punishment, Awarded, RET, Undertake_RET, IPFT, Undertakes, courses, completes_course 
									where Rank.Rank_ID=Sldrs_basic_info.Rank_ID and
									Undertake_RET.Soldier_ID=Sldrs_basic_info.Sldr_ID and
									Undertake_RET.RET_ID= RET.RET_ID and
									Undertakes.Soldier_ID=Sldrs_basic_info.Sldr_ID and
									Undertakes.IPFT_ID=IPFT.IPFT_ID and 
									Punishment.Punishment_ID=Awarded.Punishment_ID and
									Awarded.Soldier_ID=Sldrs_basic_info.Sldr_ID and
									courses.Course_ID=completes_course.Course_ID and
									completes_course.Soldier_ID=Sldrs_basic_info.Sldr_ID and 
									Rank.RANK_ID= 1 and
									svc_age> 7 and
									Med_cat= 'A' and
									Undertakes.result= 'passed' and
									Undertake_RET.result= 'pass' and
									COMPLETES_COURSE.COURSE_ID in (2, 3) 


                  select * from SLDRS_BASIC_INFO


select DISTINCT SLDRS_BASIC_INFO.SLDR_ID as SLDR_ID, RANK.RANK,  Sldrs_Basic_Info.NAME, UNDERTAKES.RESULT, UNDERTAKE_RET.RESULT, SLDRS_BASIC_INFO.SVC_AGE
									from Sldrs_Basic_Info, Rank, Punishment, Awarded, RET, Undertake_RET, IPFT, Undertakes, courses, completes_course 
									where Rank.Rank_ID=Sldrs_basic_info.Rank_ID and
									Undertake_RET.Soldier_ID=Sldrs_basic_info.Sldr_ID and
									Undertake_RET.RET_ID= RET.RET_ID and
									Undertakes.Soldier_ID=Sldrs_basic_info.Sldr_ID and
									Undertakes.IPFT_ID=IPFT.IPFT_ID and 
									Punishment.Punishment_ID=Awarded.Punishment_ID and
									Awarded.Soldier_ID=Sldrs_basic_info.Sldr_ID and
									courses.Course_ID=completes_course.Course_ID and
									completes_course.Soldier_ID=Sldrs_basic_info.Sldr_ID and 
									Rank.RANK_ID= 2 and
									svc_age> 7 and
									Med_cat= 'A' and
									Undertakes.result= 'passed' and
									Undertake_RET.result= 'pass' and
									COMPLETES_COURSE.COURSE_ID in (6, 7)                   



select DISTINCT SLDRS_BASIC_INFO.SLDR_ID, RANK.RANK,  Sldrs_Basic_Info.NAME, UNDERTAKES.RESULT, UNDERTAKE_RET.RESULT, SLDRS_BASIC_INFO.SVC_AGE
									from Sldrs_Basic_Info, Rank, Punishment, Awarded, RET, Undertake_RET, IPFT, Undertakes, courses, completes_course 
									where Rank.Rank_ID=Sldrs_basic_info.Rank_ID and
									Undertake_RET.Soldier_ID=Sldrs_basic_info.Sldr_ID and
									Undertake_RET.RET_ID= RET.RET_ID and
									Undertakes.Soldier_ID=Sldrs_basic_info.Sldr_ID and
									Undertakes.IPFT_ID=IPFT.IPFT_ID and 
									Punishment.Punishment_ID=Awarded.Punishment_ID and
									Awarded.Soldier_ID=Sldrs_basic_info.Sldr_ID and
									courses.Course_ID=completes_course.Course_ID and
									completes_course.Soldier_ID=Sldrs_basic_info.Sldr_ID and 
									Rank.RANK_ID= 3 and
									svc_age> 15 and
									Med_cat= 'A' and
									Undertakes.result= 'passed' and
									Undertake_RET.result= 'pass' and
									COMPLETES_COURSE.COURSE_ID in (8, 109)                   



                  select Sldr_ID, Rank, Sldrs_basic_info.Name, svc_age, Med_cat, Undertakes.result, Undertake_RET.result, Punishment 
									from Sldrs_Basic_Info, Rank, Punishment, Awarded, RET, Undertake_RET, IPFT, Undertakes
									where Rank.Rank_ID=Sldrs_basic_info.Rank_ID and
									Undertake_RET.Soldier_ID=Sldrs_basic_info.Sldr_ID and
									Undertake_RET.RET_ID= RET.RET_ID and
									Undertakes.Soldier_ID=Sldrs_basic_info.Sldr_ID and
									Undertakes.IPFT_ID=IPFT.IPFT_ID and 
									Punishment.Punishment_ID=Awarded.Punishment_ID and
									Awarded.Soldier_ID=Sldrs_basic_info.Sldr_ID and
									Med_cat= 'A' and
									Height > 65 and
									Undertakes.result= 'passed' and
									Undertake_RET.result= 'pass' and
									incident ='nil'

select DISTINCT Sldr_ID, Rank, Sldrs_basic_info.Name, svc_age, Med_cat, Undertakes.result, Undertake_RET.result,course_name, Punishment 
									from Sldrs_Basic_Info, Rank, Punishment, Awarded, RET, Undertake_RET, IPFT, Undertakes, courses, completes_course 
									where Rank.Rank_ID=Sldrs_basic_info.Rank_ID and
									Undertake_RET.Soldier_ID=Sldrs_basic_info.Sldr_ID and
									Undertake_RET.RET_ID= RET.RET_ID and
									Undertakes.Soldier_ID=Sldrs_basic_info.Sldr_ID and
									Undertakes.IPFT_ID=IPFT.IPFT_ID and 
									Punishment.Punishment_ID=Awarded.Punishment_ID and
									Awarded.Soldier_ID=Sldrs_basic_info.Sldr_ID and
									courses.Course_ID=completes_course.Course_ID and
									completes_course.Soldier_ID=Sldrs_basic_info.Sldr_ID and 
									
									Med_cat= 'A' and
									Undertakes.result= 'passed' and
									Undertake_RET.result= 'pass' and
									COMPLETES_COURSE.COURSE_ID in (8, 109) and 
									Punishment = 'nil'    



select Sldrs_basic_info.Sldr_ID, Rank, Sldrs_basic_info.Name, FIRING_STANDARD.AVG_TOTAL_POINT
from Sldrs_Basic_Info, Rank, Firing_Standard, Achieves
where Rank.Rank_ID=Sldrs_basic_info.Rank_ID and
Achieves.Soldier_ID=Sldrs_basic_info.Sldr_ID and
Firing_Standard.Firing_ID= Achieves.Firing_ID AND
FIRING_STANDARD.AVG_TOTAL_POINT = (
  select max(FIRING_STANDARD.AVG_TOTAL_POINT)
  from FIRING_STANDARD
) 

select count(Result) AS PASSCOUNT
                                from Sldrs_Basic_Info, IPFT,  Undertakes            
                                where  Undertakes.Soldier_ID=Sldrs_basic_info.Sldr_ID and
                                Undertakes.IPFT_ID=IPFT.IPFT_ID and
                                Result= 'passed'
                                and PERIOD = '1st_bi-annual'


select *
                                from Sldrs_Basic_Info, IPFT,  Undertakes            
                                where  Undertakes.Soldier_ID=Sldrs_basic_info.Sldr_ID and
                                Undertakes.IPFT_ID

create or replace view IPFT_RET_VIEW as
select s.Sldr_ID, r.Rank, s.Name, i.Year, i.Period,ur.result "RET Result"
from Sldrs_Basic_Info s, Rank r, IPFT i,  Undertakes u, RET r, undertake_ret ur
where r.Rank_ID=s.Rank_ID and  
u.Soldier_ID=s.Sldr_ID and
u.IPFT_ID=i.IPFT_ID and 
i.Year = '2023' and  i.Period= '2nd_bi-annual' and
ur.Soldier_ID=s.Sldr_ID and
ur.RET_ID= r.RET_ID and
r.Year= '2023';    

select *
from IPFT_RET_VIEW


select count(Soldier_ID) AS CLEAVECOUNT
                                from Granted_Lve, Leave_Register
                                where Granted_Lve.Leave_ID=Leave_Register.Leave_ID and
                               
                                LEAVE_TYPE = 'clve'

SELECT count(Sldrs_Basic_Info.Sldr_ID) AS DISPCOUNT
                                FROM Sldrs_Basic_Info, Med_Disposal
                                WHERE Med_Disposal.Soldier_ID = Sldrs_Basic_Info.Sldr_ID
                                AND CURRENT_DATE <= (
                                    SELECT MAX(Date_of_adm + Total_Disp)
                                    FROM Med_Disposal
                                    WHERE Med_Disposal.Soldier_ID = Sldrs_Basic_Info.Sldr_ID) 

SELECT SLDRS_BASIC_INFO.SLDR_ID, SLDRS_BASIC_INFO.NAME
                                FROM Sldrs_Basic_Info, Med_Disposal
                                WHERE Med_Disposal.Soldier_ID = Sldrs_Basic_Info.Sldr_ID
                                AND CURRENT_DATE <= (
                                    SELECT MAX(Date_of_adm + Total_Disp)
                                    FROM Med_Disposal
                                    WHERE Med_Disposal.Soldier_ID = Sldrs_Basic_Info.Sldr_ID)                                     
                                                 



SELECT SLDRS_BASIC_INFO.SLDR_ID, SLDRS_BASIC_INFO.NAME, COURSES.COURSE_NAME
                                FROM Courses, Completes_course, Sldrs_Basic_Info
                                WHERE Courses.Course_ID = Completes_course.Course_ID
                                AND Soldier_ID = Sldr_ID
                                AND COURSES.COURSE_NAME = 'CDO'      


select Sldr_ID, Rank, Sldrs_basic_info.Name, Competition_name
                                from Sldrs_Basic_Info, Rank, Competition, Participates
                                where Rank.Rank_ID=Sldrs_basic_info.Rank_ID and
                                Participates.Competition_ID=Competition.Competition_ID and
                                Participates.Soldier_ID= Sldrs_basic_info.Sldr_ID 
                                and SLDRS_BASIC_INFO.SLDR_ID = 1615568         

select count(Soldier_ID) AS CLEAVECOUNT
                                from Granted_Lve, Leave_Register
                                where Granted_Lve.Leave_ID=Leave_Register.Leave_ID and
                                CURRENT_DATE <= To_Dt and
                                LEAVE_TYPE = 'clve'  


select Sldr_ID, Rank, Sldrs_basic_info.Name, RANK.RANK, PUNISHMENT.PUNISHMENT
                                from Sldrs_Basic_Info, Rank, PUNISHMENT,AWARDED
                                where Rank.Rank_ID=Sldrs_basic_info.Rank_ID and
                                PUNISHMENT.PUNISHMENT_ID = AWARDED.PUNISHMENT_ID AND
                                AWARDED.SOLDIER_ID = SLDRS_BASIC_INFO.SLDR_ID


CREATE OR REPLACE TRIGGER update_rank
BEFORE UPDATE OF Promotion_Dt ON sldrs_basic_info
FOR EACH ROW
DECLARE
    v_rank_id NUMBER;
BEGIN
    
    SELECT Rank_ID INTO v_rank_id
    FROM Rank
    WHERE Rank_ID = :NEW.Rank_ID;

    IF :NEW.Promotion_Dt <> :OLD.Promotion_Dt THEN
        IF v_rank_id = 1 AND :NEW.Promotion_Dt IS NOT NULL THEN
            :NEW.Rank_ID := 2; 
        ELSIF v_rank_id = 2 AND :NEW.Promotion_Dt IS NOT NULL THEN
            :NEW.Rank_ID := 3;
        ELSIF v_rank_id = 3 AND :NEW.Promotion_Dt IS NOT NULL THEN
            :NEW.Rank_ID := 4;
        ELSIF v_rank_id = 4 AND :NEW.Promotion_Dt IS NOT NULL THEN
            :NEW.Rank_ID := 5;
        ELSIF v_rank_id = 5 AND :NEW.Promotion_Dt IS NOT NULL THEN
            :NEW.Rank_ID := 6;
        ELSIF v_rank_id = 6 AND :NEW.Promotion_Dt IS NOT NULL THEN
            :NEW.Rank_ID := 7;
        ELSIF v_rank_id = 7 AND :NEW.Promotion_Dt IS NOT NULL THEN
            :NEW.Rank_ID := 8;
        END IF;
    END IF;
END;                            

CREATE OR REPLACE TRIGGER fitness_status
AFTER INSERT OR UPDATE OF result ON Undertakes
FOR EACH ROW
DECLARE
  status VARCHAR2(50);
BEGIN
  IF :new.result = 'passed' THEN
    status := 'Passed';
  ELSIF :new.result = 'failed' THEN
    status := 'failed';
  END IF;

  DBMS_OUTPUT.PUT_LINE('IPFT status for Soldier ID ' || :new.Sldr_ID || ' updated: ' || status);
END;


CREATE OR REPLACE TRIGGER RET_status
AFTER INSERT OR UPDATE OF result ON Undertake_RET
FOR EACH ROW
DECLARE
  status VARCHAR2(50);
BEGIN
  IF :new.result = 'Passed' THEN
    status := 'Passed';
  ELSIF :new.result = 'Failed' THEN
    status := 'Failed';
  END IF;

  DBMS_OUTPUT.PUT_LINE('RET status for Soldier ID ' || :new.Sldr_ID || ' updated: ' || status);
END;


CREATE OR REPLACE TRIGGER Med_Disposal_Tracking
AFTER INSERT OR UPDATE OF total_disp ON Med_Disposal
FOR EACH ROW
DECLARE
  status VARCHAR2(20);
BEGIN
  IF :new.total_disp > 30 THEN
    status := 'critical';
  END IF;
  
  DBMS_OUTPUT.PUT_LINE('Med_Disposal status for soldier_id ' || :new.sldr_id || ' updated: ' || status);
END;


CREATE VIEW Career_View AS
SELECT s.sldr_ID, s.Name, r.Rank, cc.coy_name, cp.first_cycle, cp.second_cycle, cp.third_cycle, cp.fourth_cycle
FROM sldrs_Basic_Info s
LEFT JOIN Rank r ON s.Rank_ID = r.Rank_ID
LEFT JOIN command_channel cc ON s.sldr_ID = cc.SLDR_ID
LEFT JOIN follows f ON s.sldr_ID = f.sldr_ID
LEFT JOIN career_plan cp ON f.plan_ID = cp.plan_ID;

create view course_completion_view as 
select  c.Course_Name, cc.Date_of_Completion  
from Courses c, Completes_course cc, sldrs_basic_info s
where c.Course_ID=cc.Course_ID and
s.Sldr_ID=cc.Soldier_ID and S.Name like '%R%'
order by s.Rank_ID ASC, s.Sldr_ID ASC

create view course_not_completion_view as 
select s.Sldr_ID, r.Rank, s.Name 
from Courses c, Completes_course cc, Sldrs_Basic_Info s, Rank r
where c.Course_ID=cc.Course_ID and
s.Sldr_ID=cc.Soldier_ID and  r.Rank_ID=s.Rank_ID and
Course_Name not like '%X%'
order by s.Rank_ID ASC, s.Sldr_ID ASC

create view participants_competition_view as 
select s.Sldr_ID, r.Rank, s.Name, c.Competition_name
from Sldrs_Basic_Info s, Rank r, Competition c, Participates p
where r.Rank_ID=s.Rank_ID and
p.Competition_ID=c.Competition_ID and
p.Soldier_ID= s.Sldr_ID
order by s.Rank_ID ASC, s.Sldr_ID ASC

create view good_firer_view as 
select s.Sldr_ID, r.Rank, s.Name, f.AVG_TOTAL_POINT
from Sldrs_Basic_Info s, Rank r, Firing_Standard f, Achieves a
where r.Rank_ID=s.Rank_ID and
a.Soldier_ID=s.Sldr_ID and
f.Firing_ID= a.Firing_ID
order by f.Avg_Total_Point DESC, s.Rank_ID ASC, s.Sldr_ID ASC

create view IPFT_RET_VIEW as
select s.Sldr_ID, r.Rank, s.Name, i.Year, i.Period, u.result "IPFT Result",ur.result "RET Result"
from Sldrs_Basic_Info s, Rank r, IPFT i,  Undertakes u, RET r, undertake_ret ur
where r.Rank_ID=s.Rank_ID and  
u.Soldier_ID=s.Sldr_ID and
u.IPFT_ID=i.IPFT_ID and 
i.Year = '2023' and  i.Period= '2nd bi-annual' and
ur.Soldier_ID=s.Sldr_ID and
ur.RET_ID= r.RET_ID and
r.Year= '2023';


