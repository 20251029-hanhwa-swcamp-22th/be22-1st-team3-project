#  7. 통증 설문
--    (1) 설문지 조회
SELECT * FROM Svy;

--     (2) 설문 문항 조회
SELECT * FROM SvyQst WHERE survey_code = 1;

--      (3) 설문 옵션 조회
SELECT * FROM SvyQstOpt WHERE question_num IN (
    SELECT question_num FROM SvyQst WHERE survey_code = 1
);

--      (4) 설문 제출
INSERT INTO SvyRecord (create_date, result, user_num, survey_code)
VALUES (NOW(), '진단 결과 생성 전', 6, 1);

SELECT LAST_INSERT_ID() AS survey_num;

--      (5) 설문 상세
INSERT INTO SvyDtlRec (survey_num, option_num, question_num)
VALUES
    (LAST_INSERT_ID(), 3, 1),
    (LAST_INSERT_ID(), 12, 2),
    (LAST_INSERT_ID(), 22, 3);

--       (6) 설문 결과 업데이트
UPDATE SvyRecord
SET result = '무릎 통증이 있으며 운동 후 통증 증가. 휴식 권장.'
WHERE survey_num = LAST_INSERT_ID();

--       (7) 설문 결과 조회
SELECT survey_num, create_date, result
FROM SvyRecord
WHERE user_num = 6
ORDER BY survey_num DESC
LIMIT 1;

