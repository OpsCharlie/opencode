---
name: ansible
description: High-quality Ansible playbook and role development with best practices, AI-assisted generation, and Linux infrastructure automation
---

## What I do

- Write and review production-ready Ansible playbooks, roles, and collections.
- Design clean inventory structures, group variables, and dynamic configurations.
- Apply strict idempotency patterns, optimal state management, and robust error handling.
- Implement testing workflows using ansible-lint, molecule, and ansible-test.
- Scaffold multi-OS architecture utilizing clean task-splitting design patterns.


## When to use me

Activate this skill whenever the user mentions Ansible, playbooks, roles, automation, inventories, CI/CD deployment tasks, or when generating infrastructure-as-code (IaC).

## AI Generation Guidelines

When generating Ansible code, the AI must strictly adhere to:
1. **No Explanations First:** Output valid, clean YAML immediately. Keep commentary minimal or inside task names unless requested.
2. **Contextual Variables:** Prefer using `defaults/main.yml` for user-configurable variables and `vars/main.yml` for internal, non-overrideable role constants.
3. **Modern Collections:** Automatically suggest standard collections (e.g., `ansible.posix`, `community.general`, `amazon.aws`) instead of legacy built-ins where appropriate.

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
      ansible.builtin.module_name:
        param: value
      notify: handler name

  handlers:
    - name: handler name
      ansible.builtin.module_name:
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

### Multi-OS Task Dynamic Inclusion (Preferred Pattern)
For roles supporting multiple operating systems (RHEL/AlmaLinux, Ubuntu, Windows), dynamically isolate OS-specific tasks into dedicated directories inside `tasks/`. 

*Crucial Note: Directory names are case-sensitive and must exactly match the value returned by `ansible_facts['os_family']` (`RedHat`, `Debian`, `Windows`).*

```yaml
# tasks/main.yml
---
- name: Execute OS-specific tasks dynamically
  ansible.builtin.include_tasks: "{{ ansible_facts['os_family'] }}/main.yml"
```

**Required directory layout for this pattern:**
```text
roles/role_name/tasks/
  ├── main.yml
  ├── RedHat/
  │     ├── main.yml       # Executed on RHEL & AlmaLinux
  │     └── uninstall.yml
  ├── Debian/
  │     ├── main.yml       # Executed on Ubuntu
  │     └── uninstall.yml
  └── Windows/
        ├── main.yml       # Executed on Windows
        └── uninstall.yml
```

### Best practices
- **FQCN Always:** Never use short module names. Always use Fully Qualified Collection Names (e.g., `ansible.builtin.copy`, `ansible.posix.sysctl`).
- **Modern Facts Syntax:** Always use the dictionary-based facts format: `ansible_facts['os_family']` or `ansible_facts['distribution']`. Do **not** use legacy flat variables like `ansible_os_family`.
- **Descriptive Names:** Every task, play, and handler *must* have a clear, lowercase-started or capitalized `name` string for clear `--check` and logging output.
- **Idempotency:** Strictly avoid `ansible.builtin.command` or `ansible.builtin.shell` unless no specialized module exists. If used, always pair with `changed_when` and `failed_when`.
- **Targeted Execution:** Implement meaningful `tags` (e.g., `setup`, `config`, `service`) at the task or block level.
- **Error Resilience:** Use `block/rescue/always` structures for complex multi-step tasks that require cleanup or graceful degradation.
- **Validation:** Code must be compliant with the latest `ansible-lint` rules and ready for `molecule` matrix testing.

### Variable precedence (Lowest to Highest)
*Note: This reflects the correct official Ansible precedence order for roles.*
1. role defaults (`defaults/main.yml`)
2. inventory group_vars/*
3. inventory host_vars/*
4. inventory host/group definitions
5. play vars
6. play vars_prompt
7. play vars_files
8. role vars (`vars/main.yml`)
9. block vars
10. task vars
11. extra vars (`-e` via CLI - always wins)

### Common patterns

```yaml
# Conditional with modern OS facts
- name: Install Nginx on Debian-based systems
  ansible.builtin.package:
    name: nginx
    state: present
  when: ansible_facts['os_family'] == "Redhat"

# Loop with explicit label for clean output
- name: Install required system utilities
  ansible.builtin.package:
    name: "{{ item }}"
    state: present
  loop: "{{ utility_packages }}"
  loop_control:
    label: "{{ item }}"

# Handler notify via listen topic
- name: Copy configuration file
  ansible.builtin.template:
    src: config.conf.j2
    dest: /etc/myapp/config.conf
    mode: '0644'
  notify: "restart myapp"
```
