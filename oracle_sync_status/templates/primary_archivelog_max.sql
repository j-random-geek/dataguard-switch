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
select regexp_replace(to_char(max(sequence#)), '[[:space:]]') from v$archived_log where resetlogs_time = (select max(resetlogs_time) from v$archived_log);
