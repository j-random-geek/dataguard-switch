set feedback off
set heading off
set echo off
set showmode off
set verify off
set space 0
set newpage 0
set pages 0
set lines 400
col FILE_NAME format a75
select d.tablespace_name, d.file_name, d.bytes/1024/1024 SIZE_MB, d.autoextensible, d.maxbytes/1024/1024 MAXSIZE_DB, d.increment_by*(v.block_size/1024)/1024 INCREMENT_BY_MB
from dba_temp_files d, v$tempfile v where d.file_id = v.file# order by d.tablespace_name, d.file_name;
