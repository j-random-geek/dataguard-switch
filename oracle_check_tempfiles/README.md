# oracle_check_tempfiles role

This role shows the temporary tablespace files configured for the specified database

## Requirements

This role uses only Ansible builtin modules.

**Please note**, however, that when using this role in Production (with an Oracle RAC cluster), it should not be applied to individual cluster nodes, but **only** the RAC SCAN hostname.

## Role variables
- `oracle_sid` - the Oracle instance on the prod (active) side
- `oracle_base` - the Oracle base on the DB server
- `oracle_home` - the Oracle home on the DB server

## Dependencies

None.

## Example playbook
```
---
- name: Verify temporary tablespace files
  hosts: db_servers
  become: true
  become_user: "oracle"
  gather_facts: true
  vars:
    ansible_pipelining: true
    # Ansible will hang on Oracle-related operations if pipelining is not enabled
    oracle_base: "/oracle/app"
    oracle_home: "/oracle/app/product/12.2.0/dbhome_1"
  roles:
    - role: oracle_check_tempfiles
      vars:
        oracle_sid: "{{ oracle_sid_prod }}"
    - role: oracle_check_tempfiles
      delegate_to: "{{ dr_host }}"
      vars:
        oracle_sid: "{{ oracle_sid_dr }}"
```
