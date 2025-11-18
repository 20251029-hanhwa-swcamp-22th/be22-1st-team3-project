DROP TABLE IF EXISTS `Gct`;

CREATE TABLE `Gct` (
    `room_num` INT NOT NULL COMMENT '채팅방번호(Auto_Increment)',
    `room_master` INT NOT NULL COMMENT '채팅방을 생성한 사람',
    `room_name` VARCHAR(200) NOT NULL COMMENT '채팅방을 식별할수 있는 이름',
    `room_open_date` DATETIME NOT NULL COMMENT '채팅방을 생성한 날짜'
);

DROP TABLE IF EXISTS `Adm`;

CREATE TABLE `Adm` (
    `adm_no` INT NULL COMMENT '관리자번호사용자번호(Auto_increment)',
    `adm_id` VARCHAR(20) NULL COMMENT '중복이 되지 않는 아이디',
    `adm_pw` VARCHAR(20) NULL COMMENT '비밀번호 암호화',
    `adm_name` VARCHAR(20) NULL COMMENT '관리자의 이름'
);

DROP TABLE IF EXISTS `SvyQstOpt`;

CREATE TABLE `SvyQstOpt` (
    `option_num` INT NOT NULL COMMENT '보기문항 고유번호',
    `question_num` INT NOT NULL COMMENT '설문문항 고유번호',
    `option_desc` VARCHAR(500) NOT NULL COMMENT '보기 내용'
);

DROP TABLE IF EXISTS `RoutineRecord`;

CREATE TABLE `RoutineRecord` (
    `rtn_rec_num` INT NOT NULL COMMENT '루틴 기록 코드(Auto_increment)',
    `exc_date` DATETIME NOT NULL COMMENT '수행계획일자',
    `rtn_memo` VARCHAR(500) NULL COMMENT '루틴 수행 후기 메모',
    `rtn_is_done` BOOLEAN NOT NULL COMMENT '루틴완료여부',
    `rtn_name` VARCHAR(200) NOT NULL COMMENT '루틴의 이름',
    `user_num` INT NOT NULL COMMENT '사용자번호(Auto_increment)',
    `rtn_num` INT NOT NULL COMMENT '루틴번호(Auto_increment)'
);

DROP TABLE IF EXISTS `GctPtc`;

CREATE TABLE `GctPtc` (
    `room_num` INT NOT NULL COMMENT '채팅방번호(Auto_Increment)',
    `user_num` INT NOT NULL COMMENT '사용자번호(Auto_increment)'
);

DROP TABLE IF EXISTS `ExerciseGuide`;

CREATE TABLE `ExerciseGuide` (
    `guide_num` INT NULL COMMENT '운동가이드번호(사용자번호(Auto_increment)',
    `adm_no` INT NOT NULL COMMENT '관리자번호(Auto_increment)',
    `guide_title` VARCHAR(200) NULL COMMENT '운동 가이드의 제목',
    `guide_video` VARCHAR(500) NULL COMMENT '운동 가이드를 영상을 볼수있는 URL',
    `guide_image` VARCHAR(500) NULL COMMENT '운동 가이드 사진을 볼수있는  URL',
    `guide_des` VARCHAR(500) NULL COMMENT '운동 가이드의 설명 글',
    `guide_date` DATETIME NULL COMMENT '운동 가이드 등록 날짜',
    `ex_num` INT NOT NULL COMMENT '운동번호(Auto_increment)'
);

DROP TABLE IF EXISTS `GuideBookmark`;

CREATE TABLE `GuideBookmark` (
    `guide_num` INT NOT NULL COMMENT '운동가이드번호(사용자번호(Auto_increment)',
    `user_num` INT NOT NULL COMMENT '사용자번호(Auto_increment)'
);

DROP TABLE IF EXISTS `Diet`;

CREATE TABLE `Diet` (
    `diet_num` INT NOT NULL COMMENT '식단번호(Auto_increment)',
    `diet_date` DATETIME NOT NULL COMMENT '식단 섭취 날짜',
    `diet_type` VARCHAR(50) NOT NULL COMMENT '조식,중식,석식 중 선택',
    `diet_memo` VARCHAR(500) NULL COMMENT '음식에 대한 메모',
    `diet_user_num` INT NOT NULL COMMENT '사용자번호(Auto_increment)'
);

DROP TABLE IF EXISTS `Routine`;

CREATE TABLE `Routine` (
    `rtn_num` INT NOT NULL COMMENT '루틴번호(Auto_increment)',
    `rtn_name` VARCHAR(200) NOT NULL COMMENT '루틴의 이름',
    `rtn_date` DATETIME NOT NULL COMMENT '루틴 생성날짜',
    `user_num` INT NOT NULL COMMENT '사용자번호(Auto_increment)'
);

DROP TABLE IF EXISTS `SvyDtlRec`;

CREATE TABLE `SvyDtlRec` (
    `detail_id` INT NOT NULL COMMENT '응답기록(Auto_increment)]',
    `survey_num` INT NOT NULL COMMENT '설문기록번호(Auto_increment)',
    `option_num` INT NOT NULL COMMENT '보기문항에 대한 번호',
    `question_num` INT NOT NULL COMMENT '설문문항에 대한 번호'
);

DROP TABLE IF EXISTS `Report`;

CREATE TABLE `Report` (
    `rpt_num` INT NOT NULL COMMENT '신고번호사용자번호(Auto_increment)',
    `rpt_time` DATETIME NOT NULL COMMENT '사용자를 신고한 시간',
    `rpt_reason` VARCHAR(1500) NOT NULL COMMENT '사용자를 신고하는 이유',
    `msg_num` INT NOT NULL COMMENT '메시지번호(Auto_increment)',
    `good_num` INT NOT NULL COMMENT '신고자 번호'
);

DROP TABLE IF EXISTS `Exercise`;

CREATE TABLE `Exercise` (
    `ex_num` INT NOT NULL COMMENT '운동번호(Auto_increment)',
    `ex_name` VARCHAR(200) NOT NULL COMMENT '운동 이름',
    `ex_part` VARCHAR(200) NOT NULL COMMENT '운동의 부위 ex)등,어꺠,가슴',
    `ex_description` VARCHAR(500) NULL COMMENT '운동의 방법을 설명'
);

DROP TABLE IF EXISTS `Mem`;

CREATE TABLE `Mem` (
    `user_num` INT NOT NULL COMMENT '사용자번호(Auto_increment)',
    `user_id` VARCHAR(15) NOT NULL UNIQUE COMMENT '중복되지 않는아이디',
    `user_pw` VARCHAR(200) NOT NULL COMMENT '비밀번호 암호화',
    `user_name` VARCHAR(30) NOT NULL COMMENT '성+이름이 들어가야된다',
    `user_nickname` VARCHAR(30) NOT NULL COMMENT '중복이 되지 않은 닉네임',
    `user_email` VARCHAR(30) NOT NULL COMMENT '이메일주소까지 입력',
    `user_join_date` DATETIME NOT NULL DEFAULT CURRENT_DATE COMMENT 'yyyy/mm/dd로 회원 가입일 입력',
    `user_phone` CHAR(13) NULL COMMENT '010-1234-5678 으로 입력',
    `user_height` DECIMAL(4,1) NULL COMMENT '단위까지 입력 ex)180cm',
    `user_weight` DECIMAL(4,1) NULL COMMENT '단위까지 입력 ex)79kg'
);

DROP TABLE IF EXISTS `RoutineDetail`;

CREATE TABLE `RoutineDetail` (
    `rtd_num` INT NOT NULL COMMENT '상세루틴번호(Auto_increment)',
    `rtd_set` INT NOT NULL COMMENT '운동의 세트회수',
    `rtd_reps` INT NOT NULL COMMENT '운동 회수',
    `rtd_weight` INT NOT NULL COMMENT '중량',
    `rtn_num` INT NOT NULL COMMENT '루틴번호(Auto_increment)',
    `ex_num` INT NOT NULL COMMENT '운동번호(Auto_increment)'
);

DROP TABLE IF EXISTS `DiffDesc`;

CREATE TABLE `DiffDesc` (
    `diff_num` INT NOT NULL COMMENT '상태변화 번호(Auto_increment)',
    `diff_desc` VARCHAR(2000) NOT NULL COMMENT '상태 변화가 어떻게 이루어졌는지',
    `past_snum` INT NOT NULL COMMENT '과거설문기록번호',
    `cur_snum` INT NOT NULL COMMENT '현재설문기록번호'
);

DROP TABLE IF EXISTS `ExerciseRecord`;

CREATE TABLE `ExerciseRecord` (
    `ex_rec_num` INT NOT NULL COMMENT '운동기록코드(Auto_increment)',
    `rtd_num` INT NOT NULL COMMENT '상세루틴번호(Auto_increment)',
    `ex_reps` INT NOT NULL COMMENT '운동 횟수',
    `ex_set` INT NOT NULL COMMENT '운동 세트',
    `ex_weight` INT NOT NULL COMMENT '중량',
    `is_done` BOOLEAN NOT NULL COMMENT '운동완료여부',
    `rtn_rec_code` INT NOT NULL COMMENT '루틴 기록 코드(Auto_increment)'
);

DROP TABLE IF EXISTS `Msg`;

CREATE TABLE `Msg` (
    `msg_num` INT NULL COMMENT '메시지번호(Auto_Increment)',
    `msg_content` VARCHAR(500) NOT NULL COMMENT '메시지 내용',
    `msg_time` DATETIME NOT NULL COMMENT '메시지를 보낸 시간',
    `room_num` INT NOT NULL COMMENT '채팅방번호(Auto_Increment)',
    `user_num` INT NOT NULL COMMENT '사용자번호(Auto_increment)'
);

DROP TABLE IF EXISTS `SvyRecord`;

CREATE TABLE `SvyRecord` (
    `survey_num` INT NOT NULL COMMENT '설문기록번호(Auto_increment)',
    `create_date` DATETIME NOT NULL COMMENT '설문한 날짜',
    `result` VARCHAR(2000) NOT NULL COMMENT '설문 진단 결과',
    `user_num` INT NOT NULL COMMENT '사용자번호(Auto_increment)',
    `survey_code` INT NOT NULL COMMENT '설문지 코드(Auto_increment)'
);

DROP TABLE IF EXISTS `SvyQst`;

CREATE TABLE `SvyQst` (
    `question_num` INT NOT NULL COMMENT '설문문항고유번호(Auto_increment)',
    `question_type` VARCHAR(200) NOT NULL COMMENT '질문의 종류',
    `contents` VARCHAR(200) NOT NULL COMMENT '설문문항 내용',
    `survey_code` INT NOT NULL COMMENT '설문지 코드(Auto_increment)'
);

DROP TABLE IF EXISTS `DietItem`;

CREATE TABLE `DietItem` (
    `item_num` INT NOT NULL COMMENT '식단상세번호(Auto_Increment)',
    `item_amount` INT NOT NULL COMMENT '섭취의 양',
    `diet_num` INT NOT NULL COMMENT '식단번호(Auto_increment)',
    `food_num` INT NOT NULL COMMENT '음식번호(Auto_increment)'
);

DROP TABLE IF EXISTS `Svy`;

CREATE TABLE `Svy` (
    `survey_code` INT NOT NULL COMMENT '설문지 코드(Auto_increment)',
    `name` VARCHAR(200) NOT NULL COMMENT '설문지 이름'
);

DROP TABLE IF EXISTS `Food`;

CREATE TABLE `Food` (
    `food_num` INT NOT NULL COMMENT '음식번호(Auto_increment)',
    `food_name` VARCHAR(100) NOT NULL COMMENT '어떤 음식인지 알수잇는 이름',
    `food_kcal` INT NOT NULL COMMENT '음식의 칼로리',
    `food_protein` INT NOT NULL COMMENT '음식의 단백질 함유량',
    `food_cerb` INT NOT NULL COMMENT '음식의 탄수화물 함유량',
    `food_fat` INT NOT NULL COMMENT '음식의 지방 함유량',
    `food_weight` VARCHAR(50) NOT NULL COMMENT '무게별 영양소(100g당 영양소)'
);

ALTER TABLE `Gct` ADD CONSTRAINT `PK_GCT` PRIMARY KEY (
    `room_num`
);

ALTER TABLE `Adm` ADD CONSTRAINT `PK_ADM` PRIMARY KEY (
    `adm_no`
);

ALTER TABLE `SvyQstOpt` ADD CONSTRAINT `PK_SVYQSTOPT` PRIMARY KEY (
    `option_num`,
    `question_num`
);

ALTER TABLE `RoutineRecord` ADD CONSTRAINT `PK_ROUTINERECORD` PRIMARY KEY (
    `rtn_rec_num`
);

ALTER TABLE `GctPtc` ADD CONSTRAINT `PK_GCTPTC` PRIMARY KEY (
    `room_num`,
    `user_num`
);

ALTER TABLE `ExerciseGuide` ADD CONSTRAINT `PK_EXERCISEGUIDE` PRIMARY KEY (
    `guide_num`
);

ALTER TABLE `GuideBookmark` ADD CONSTRAINT `PK_GUIDEBOOKMARK` PRIMARY KEY (
    `guide_num`,
    `user_num`
);

ALTER TABLE `Diet` ADD CONSTRAINT `PK_DIET` PRIMARY KEY (
    `diet_num`
);

ALTER TABLE `Routine` ADD CONSTRAINT `PK_ROUTINE` PRIMARY KEY (
    `rtn_num`
);

ALTER TABLE `SvyDtlRec` ADD CONSTRAINT `PK_SVYDTLREC` PRIMARY KEY (
    `detail_id`
);

ALTER TABLE `Report` ADD CONSTRAINT `PK_REPORT` PRIMARY KEY (
    `rpt_num`
);

ALTER TABLE `Exercise` ADD CONSTRAINT `PK_EXERCISE` PRIMARY KEY (
    `ex_num`
);

ALTER TABLE `Mem` ADD CONSTRAINT `PK_MEM` PRIMARY KEY (
    `user_num`
);

ALTER TABLE `RoutineDetail` ADD CONSTRAINT `PK_ROUTINEDETAIL` PRIMARY KEY (
    `rtd_num`
);

ALTER TABLE `DiffDesc` ADD CONSTRAINT `PK_DIFFDESC` PRIMARY KEY (
    `diff_num`
);

ALTER TABLE `ExerciseRecord` ADD CONSTRAINT `PK_EXERCISERECORD` PRIMARY KEY (
    `ex_rec_num`
);

ALTER TABLE `Msg` ADD CONSTRAINT `PK_MSG` PRIMARY KEY (
    `msg_num`
);

ALTER TABLE `SvyRecord` ADD CONSTRAINT `PK_SVYRECORD` PRIMARY KEY (
    `survey_num`
);

ALTER TABLE `SvyQst` ADD CONSTRAINT `PK_SVYQST` PRIMARY KEY (
    `question_num`
);

ALTER TABLE `DietItem` ADD CONSTRAINT `PK_DIETITEM` PRIMARY KEY (
    `item_num`
);

ALTER TABLE `Svy` ADD CONSTRAINT `PK_SVY` PRIMARY KEY (
    `survey_code`
);

ALTER TABLE `Food` ADD CONSTRAINT `PK_FOOD` PRIMARY KEY (
    `food_num`
);

ALTER TABLE `Gct` ADD CONSTRAINT `FK_Mem_TO_Gct_1` FOREIGN KEY (
    `room_master`
)
REFERENCES `Mem` (
    `user_num`
);

ALTER TABLE `SvyQstOpt` ADD CONSTRAINT `FK_SvyQst_TO_SvyQstOpt_1` FOREIGN KEY (
    `question_num`
)
REFERENCES `SvyQst` (
    `question_num`
);

ALTER TABLE `RoutineRecord` ADD CONSTRAINT `FK_Mem_TO_RoutineRecord_1` FOREIGN KEY (
    `user_num`
)
REFERENCES `Mem` (
    `user_num`
);

ALTER TABLE `RoutineRecord` ADD CONSTRAINT `FK_Routine_TO_RoutineRecord_1` FOREIGN KEY (
    `rtn_num`
)
REFERENCES `Routine` (
    `rtn_num`
);

ALTER TABLE `GctPtc` ADD CONSTRAINT `FK_Gct_TO_GctPtc_1` FOREIGN KEY (
    `room_num`
)
REFERENCES `Gct` (
    `room_num`
);

ALTER TABLE `GctPtc` ADD CONSTRAINT `FK_Mem_TO_GctPtc_1` FOREIGN KEY (
    `user_num`
)
REFERENCES `Mem` (
    `user_num`
);

ALTER TABLE `ExerciseGuide` ADD CONSTRAINT `FK_Adm_TO_ExerciseGuide_1` FOREIGN KEY (
    `adm_no`
)
REFERENCES `Adm` (
    `adm_no`
);

ALTER TABLE `ExerciseGuide` ADD CONSTRAINT `FK_Exercise_TO_ExerciseGuide_1` FOREIGN KEY (
    `ex_num`
)
REFERENCES `Exercise` (
    `ex_num`
);

ALTER TABLE `GuideBookmark` ADD CONSTRAINT `FK_ExerciseGuide_TO_GuideBookmark_1` FOREIGN KEY (
    `guide_num`
)
REFERENCES `ExerciseGuide` (
    `guide_num`
);

ALTER TABLE `GuideBookmark` ADD CONSTRAINT `FK_Mem_TO_GuideBookmark_1` FOREIGN KEY (
    `user_num`
)
REFERENCES `Mem` (
    `user_num`
);

ALTER TABLE `Diet` ADD CONSTRAINT `FK_Mem_TO_Diet_1` FOREIGN KEY (
    `diet_user_num`
)
REFERENCES `Mem` (
    `user_num`
);

ALTER TABLE `Routine` ADD CONSTRAINT `FK_Mem_TO_Routine_1` FOREIGN KEY (
    `user_num`
)
REFERENCES `Mem` (
    `user_num`
);

ALTER TABLE `SvyDtlRec` ADD CONSTRAINT `FK_SvyRecord_TO_SvyDtlRec_1` FOREIGN KEY (
    `survey_num`
)
REFERENCES `SvyRecord` (
    `survey_num`
);

ALTER TABLE `SvyDtlRec` ADD CONSTRAINT `FK_SvyQstOpt_TO_SvyDtlRec_1` FOREIGN KEY (
    `option_num`
)
REFERENCES `SvyQstOpt` (
    `option_num`
);

ALTER TABLE `SvyDtlRec` ADD CONSTRAINT `FK_SvyQstOpt_TO_SvyDtlRec_2` FOREIGN KEY (
    `question_num`
)
REFERENCES `SvyQstOpt` (
    `question_num`
);

ALTER TABLE `Report` ADD CONSTRAINT `FK_Msg_TO_Report_1` FOREIGN KEY (
    `msg_num`
)
REFERENCES `Msg` (
    `msg_num`
);

ALTER TABLE `Report` ADD CONSTRAINT `FK_Mem_TO_Report_1` FOREIGN KEY (
    `good_num`
)
REFERENCES `Mem` (
    `user_num`
);

ALTER TABLE `RoutineDetail` ADD CONSTRAINT `FK_Routine_TO_RoutineDetail_1` FOREIGN KEY (
    `rtn_num`
)
REFERENCES `Routine` (
    `rtn_num`
);

ALTER TABLE `RoutineDetail` ADD CONSTRAINT `FK_Exercise_TO_RoutineDetail_1` FOREIGN KEY (
    `ex_num`
)
REFERENCES `Exercise` (
    `ex_num`
);

ALTER TABLE `DiffDesc` ADD CONSTRAINT `FK_SvyRecord_TO_DiffDesc_1` FOREIGN KEY (
    `past_snum`
)
REFERENCES `SvyRecord` (
    `survey_num`
);

ALTER TABLE `DiffDesc` ADD CONSTRAINT `FK_SvyRecord_TO_DiffDesc_2` FOREIGN KEY (
    `cur_snum`
)
REFERENCES `SvyRecord` (
    `survey_num`
);

ALTER TABLE `ExerciseRecord` ADD CONSTRAINT `FK_RoutineDetail_TO_ExerciseRecord_1` FOREIGN KEY (
    `rtd_num`
)
REFERENCES `RoutineDetail` (
    `rtd_num`
);

ALTER TABLE `ExerciseRecord` ADD CONSTRAINT `FK_RoutineRecord_TO_ExerciseRecord_1` FOREIGN KEY (
    `rtn_rec_code`
)
REFERENCES `RoutineRecord` (
    `rtn_rec_num`
);

ALTER TABLE `Msg` ADD CONSTRAINT `FK_Gct_TO_Msg_1` FOREIGN KEY (
    `room_num`
)
REFERENCES `Gct` (
    `room_num`
);

ALTER TABLE `Msg` ADD CONSTRAINT `FK_Mem_TO_Msg_1` FOREIGN KEY (
    `user_num`
)
REFERENCES `Mem` (
    `user_num`
);

ALTER TABLE `SvyRecord` ADD CONSTRAINT `FK_Mem_TO_SvyRecord_1` FOREIGN KEY (
    `user_num`
)
REFERENCES `Mem` (
    `user_num`
);

ALTER TABLE `SvyRecord` ADD CONSTRAINT `FK_Svy_TO_SvyRecord_1` FOREIGN KEY (
    `survey_code`
)
REFERENCES `Svy` (
    `survey_code`
);

ALTER TABLE `SvyQst` ADD CONSTRAINT `FK_Svy_TO_SvyQst_1` FOREIGN KEY (
    `survey_code`
)
REFERENCES `Svy` (
    `survey_code`
);

ALTER TABLE `DietItem` ADD CONSTRAINT `FK_Diet_TO_DietItem_1` FOREIGN KEY (
    `diet_num`
)
REFERENCES `Diet` (
    `diet_num`
);

ALTER TABLE `DietItem` ADD CONSTRAINT `FK_Food_TO_DietItem_1` FOREIGN KEY (
    `food_num`
)
REFERENCES `Food` (
    `food_num`
);

ALTER TABLE Mem MODIFY user_num INT NOT NULL AUTO_INCREMENT;
ALTER TABLE DiffDesc MODIFY diff_num INT NOT NULL AUTO_INCREMENT;
ALTER TABLE SvyDtlRec MODIFY detail_id INT NOT NULL AUTO_INCREMENT;
ALTER TABLE Svy MODIFY survey_code INT NOT NULL AUTO_INCREMENT;
ALTER TABLE SvyQst MODIFY question_num INT NOT NULL AUTO_INCREMENT;
ALTER TABLE SvyRecord MODIFY survey_num INT NOT NULL AUTO_INCREMENT;
ALTER TABLE Diet MODIFY diet_num INT NOT NULL AUTO_INCREMENT;
ALTER TABLE DietItem MODIFY item_num INT NOT NULL AUTO_INCREMENT;
ALTER TABLE Food MODIFY food_num INT NOT NULL AUTO_INCREMENT;

ALTER TABLE Gct MODIFY room_num INT NOT NULL AUTO_INCREMENT;
ALTER TABLE Msg MODIFY msg_num INT NOT NULL AUTO_INCREMENT;
ALTER TABLE Report MODIFY rpt_num INT NOT NULL AUTO_INCREMENT;
ALTER TABLE Adm MODIFY adm_no INT NOT NULL AUTO_INCREMENT;

ALTER TABLE ExerciseGuide MODIFY guide_num INT NOT NULL AUTO_INCREMENT;
ALTER TABLE ExerciseRecord MODIFY ex_rec_num INT NOT NULL AUTO_INCREMENT;
ALTER TABLE RoutineRecord MODIFY rtn_rec_num INT NOT NULL AUTO_INCREMENT;
ALTER TABLE Routine MODIFY rtn_num INT NOT NULL AUTO_INCREMENT;
ALTER TABLE Exercise MODIFY ex_num INT NOT NULL AUTO_INCREMENT;
ALTER TABLE RoutineDetail MODIFY rtd_num INT NOT NULL AUTO_INCREMENT;
