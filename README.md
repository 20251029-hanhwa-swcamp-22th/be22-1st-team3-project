# be22-1st-team3-project

- 프로젝트 간단 소개
> 헬스하는 사람들을 위한 관리 서비스를 개발하고 있습니다.
- 팀 소개
> 조민규, 정현호, 김선일, 최현지
- 프로젝트 개요(주제 소개, 선정 이유(배경/필요성))
> 헬스케어
> 오늘날 각광받는 헬스케어
> 웹에서 식단관리, 루틴관리, 채팅을 통합해서 제공하는 플랫폼은 없음.
> 이를 제공해서 헬스하는 사람들에게 편의성을 제공하자.
- 유사 서비스 + 차이점 or 개선점
> 조사 필요
- 서비스 대상
> 헬스하는 사람들
- 주요 기능
> 식단관리, 루틴관리, 부상 자가진단, 사용자 채팅, 챗봇
- 개발 환경 및 기술 스택
> MariaDB, DataGrip, GitHub
- WBS
> ??
- Usecase Diagram (이미지 캡쳐)
> ![usecase](media/assets/team3_usecase.png)
- 요구 사항 명세서 (이미지 또는 전체 공개된 url)
> https://docs.google.com/spreadsheets/d/12OZN1IK60Vbln3Dilq4HbBGqqMuhrMATIU-cgW7zIg8/edit?usp=sharing
- ERD (이미지)
> ![ERD](media/assets/team3_erd_final.png)
- 테이블 정의서(이미지 또는 전체 공개된 url)
> 작업 필요
- 백업 계획
  ![0replica_desc.png](media/backupSequence/0replica_desc.png)
  - DB를 복제하여 2대 이상의 DBMS를 master와 slave 구조로 비동기 방식으로 데이터를 저장할 계획
    - 비동기 방식 : Main 흐름을 막지 않는다
  - 사용 프로그램
    1. VirtualBox
    2. Ubuntu OS
    3. MariaDB
- backup  연결 확인
1. master ubuntu에서 master계정 접속
  ![1login_master.png](media/backupSequence/1login_master.png)
  - slave ubuntu에서 slave계정 접속
  ![1login_slave.png](media/backupSequence/1login_slave.png)
2. check current user
  ![2check_cur_user.png](media/backupSequence/2check_cur_user.png)
3. show status
  ![3show_master_status.png](media/backupSequence/3show_master_status.png)
  ![3show_slave_hosts.png](media/backupSequence/3show_slave_hosts.png)
4. show master-slave connection
  ![4show_slave_status_1.png](media/backupSequence/4show_slave_status_1.png)
  ![4show_slave_status_2.png](media/backupSequence/4show_slave_status_2.png)
5. master에 테이블 생성
  ![5master_DDL_insert.gif](media/backupSequence/5master_DDL_insert.gif)
6. slave에도 테이블이 생성된 것을 확인 + test할 Mem테이블이 Empty인 것을 확인
  ![8slave_check_tables.gif](media/backupSequence/8slave_check_tables.gif)
  ![6check_empty_table.png](media/backupSequence/6check_empty_table.png)
7. 아래 insert 구문을 master에 넣어보자
  ![9insert_sample_user.png](media/backupSequence/9insert_sample_user.png)
  ![9test_replica_insert.gif](media/backupSequence/9test_replica_insert.gif)
- Binary Log


- 테스트케이스
    - 시나리오별 SQL 및 실행 결과
> 작업 필요
- 프로젝트 회고
> 조민규 :
> 정현호 :
> 김선일 :
> 최현지 : 
