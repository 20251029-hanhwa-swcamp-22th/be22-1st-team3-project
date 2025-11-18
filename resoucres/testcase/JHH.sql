# 3. 사용자 로그인 -> 운동 가이드
start transaction;
-- 1) 로그인
--      (0) 임의로 계정을 추가해주겠다.
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
--      (1) 로그인
select count(*)
from mem
where user_id = 'gusgh'
  and user_pw = 'gusgh123!';
-- 2) 운동 가이드 조회
INSERT INTO exerciseguide(adm_no, guide_title, guide_video, guide_des, guide_date, ex_num)
VALUES (1,
        '울끈불끈 가슴만들기',
        'https://youtu.be/A2kHURY746E?si=LB3naXfsPXNMcUPz',
        '가슴을 만들려면 운동을 해야한다.',
        NOW(),
        1);
SELECT *
FROM exerciseguide
WHERE guide_title LIKE '%울끈불끈%';

-- 3) 운동 가이드 북마크 - guide_title이 울끈불끈 가슴만들기 AND user_id가 gusgh
INSERT INTO guidebookmark(guide_num, user_num)
VALUES ((SELECT guide_num FROM exerciseguide WHERE guide_title LIKE '%울끈불끈%' LIMIT 1),
        (SELECT user_num FROM mem WHERE user_id = 'gusgh'));
SELECT M.user_id, GB.guide_num
FROM guidebookmark GB
         JOIN mem M ON M.user_num = GB.user_num;
ROLLBACK;


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

# 9. 관리자 로그인 -> 신고 메시지 조회
select *
from adm;

-- 1) 로그인
--   (1) 없는 아이디 로그인시도 -> 실패
select *
from adm
where adm_id = 'hacker'
  and adm_pw = 'pw1';

--   (2) 올바른 아이디, 잘못된 비밀번호 로그인시도 -> 실패
select *
from adm
where adm_id = 'adm1'
  and adm_pw = 'pw5';

--   (3) 올바른 로그인
select *
from adm
where adm_id = 'adm1'
  and adm_pw = 'pw1';

-- 2) 신고 메시지 조회
select *
from report r
         join msg m
where r.msg_num = m.msg_num;


# 10. 관리자 회원 관리
select *
from mem;
-- 1) 회원 조회
--   (1) 전화번호로 조회
select *
from mem
where user_phone = '010-6666-6666';

--   (2) 운동이 필요한 사람들 조회
select *
from mem
where user_weight < 60.0
  and user_height > 165.0;

-- 2) 회원 통계
--   (1) 가입 증가율 계산 (오늘이 1월 19일이라 가정)
SELECT AVG(CASE WHEN user_join_date > '2025-01-18' THEN 100.0 ELSE 0.0 END) AS percentage_new_users
FROM mem;

--   (2) 운동 필요한 사람의 수 계산
select count(*)
from mem
where (user_weight < 60.0 and user_height > 165.0)
   or (user_weight > 80.0 and user_height < 180.0);

-- 3) 회원 탈퇴
--   (1) 신고 메시지 조회(다시) -> 맨 오른쪽 컬럼 user_num 확인
select *
from report r
         join msg m
where r.msg_num = m.msg_num;

--   (2) 회원탈퇴
# DELETE 구문이라 주석처리 해두었습니다. user 복구를 위해 정보를 저장해두고 시행 바랍니다.
# DELETE FROM mem
# WHERE user_num = '1';