
BEGIN
  DBMS_SCHEDULER.CREATE_JOB(
    job_name        => 'UPDATE_DEPOZIT_MONTHLY_JOB',
    job_type        => 'PLSQL_BLOCK',
    job_action      => 'BEGIN update_depozit_monthly; END;',
    start_date      => SYSTIMESTAMP,
    repeat_interval => 'FREQ=MONTHLY;INTERVAL=1',
    enabled         => TRUE
  );

  COMMIT;
  DBMS_OUTPUT.PUT_LINE('gecikme_update_olundu');
END;
/






BEGIN
  DBMS_SCHEDULER.CREATE_JOB(
    job_name => 'update_kredit_rate_job',
    job_type => 'STORED_PROCEDURE',
    job_action => 'update_monthly_rate',
    start_date => TRUNC(SYSDATE, 'MM') + INTERVAL '1' MONTH, 
    repeat_interval => 'FREQ=MONTHLY;BYMONTHDAY=1', 
    enabled => TRUE);
END;