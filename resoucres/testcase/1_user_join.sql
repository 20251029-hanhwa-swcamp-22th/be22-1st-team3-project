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
where user_num = 37;

-- 4)회원탈퇴(회원 탈퇴 진행)
--      (0) 회원 탈퇴
DELETE FROM Mem WHERE user_num = 37 ;
--      (1) 회원 탈퇴 확인
SELECT * FROM mem WHERE user_num = 37;