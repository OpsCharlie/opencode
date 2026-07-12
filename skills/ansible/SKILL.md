---
name: ansible
description: Ansible playbook and role development with best practices for Linux infrastructure automation
---

## What I do

- Write and review Ansible playbooks, roles, and collections
- Design inventory structure and group variables
- Apply idempotency patterns and proper error handling
- Use ansible-lint and molecule for validation
- Structure projects with roles, collections, and inventories

## When to use me

Use this skill when working with Ansible playbooks, roles, inventory files, or automation tasks. Activate when the user mentions ansible, playbook, role, inventory, or automation.

## Patterns

### Playbook structure
```yaml
---
- name: Descriptive play name
  hosts: target_group
  become: true
  vars:
    var_name: value
  tasks:
    - name: Descriptive task name
      module_name:
        param: value
      notify: handler name
  handlers:
    - name: handler name
      module_name:
        param: value
```

### Role directory layout
```
roles/
  role_name/
    tasks/main.yml
    handlers/main.yml
    templates/
    files/
    vars/main.yml
    defaults/main.yml
    meta/main.yml
```

### Best practices
- Always use FQCN (fully qualified collection names): `ansible.builtin.copy`
- Use `name` on every task for clear `--check` output
- Prefer `module_name` over `command`/`shell` for idempotency
- Use `tags` for selective execution
- Use `block/rescue/always` for error handling
- Use `ansible-lint` before committing
- Use `molecule` for role testing

### Variable precedence
host_vars < group_vars < inventory vars < play vars < role defaults < extra vars

### Common patterns
```yaml
# Conditional
- name: Task with condition
  ansible.builtin.package:
    name: nginx
    state: present
  when: ansible_os_family == "Debian"

# Loop
- name: Install packages
  ansible.builtin.package:
    name: "{{ item }}"
    state: present
  loop: "{{ packages }}"

# Handler notify
- name: Restart service
  ansible.builtin.service:
    name: nginx
    state: restarted
  listen: "restart nginx"
```
