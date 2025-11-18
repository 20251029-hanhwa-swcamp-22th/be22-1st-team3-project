# 9. 관리자 로그인 -> 신고 메시지 조회
start transaction ;
select *
from adm;
insert into adm(adm_id, adm_pw, adm_name)
values ('admin', 123,'name');
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

--   (2) 회원탈퇴
# DELETE 구문이라 주석처리 해두었습니다. user 복구를 위해 정보를 저장해두고 시행 바랍니다.
# DELETE FROM mem
# WHERE user_num = '1';