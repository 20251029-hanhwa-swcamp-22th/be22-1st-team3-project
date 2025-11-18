#2 관리자 운동 가이드 생성
-- 관리자 계정으로 관리자 페이지에 로그인
-- 1)관리자 회원가입
INSERT INTO Adm (adm_id, adm_pw, adm_name)
VALUES ('admin1',
        'pw1',
        '관리자1');

-- 2) 관리자 확인
SELECT * FROM adm WHERE adm_id ='admin1';

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
