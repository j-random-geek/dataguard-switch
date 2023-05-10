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
col DATABASE_ROLE for a20
select DATABASE_ROLE from v$database;
