set feedback off
set heading off
set echo off
set showmode off
set verify off
set space 0
set newpage 0
set pages 0
set lines 2500
set sqlblanklines off
set long 5000
select regexp_replace(to_char(lhmax), '[[:space:]]')
from ( select thread# thrd, max(sequence#) almax from v$archived_log where resetlogs_change#=( select resetlogs_change# from v$database) group by thread#) al,
     ( select thread# thrd, max(sequence#) lhmax from v$log_history where resetlogs_change#=( select resetlogs_change# from v$database) group by thread#) lh
where al.thrd = lh.thrd;
