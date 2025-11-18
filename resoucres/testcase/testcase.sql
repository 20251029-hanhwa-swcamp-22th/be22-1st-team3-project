# 1. 사용자 회원가입
-- 1) 회원가입
INSERT INTO Mem (user_id, user_pw, user_name, user_nickname, user_email, user_join_date ,user_phone, user_height, user_weight)
VALUES('userA',
       'pw1',
       '사용자',
       'userA',
       'userA@email.com',
       NOW(),
       '010-1111-1111',
       170.5,
       65.2);

-- 2) 회원가입 조회(회원정보 조회, 로그인 성공)
SELECT * FROM mem WHERE user_id = 'userA' AND user_pw = 'pw1';

-- 3) 마이페이지로 이동하여 닉네임을 '운동초보A'로 변경
UPDATE Mem
SET user_nickname ='운동초보A'
where user_num = 34;

-- 4)회원탈퇴(회원 탈퇴 진행)
--      (0) 회원 탈퇴
DELETE FROM Mem WHERE user_num = 36 ;
--      (1) 회원 탈퇴 확인
SELECT * FROM mem;

#2 관리자 운동 가이드 생성
-- 관리자 계정으로 관리자 페이지에 로그인
-- 1)관리자 회원가입
INSERT INTO Adm (adm_id, adm_pw, adm_name)
VALUES ('admin1',
        'pw1',
        '관리자1');

-- 2) 관리자 확인
SELECT * FROM adm;

-- 3)콘텐츠 관리 초보자용 운동 가이드 등록
INSERT INTO ExerciseGuide (adm_no, guide_title, guide_video, guide_image, guide_des, guide_date, ex_num)
VALUES(1,
       '벤치프레스 가이드',
       'https://youtube.com/bench',
       'https://img.com/bench.png',
       '벤치프레스 자세',
       NOW(),
       1);


-- 4)운동 가이드 목록에 ' 초보자용 스쿼트가 정상적으로 추가되었는지 확인합니다.
SELECT * FROM ExerciseGuide;

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

# 6. 식단 관리
    # (1) 아침 식단 생성
INSERT INTO Diet (diet_date, diet_type, diet_memo, diet_user_num)
VALUES (NOW(), '조식', NULL, 6);

SET @breakfast_diet_num = LAST_INSERT_ID();

    # 아침 식단 생성 확인
SELECT * FROM Diet WHERE diet_num = @breakfast_diet_num;

    # (2) 아침 식단에 넣을 음식 검색
SET @salad_food_num = (
    SELECT food_num
    FROM Food
    WHERE food_name = '닭가슴살'
    LIMIT 1
);

        #아침 식단 넣을 음식 검색 확인
SELECT @salad_food_num AS '닭가슴살 food_num';


        # (3) 아침 식단에 추가
INSERT INTO DietItem (item_amount, diet_num, food_num)
VALUES (150, @breakfast_diet_num, @salad_food_num);

        # 아침 식단 항목 조회
SELECT * FROM DietItem WHERE diet_num = @breakfast_diet_num;


        # (4) '점심' 식단 생성
INSERT INTO Diet (diet_date, diet_type, diet_memo, diet_user_num)
VALUES (NOW(), '중식', NULL, 6);
SET @lunch_diet_num = LAST_INSERT_ID();

        # 점심 식단 생성 확인
SELECT * FROM Diet WHERE diet_num = @lunch_diet_num;

        # 2. 새로운 음식 등록
INSERT INTO Food (food_name, food_kcal, food_protein, food_cerb, food_fat, food_weight)
VALUES ('특제 프로틴 쉐이크', 300, 30, 15, 5, '300g');

SET @protein_food_num = LAST_INSERT_ID();

        #   등록된 커스텀 음식 조회
SELECT * FROM Food WHERE food_num = @protein_food_num;


        # (1) 점심 식단에 특제 프로틴 쉐이크 추가
INSERT INTO DietItem (item_amount, diet_num, food_num)
VALUES (300, @lunch_diet_num, @protein_food_num);


        # 점심 식단 아이템 조회
SELECT * FROM DietItem WHERE diet_num = @lunch_diet_num;


        # 3. 아침 식단 수정

SET @breakfast_item_num = (
    SELECT item_num
    FROM DietItem
    WHERE diet_num = @breakfast_diet_num
    LIMIT 1
);

UPDATE DietItem
SET item_amount = 180
WHERE item_num = @breakfast_item_num;


        # 아침 식단 수정된 아이템 조회
SELECT * FROM DietItem WHERE item_num = @breakfast_item_num;

        # 4. 저녁 식단 생성 → 삭제
INSERT INTO Diet (diet_date, diet_type, diet_memo, diet_user_num)
VALUES (NOW(), '석식', NULL, 6);

SET @dinner_diet_num = LAST_INSERT_ID();

        # 저녁 식단 생성 조회
SELECT * FROM Diet WHERE diet_num = @dinner_diet_num;
DELETE FROM DietItem
WHERE diet_num = @dinner_diet_num;

        # 저녁 식단 상세가 없는지 확인
SELECT * FROM DietItem WHERE diet_num = @dinner_diet_num;

        # 자체 삭제
DELETE FROM Diet
WHERE diet_num = @dinner_diet_num;

    # 5. 전체 결과 조회
SELECT
    D.diet_num,
    D.diet_type,
    F.food_name,
    DI.item_amount
FROM Diet D
LEFT JOIN DietItem DI ON D.diet_num = DI.diet_num
LEFT JOIN Food F ON DI.food_num = F.food_num
WHERE D.diet_user_num = 6
ORDER BY D.diet_num;

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


#  8. 그룹 채팅

    -- 테스트용 사용자 변수
SET @userA = 6;   -- 사용자 A
SET @userB = 7;   -- 사용자 B

#   (1) 채팅방 생성
INSERT INTO Gct (room_master, room_name, room_open_date)
VALUES (@userA, '무릎 통증 환우회', NOW());

SET @room_num = LAST_INSERT_ID();



#   (2) 채팅방 참여자 등록 (A: 방장)
INSERT INTO GctPtc (room_num, user_num)
VALUES (@room_num, @userA);


#   (3) 사용자 B 초대
INSERT INTO GctPtc (room_num, user_num)
VALUES (@room_num, @userB);



#   (4) 사용자 A 메시지 전송
INSERT INTO Msg (msg_content, msg_time, room_num, user_num)
VALUES ('오늘 스쿼트했더니 무릎이 아프네요', NOW(), @room_num, @userA);

SET @msg_num = LAST_INSERT_ID();



#   (5) 신고 (A가 B가 보낸 메시지를 신고했다고 가정)

INSERT INTO Report (rpt_time, rpt_reason, msg_num, good_num)
VALUES (NOW(), '부적절한 메시지 전송', @msg_num, @userA);



#   (6) 사용자 A 채팅방 나가기

DELETE FROM GctPtc
WHERE room_num = @room_num
  AND user_num = @userA;

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