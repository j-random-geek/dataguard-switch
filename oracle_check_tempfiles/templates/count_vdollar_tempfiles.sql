set feedback off
set heading off
set echo off
set showmode off
set verify off
set space 0
set newpage 0
set pages 0
set lines 400
select regexp_replace(to_char(count(*)), '[[:space:]]') from v$tempfile;
