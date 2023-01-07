--CRICKETERS TABLE
CREATE TABLE CRICKETERS
(
CRIC_ID VARCHAR2(5) PRIMARY KEY,
CRIC_NAME VARCHAR2(30),
CRIC_ADDRESS VARCHAR2(50),
CRIC_AGE NUMBER(5),
CRIC_HEIGHT NUMBER(2),
CRIC_BATSTYLE VARCHAR2(50),
CRIC_BOWLSTYLE VARCHAR2(50),
CRIC_PLAYROLE VARCHAR2(60),
DOB DATE
);

--INSERTED DATA INTO CRICKETERS TABLE
INSERT INTO CRICKETERS VALUES('C0001','Rohit Sharma','Mumbai',34,6,'RightHandBatsman','RightArmOffbreak','Toporderbatter','30-APR-87');
INSERT INTO CRICKETERS VALUES('C0002','virat Kohli','Delhi',33,5,'RightHandBatsman','RightArmMedium','Toporderbatter','05-NOV-88');
INSERT INTO CRICKETERS VALUES('C0003','Rishav Pant','Delhi',24,5,'LeftHandBatsman','','WicketKeeperbatter','04-OCT-97');
INSERT INTO CRICKETERS VALUES('C0004','Jasprit Bumrah','Gujrat',28,5,'RightHandBatsman','RightArmFast','Bowler','06-DEC-93');
INSERT INTO CRICKETERS VALUES('C0005','Ravindra Jadeja','Gujrat',33,6,'LeftHandBatsman','SlowLeftArmOrthodox','Allrounder','06-DEC-88');

--DISPLAYING DATA FROM  CRICKETERS TABLE
SELECT * FROM CRICKETERS;
--BATSMAN TABLE
CREATE TABLE BATSMAN
(
BATSMAN_ID NUMBER(5),
CRIC_ID VARCHAR2(5) ,
NO_OF_RUNS NUMBER(4),
NO_OF_BALLS NUMBER(4),
NO_OF_FOURS NUMBER(2),
NO_OF_SIXES NUMBER(2),
BATSMAN_STRIKE_RATE NUMBER(4)
);
--INSERTED DATA INTO BATSMAN TABLE
INSERT INTO BATSMAN VALUES(10001,'C0001',40,20,4,2,200);
INSERT INTO BATSMAN VALUES(10002,'C0002',50,20,3,4,250);
INSERT INTO BATSMAN VALUES(10001,'C0001',102,50,10,6,204);
INSERT INTO BATSMAN VALUES(10002,'C0002',48,24,4,3,200);
INSERT INTO BATSMAN VALUES(10001,'C0001',36,12,3,2,300);
INSERT INTO BATSMAN VALUES(10003,'C0003',65,24,5,2,270);
INSERT INTO BATSMAN VALUES(10003,'C0003',30,20,4,3,150);
INSERT INTO BATSMAN VALUES(10005,'C0005',30,20,4,3,150);
INSERT INTO BATSMAN VALUES(10001,'C0001',100,40,6,3,250);
INSERT INTO BATSMAN VALUES(10005,'C0005',80,40,7,1,200);
--DISPLAYING DATA FROM  BATSMAN TABLE
SELECT * FROM BATSMAN;

--BOWLER TABLE
CREATE TABLE BOWLER
(
BOWLER_ID NUMBER(5),
CRIC_ID VARCHAR2(5) ,
NO_OF_RUNS NUMBER(4),
NO_OF_BALLS NUMBER(4),
NO_OF_WICKETS NUMBER(3),
NO_OF_MAIDENOVER NUMBER(2),
NO_OF_HATRICK NUMBER(3)
);
----INSERTED DATA INTO BOWLER TABLE
INSERT INTO BOWLER VALUES(20004,'C0004',30,18,5,2,1);
INSERT INTO BOWLER VALUES(20005,'C0005',26,18,4,2,1);
INSERT INTO BOWLER VALUES(20004,'C0004',36,24,7,1,2);
INSERT INTO BOWLER VALUES(20005,'C0005',24,12,6,0,1);
INSERT INTO BOWLER VALUES(20004,'C0004',40,18,8,1,2);
INSERT INTO BOWLER VALUES(20004,'C0004',28,18,5,1,1);
INSERT INTO BOWLER VALUES(20005,'C0005',30,24,6,2,2);
INSERT INTO BOWLER VALUES(20005,'C0005',50,30,4,1,0);
INSERT INTO BOWLER VALUES(20001,'C0001',45,24,5,1,1);
INSERT INTO BOWLER VALUES(20004,'C0004',28,18,6,1,2);
INSERT INTO BOWLER VALUES(20004,'C0004',28,18,0,1,2);
INSERT INTO BOWLER VALUES(20004,'C0004',28,18,0,1,2);
INSERT INTO BOWLER VALUES(20004,'C0004',28,18,0,1,2);
INSERT INTO BOWLER VALUES(20004,'C0004',28,18,0,1,2);
INSERT INTO BOWLER VALUES(20004,'C0004',28,18,0,1,2);
INSERT INTO BOWLER VALUES(20004,'C0004',28,18,0,1,2);
INSERT INTO BOWLER VALUES(20004,'C0004',28,18,1,1,2);

--DISPLAYING DATA FROM  BOWLER TABLE
SELECT * FROM BOWLER;


--DISPLAYING TOTAL NO OF RUNS,AVERAGE STRIKE RATE OF A BATSMAN WITH A CRICKET ID FROM BATSMAN TABLE
SELECT CRIC_ID,SUM(NO_OF_RUNS)AS TOTAL_NO_OF_RUNS,AVG(BATSMAN_STRIKE_RATE) AS AVG_STRIKE_RATE  FROM BATSMAN GROUP BY CRIC_ID HAVING CRIC_ID='C0001';



--DISPLAYING TOTAL NO OF WICKETS,TOTAL AVERAGE,TOTAL HATTRICKS OF A BOWLER WITH A CRICKET ID FROM BOWLER TABLE
SELECT CRIC_ID,SUM(NO_OF_WICKETS) AS TOTAL_WICKET,AVG(NO_OF_WICKETS) AS TOTAL_AVERAGE,SUM(NO_OF_HATRICK) AS TOTAL_HATRICK FROM BOWLER GROUP BY CRIC_ID  HAVING CRIC_ID='C0005';



--DISPLAYING TOTAL NO OF RUNS,AVERAGE OF NO OF RUNS,BATSMAN STRIKE RATE,NO OF 50'S,NO OF 100'S OF A BATSMAN WITH A CRICKET ID FROM BATSMAN TABLE
SELECT
    CRIC_ID,
    SUM(NO_OF_RUNS) AS TOTAL_NO_OF_RUNS,
    AVG(NO_OF_RUNS) ,
    AVG(BATSMAN_STRIKE_RATE),
    COUNT(
    CASE
        WHEN NO_OF_RUNS >= 50 AND NO_OF_RUNS < 100 THEN NO_OF_RUNS
        ELSE NULL
    END
    )  AS "50'S",
    COUNT(
    CASE
        WHEN NO_OF_RUNS >= 100 AND NO_OF_RUNS < 200 THEN NO_OF_RUNS
        ELSE NULL
    END
    )  AS "100'S"
 FROM BATSMAN GROUP BY CRIC_ID HAVING CRIC_ID='C0001';
 
 --DISPLAY  COUNT OF NO_OF_WICKETS USING COUNT WHEN WHERE  COUNT OF NO_OF_WICKETS CAN BE MINIMUM 5 AND MINIMUM 1 WITH A CRIC_ID
 SELECT
    CRIC_ID,
    COUNT(CRIC_ID) AS NO_OF_MATCHES,
    SUM(NO_OF_WICKETS) AS TOTAL_WICKET,
    AVG(NO_OF_WICKETS),
   
    COUNT(
    CASE
        WHEN NO_OF_WICKETS >= 1  THEN NO_OF_WICKETS
        ELSE NULL
    END
    )  AS "1'WICKETS",
   

    COUNT(
    CASE
        WHEN NO_OF_WICKETS >= 5 THEN NO_OF_WICKETS
        ELSE NULL
    END
    )  AS "5'WICKETS"
FROM BOWLER GROUP BY CRIC_ID;


--DISPLAYING CRICKETER'S NAME WITH CRICKETER'S ID ON THE BASIS OF MAXIMUM RUNS SCORED BY THE CRICKETER(BATSMAN),MAXIMUM NO OF WICKETS TAKEN BY THE CRICKETER(BOWLER)
SELECT CRICKETERS.CRIC_ID, CRICKETERS.CRIC_NAME,MAX(NO_OF_RUNS) AS MAX_RUNS
FROM
CRICKETERS ,BATSMAN
WHERE CRICKETERS.CRIC_ID=BATSMAN.CRIC_ID
GROUP BY CRICKETERS.CRIC_NAME,CRICKETERS.CRIC_ID
ORDER BY MAX(NO_OF_RUNS) DESC ;



SELECT CRICKETERS.CRIC_ID, CRICKETERS.CRIC_NAME,MAX(NO_OF_RUNS) AS MAX_RUNS
FROM
CRICKETERS ,BATSMAN
WHERE CRICKETERS.CRIC_ID=BATSMAN.CRIC_ID
GROUP BY CRICKETERS.CRIC_NAME,CRICKETERS.CRIC_ID
ORDER BY CRICKETERS.CRIC_NAME DESC ;


SELECT CRICKETERS.CRIC_ID, CRICKETERS.CRIC_NAME,MAX(NO_OF_WICKETS) AS MAX_NO_OF_WICKETS
FROM
CRICKETERS ,BOWLER
WHERE CRICKETERS.CRIC_ID=BOWLER.CRIC_ID
GROUP BY CRICKETERS.CRIC_NAME,CRICKETERS.CRIC_ID
ORDER BY MAX(NO_OF_WICKETS) DESC ;


SELECT CRICKETERS.CRIC_ID, CRICKETERS.CRIC_NAME,MAX(NO_OF_WICKETS) AS MAX_NO_OF_WICKETS
FROM
CRICKETERS ,BOWLER
WHERE CRICKETERS.CRIC_ID=BOWLER.CRIC_ID
GROUP BY CRICKETERS.CRIC_NAME,CRICKETERS.CRIC_ID
ORDER BY CRICKETERS.CRIC_NAME;