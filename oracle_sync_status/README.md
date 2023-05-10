# oracle_sync_status role

This role validates the archivelog shipping/application status for a given DB.

## Requirements

The role assumes that Ansible will either log into the database server as the `oracle` user, or that it can become `oracle` via privilege escalation (sudo or other means). The machine credential in question should guarantee this.

**Please note**, however, that when using this role in Production (with an Oracle RAC cluster), it should not be applied to individual cluster nodes, but **only** the RAC SCAN hostname.


## Role variables
- `oracle_sid` - the database ORACLE_SID to operate on
- `oracle_dr_sid` - the ORACLE_SID of the DR database corresponding to `oracle_sid`
- `oracle_base` - the ORACLE_BASE value for this server
- `oracle_home` - the ORACLE_HOME value for this database
- `oracle_dr_host` - the database node that the standby DB lives on (you might set this as an inventory variable for the primary host)

## Dependencies

None. This role uses only Ansible builtin modules.

## Example playbook
```
- name: Verify Oracle log shipping status
  hosts: oracle_db_servers
  become: true
  become_user: "oracle"
  gather_facts: true
  vars:
    ansible_pipelining: true
  roles:
    - role: oracle_sync_status
    vars:
      oracle_sid: "{{ oracle_sid_prod }}"
      oracle_dr_sid: "{{ oracle_sid_dr }}"
      oracle_base: "/oracle/app"
      oracle_home: "{{ oracle_base }}/product/12.2.0/dbhome_1"
      oracle_dr_host: "{{ dr_host }}"
```
