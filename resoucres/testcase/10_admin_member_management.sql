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
select count(*) "운동 필요한 사람의 수"
from mem
where  (user_weight < 60.0 and user_height > 165.0)
   or (user_weight > 80.0 and user_height < 180.0);

-- 3) 회원 탈퇴
--   (1) 신고 메시지 조회(다시) -> 맨 오른쪽 컬럼 user_num 확인
select *
from report r
         join msg m
where r.msg_num = m.msg_num;
 select * from mem;
DELETE FROM mem
WHERE user_num = 40;

start transaction ;

select * from mem;
--   (2) 회원탈퇴
# DELETE 구문이라 주석처리 해두었습니다. user 복구를 위해 정보를 저장해두고 시행 바랍니다.
 DELETE FROM mem
 WHERE user_phone = '010-6666-6666';

select * from mem;
rollback;