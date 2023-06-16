

CREATE TABLE AUTO_TCMB (
   val_ad VARCHAR2(4),
   val_dey NUMBER(6,2),
   tarih TIMESTAMP 
);

SELECT * FROM AUTO_TCMB;
SET serveroutput ON;


BEGIN
   DBMS_SCHEDULER.CREATE_JOB(
      job_name        => 'python_tcmb',
      job_type        => 'EXECUTABLE',
 --     job_action      => 'C:\ProgramData\Microsoft\Windows\Start_Menu\Programs\Python 3.11\python.exe',
      job_action => 'C:\11111\oracle_database_fayllar\github_oracle\oracle_github\codes\auto.py',

      start_date      => TRUNC(SYSDATE) + INTERVAL '1' DAY,
      repeat_interval => 'FREQ=DAILY',
      enabled         => TRUE
   );
END;




exec DBMS_SCHEDULER.RUN_JOB('python_tcmb');--,'C:\11111\oracle_database_fayllar\github_oracle\oracle_github\codes\auto.py');

EXECUTE  DBMS_SCHEDULER.RUN_JOB('python_tcmb');


SELECT job_name, job_action, enabled
FROM user_scheduler_jobs
WHERE job_name = 'python_tcmb';


SELECT job_name, error#, additional_info
FROM user_scheduler_job_run_details
WHERE job_name = 'python_tcmb'
ORDER BY log_date DESC;
