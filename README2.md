
# 백업 계획
>   ![0replica_desc.png](media/backupSequence/0replica_desc.png)
>  - DB를 복제하여 2대 이상의 DBMS를 master와 slave 구조로 비동기 방식으로 데이터를 저장할 계획
    
> - 비동기 방식 : Main 흐름을 막지 않는다
    
> - 사용 프로그램
>     1. VirtualBox
>     2. Ubuntu OS
>     3. MariaDB

## backup check sequence
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