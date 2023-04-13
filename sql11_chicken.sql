-- 치킨 주문 분석:

-- 1. https://github.com/JakeOh/20230228_itwill_java140_lab_java/blob/master/lab-oracle/call_chicken.csv
-- 파일의 내용을 저장할 수 있는 테이블을 생성하는 SQL 문을 작성하세요.

-- 2. SQLDeveloper에서 '데이터 임포트' 기능을 사용해서 CSV 파일의 내용을 테이블에 저장하세요.
-- CSV(comma-separated values) 파일:
-- 행의 데이터들을 쉼표(,)로 구분해서 표 형태의 데이터를 저장한 텍스트 파일.
-- 일반적으로는 구분자로 쉼표(,)를 많이 사용하지만, 쉼표 이외의 다른 구분자를 사용하기도 함
-- 다른 종류의 컴퓨터(OS)들 간에 테이블 형태의 데이터들을 주고받을때 많이 사용하는 파일 형식.

CREATE TABLE chicken (
    stddate date,
    weekday varchar2(1 char),
    loc varchar2(10 char),
    ages varchar2(10 char),
    gender varchar2(1 char),
    callcount number(10)
);

SELECT * FROM chicken;
-- 3. 통화건수의 최솟값, 최댓값을 찾으세요.

SELECT min(callcount),max(callcount)
FROM chicken;

-- 4. 통화건수가 최솟값이거나 최댓값인 레코드(행 전체)를 출력하세요.
SELECT *
FROM chicken
WHERE callcount = (SELECT min(callcount) FROM chicken) OR callcount = (SELECT max(callcount) FROM chicken); 

-- 5. 평균적으로 어떤 요일에서 치킨 주문이 많을까요?
SELECT weekday,round(avg(callcount),2)
FROM chicken
GROUP BY weekday
HAVING avg(callcount) = (SELECT max(avg(callcount)) FROM chicken GROUP BY weekday)
ORDER BY round(avg(callcount),2) desc;




-- 6. 평균적으로 어떤 연령대가 치킨 주문을 많이 할까요?

SELECT ages, round(avg(callcount),2)
FROM chicken
GROUP BY ages
HAVING avg(callcount) = (SELECT max(avg(callcount)) FROM chicken GROUP BY ages)
ORDER BY round(avg(callcount),2) desc;


-- 7. 평균적으로 어느 지역에서 치킨 주문을 많이 할까요?

SELECT loc, round(avg(callcount),2)
FROM chicken
GROUP BY loc
HAVING avg(callcount) = (SELECT max(avg(callcount)) FROM chicken GROUP BY loc)
ORDER BY round(avg(callcount),2) desc;

-- 8. 치킨 주문에 성별 차이가 있을까요?
SELECT gender, round(sum(callcount),2) 
FROM chicken
GROUP BY gender
ORDER BY round(avg(callcount),2) desc;


-- 9. 요일별, 연령대별 통화건수의 평균을 찾으세요.

SELECT weekday, ages, round(avg(callcount),2)
FROM chicken
GROUP BY weekday,ages
ORDER BY round(avg(callcount),2) desc;

-- 10. 구별, 성별 통화건수의 평균을 찾으세요.

SELECT loc, gender, round(avg(callcount),2)
FROM chicken
GROUP BY loc,gender
ORDER BY round(avg(callcount),2) desc;

-- 11. 요일별, 구별, 연령대별 통화건수의 평균을 찾으세요.

SELECT weekday, loc, ages, round(avg(callcount),2)
FROM chicken
GROUP BY weekday, loc, ages
ORDER BY round(avg(callcount),2) desc;

-- 3 ~ 11 문제의 출력은 통화건수 평균의 내림차순 정렬, 소숫점 2자리까지 반올림.

