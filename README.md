# be22-1st-team3-project

- 프로젝트 간단 소개
> **운동인들을 위한 통합 관리 시스템.**
> ![IIM_logo.jpg](media/document/IIM_logo.jpg)
---

- 팀 소개
> - 조민규 
> - 정현호
> - 김선일
> - 최현지

---

- 프로젝트 개요(주제 소개, 선정 이유(배경/필요성))
> - IIM(Insert Into Muscle)은 개인 맞춤형 운동, 식단, 통증 관리를 통합한 웹앱 플랫폼입니다.
> - 사용자는 자신의 건강 상태와 운동 데이터를 기반으로 AI 맞춤 루틴과 식단을 추천받고, 진행 상황을 시각화할 수 있습니다.
> - 기존 앱들이 한 가지 기능에 집중한 반면, IIM은 운동, 식단, 부상 관리, 데이터 시각화, 커뮤니티까지 한 번에 제공합니다.
> - 통합 관리와 맞춤형 솔루션을 통해 사용자의 운동 효과를 극대화하고 부상 위험을 최소화합니다.
> - 이를 통해 개인 맞춤형 건강 관리 생태계를 구축하고 지속적인 운동 습관 형성을 지원합니다.
---

- 유사 서비스 + 차이점 or 개선점
> ![diffrence about other app.png](media/document/diffrence%20about%20other%20app.png)
>1. Fitbod
>- AI 기반으로 근력 운동 중심 맞춤 루틴 제공
>- 일부 운동 기록 시각화 가능, 식단 관리 제한적
>2. Freeletics
>- AI 코치 기반 전신/체중 운동 맞춤 제공
>- 코치/유저 중심 커뮤니티 제공, 식단 가이드 제한적
>3. IIM (this project)
>- 통증 설문 기반 맞춤 루틴과 영양소·영양제 관리까지 한 번에 제공
>- 달성률 색상 시각화, 운동량·진단 변화 차트로 직관적 관리 가능
>- 그룹 채팅, 루틴 공유, AI 챗봇 등으로 사용자 경험과 참여도 극대화


---

- 서비스 대상
> 서비스 대상은 체계적인 운동·식단 관리와 통증 관리를 원하는 초보~중급 운동 사용자와, 건강 기록을 한 앱에서 통합 관리하려는 모든 사람입니다.

---

- 주요 기능

| 구분                        | 주요 기능                                                        |
|-----------------------------|----------------------------------------------------------------|
| **회원 관리**                | 회원가입/로그인, 프로필 수정, 관리자 통계 관리                  |
| **운동 루틴 & 가이드**       | 맞춤 루틴 추천, 운동 기록, 루틴 관리, 운동 영상/북마크          |
| **통증·진단**               | 통증 설문, 진단 결과 제공, 변화 히스토리 확인                   |
| **데이터 시각화 & 캘린더**   | 달성률·운동량 차트, 기간별/운동별 필터, 루틴 일정 관리         |
| **커뮤니티 & 식단**          | 채팅·루틴 공유, 비속어 필터, 식단 기록·추천·영양제 안내       |

---

- 개발 환경 및 기술 스택
> ![Development Environment.png](media/document/Development%20Environment.png)

---

- WBS
> ![WBS.png](media/document/WBS.png)

---

- Usecase Diagram
> ![usecase](media/assets/team3_usecase.png)

---

- 요구 사항 명세서
> [스프레드시트링크](https://docs.google.com/spreadsheets/d/12OZN1IK60Vbln3Dilq4HbBGqqMuhrMATIU-cgW7zIg8/edit?usp=sharing)
  ![Requirement Specification-1.png](media/document/Requirement%20Specification-1.png)
  ![Requirement Specification-2.png](media/document/Requirement%20Specification-2.png)
---

- ERD
> ![ERD](media/assets/team3_erd_final.png)

---

- 테이블 정의서
> [테이블정의서링크](https://docs.google.com/spreadsheets/d/e/2PACX-1vSUihJ3aSfDu0rVzV-4FhAjKm-BtCdu7y4hJH0xDAdmlthM-6afHdqh1hZB_P44VHvBKn4FqTCBoGjV/pubhtml)
> ![Table Definition-2.png](media/document/Table%20Definition-2.png)
  ![Table Definition-1.png](media/document/Table%20Definition-1.png)
---

- 백업 계획
>   ![0replica_desc.png](media/backupSequence/0replica_desc.png)
>  - DB를 복제하여 2대 이상의 DBMS를 master와 slave 구조로 비동기 방식으로 데이터를 저장할 계획
    
> - 비동기 방식 : Main 흐름을 막지 않는다
    
> - 사용 프로그램
>     1. VirtualBox
>     2. Ubuntu OS
>     3. MariaDB

>- backup  연결 확인
>1. master ubuntu에서 master계정 접속
 ![1login_master.png](media/backupSequence/1login_master.png)
>  - slave ubuntu에서 slave계정 접속
  ![1login_slave.png](media/backupSequence/1login_slave.png)
>2. check current user
  ![2check_cur_user.png](media/backupSequence/2check_cur_user.png)
>3. show status
  ![3show_master_status.png](media/backupSequence/3show_master_status.png)
  ![3show_slave_hosts.png](media/backupSequence/3show_slave_hosts.png)
>4. show master-slave connection
  ![4show_slave_status_1.png](media/backupSequence/4show_slave_status_1.png)
  ![4show_slave_status_2.png](media/backupSequence/4show_slave_status_2.png)
>5. master에 테이블 생성
  ![5master_DDL_insert.gif](media/backupSequence/5master_DDL_insert.gif)
>6. slave에도 테이블이 생성된 것을 확인 + test할 Mem테이블이 Empty인 것을 확인
  ![8slave_check_tables.gif](media/backupSequence/8slave_check_tables.gif)
  ![6check_empty_table.png](media/backupSequence/6check_empty_table.png)
>7. 아래 insert 구문을 master에 넣어보자
  ![9insert_sample_user.png](media/backupSequence/9insert_sample_user.png)
  ![9test_replica_insert.gif](media/backupSequence/9test_replica_insert.gif)


---

- 테스트케이스
    - 시나리오별 SQL 및 실행 결과
> 작업 필요

---

- 프로젝트 회고
> 조민규 :
> 정현호 :
> 김선일 :
> 최현지 : 
