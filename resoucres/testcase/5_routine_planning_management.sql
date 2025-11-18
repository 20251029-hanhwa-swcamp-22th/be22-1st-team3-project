# 5. 루틴 계획 관리하기
START TRANSACTION;
-- 0) 임의로 계정을 추가해주겠다.
START TRANSACTION;
INSERT INTO mem(user_id, user_pw, user_name, user_nickname, user_email, user_join_date, user_phone, user_height,
                user_weight)
values ('gusgh',
        'gusgh123!',
        '정현호',
        '에슬로',
        'gusgh075@gmail.com',
        now(),
        '010-9355-7976',
        160,
        80);

-- 1) 루틴 계획 추가하기
INSERT INTO routine(rtn_name, rtn_date, user_num)
VALUES ('임시 루틴',
        NOW(),
        (SELECT user_num FROM mem WHERE user_id = 'gusgh'));

SELECT *
FROM routine;

INSERT INTO routinerecord(exc_date, rtn_memo, rtn_is_done, rtn_name, user_num, rtn_num)
VALUES ('2026-02-16',
        '이건 임시 루틴 계획',
        FALSE,
        '임시 루틴',
        (SELECT user_num FROM mem WHERE user_id = 'gusgh'),
        (SELECT rtn_num FROM routine WHERE rtn_name = '임시 루틴'));

-- 2) 루틴 계획 수정하기
UPDATE routinerecord
SET rtn_memo='이건 수정된 루틴 계획'
WHERE exc_date = '2026-02-16'
  AND user_num = (SELECT user_num FROM mem WHERE user_id = 'gusgh');

SELECT *
FROM routinerecord;

-- 3) 루틴 계획 요일 복사하기
INSERT INTO routinerecord(exc_date, rtn_memo, rtn_is_done, rtn_name, user_num, rtn_num)
SELECT DATE_ADD(exc_date, INTERVAL 7 DAY), rtn_memo, rtn_is_done, rtn_name, user_num, rtn_num
FROM routinerecord
WHERE user_num = (SELECT user_num FROM mem WHERE user_id = 'gusgh')
  AND rtn_num = (SELECT rtn_num FROM routine WHERE rtn_name = '임시 루틴');

SELECT *
FROM routinerecord;

-- 4) 루틴 계획 삭제하기
DELETE
FROM routinerecord
WHERE user_num = (SELECT user_num FROM mem WHERE user_id = 'gusgh'LIMIT 1)
  AND rtn_num = (SELECT rtn_num FROM routine WHERE rtn_name = '임시 루틴'LIMIT 1)
ORDER BY exc_date ASC LIMIT 1;

SELECT *
FROM routinerecord;

ROLLBACK;