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
