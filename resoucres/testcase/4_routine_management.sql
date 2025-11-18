# 4. 루틴 관리하기
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
-- 1) 루틴 만들기

INSERT INTO routine(rtn_name, rtn_date, user_num)
VALUES ('현호의 루틴~',
        NOW(),
        (SELECT user_num FROM mem WHERE user_id = 'gusgh'));
SELECT *
FROM routine
WHERE user_num = (SELECT user_num FROM mem WHERE user_id = 'gusgh');

-- 2) 루틴 수정하기 / 현호의 루틴~ 을 현규의 루틴~으로
UPDATE routine
SET rtn_name='현규의 루틴~'
WHERE user_num = (SELECT user_num FROM mem WHERE user_id = 'gusgh')
  AND rtn_name = '현호의 루틴~';
SELECT *
FROM routine
WHERE user_num = (SELECT user_num FROM mem WHERE user_id = 'gusgh');

-- 3) 루틴에 운동 추가하기
INSERT INTO routinedetail(rtd_set, rtd_reps, rtd_weight, rtn_num, ex_num)
VALUES (5, 6, 40,
        (SELECT rtn_num FROM routine WHERE rtn_name = '현규의 루틴~' LIMIT 1),
        (SELECT ex_num FROM exercise WHERE ex_name = '벤치프레스' LIMIT 1));
SELECT *
FROM routinedetail
WHERE rtn_num = (SELECT rtn_num FROM routine WHERE rtn_name = '현규의 루틴~' LIMIT 1)
  AND ex_num = (SELECT ex_num FROM exercise WHERE ex_name = '벤치프레스' LIMIT 1);

-- 4) 루틴 삭제하기
DELETE
FROM routinedetail
WHERE rtn_num = (SELECT rtn_num FROM routine WHERE rtn_name = '현규의 루틴~');

SELECT R.rtn_name, D.ex_num
FROM routinedetail D
         JOIN routine R ON R.rtn_num = D.rtn_num;

DELETE
FROM ROUTINE
WHERE rtn_name = '현규의 루틴~'
  AND user_num = (SELECT user_num FROM mem WHERE user_id = 'gusgh');

SELECT *
FROM routine
WHERE user_num = (SELECT user_num FROM mem WHERE user_id = 'gusgh');

SELECT *
FROM routine;

ROLLBACK;
