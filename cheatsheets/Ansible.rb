cheatsheet do
  title 'Ansible'
  docset_file_name 'Ansible'
  keyword 'ansible'
  source_url 'http://cheat.kapeli.com'

  category do
    id 'Installation'

    entry do
      name 'Install Ansible via pip'
      notes "
      ```bash
      pip install ansible
      ```"
    end

    entry do
      name 'Install Ansible via apt (Ubuntu/Debian)'
      notes "
      ```bash
      sudo apt update
      sudo apt install ansible
      ```"
    end

    entry do
      name 'Install Ansible via yum (RHEL/CentOS)'
      notes "
      ```bash
      sudo yum install ansible
      ```"
    end

    entry do
      name 'Verify installation'
      notes "
      ```bash
      ansible --version
      ```"
    end
  end

  category do
    id 'Basic Commands'

    entry do
      name 'Run ad-hoc command on all hosts'
      notes "
      ```bash
      ansible all -m ping
      ```"
    end

    entry do
      name 'Run ad-hoc command on specific group'
      notes "
      ```bash
      ansible webservers -m ping
      ```"
    end

    entry do
      name 'Run shell command on hosts'
      notes "
      ```bash
      ansible all -m shell -a 'uptime'
      ```"
    end

    entry do
      name 'Run playbook'
      notes "
      ```bash
      ansible-playbook playbook.yml
      ```"
    end

    entry do
      name 'Run playbook with inventory file'
      notes "
      ```bash
      ansible-playbook -i inventory.ini playbook.yml
      ```"
    end

    entry do
      name 'Run playbook with specific tags'
      notes "
      ```bash
      ansible-playbook playbook.yml --tags \"configuration,packages\"
      ```"
    end

    entry do
      name 'Skip specific tags'
      notes "
      ```bash
      ansible-playbook playbook.yml --skip-tags \"testing\"
      ```"
    end

    entry do
      name 'Check playbook syntax'
      notes "
      ```bash
      ansible-playbook playbook.yml --syntax-check
      ```"
    end

    entry do
      name 'Run playbook in dry-run mode'
      notes "
      ```bash
      ansible-playbook playbook.yml --check
      ```"
    end

    entry do
      name 'Run playbook with verbose output'
      notes "
      ```bash
      ansible-playbook playbook.yml -v
      ansible-playbook playbook.yml -vv
      ansible-playbook playbook.yml -vvv
      ansible-playbook playbook.yml -vvvv
      ```"
    end

    entry do
      name 'Limit execution to specific hosts'
      notes "
      ```bash
      ansible-playbook playbook.yml --limit \"host1,host2\"
      ```"
    end

    entry do
      name 'Step through playbook interactively'
      notes "
      ```bash
      ansible-playbook playbook.yml --step
      ```"
    end

    entry do
      name 'Start at specific task'
      notes "
      ```bash
      ansible-playbook playbook.yml --start-at-task=\"task name\"
      ```"
    end
  end

  category do
    id 'Configuration'

    entry do
      name 'ansible.cfg locations (in order of precedence)'
      notes <<-'END'
      1. `ANSIBLE_CONFIG` environment variable
      2. `ansible.cfg` in current directory
      3. `~/.ansible.cfg` in home directory
      4. `/etc/ansible/ansible.cfg`
      END
    end

    entry do
      name 'Basic ansible.cfg structure'
      notes <<-'END'
      ```ini
      [defaults]
      inventory = ./inventory
      remote_user = ansible
      host_key_checking = False
      retry_files_enabled = False

      [privilege_escalation]
      become = True
      become_method = sudo
      become_user = root
      become_ask_pass = False
      ```
      END
    end

    entry do
      name 'Set custom config location'
      notes "
      ```bash
      export ANSIBLE_CONFIG=/path/to/ansible.cfg
      ```"
    end

    entry do
      name 'View current configuration'
      notes "
      ```bash
      ansible-config dump
      ```"
    end

    entry do
      name 'List all config options'
      notes "
      ```bash
      ansible-config list
      ```"
    end
  end

  category do
    id 'Inventory'

    entry do
      name 'INI format inventory'
      notes <<-'END'
      ```ini
      # inventory.ini
      [webservers]
      web1.example.com
      web2.example.com

      [databases]
      db1.example.com
      db2.example.com

      [production:children]
      webservers
      databases

      [webservers:vars]
      http_port=80
      ```
      END
    end

    entry do
      name 'YAML format inventory'
      notes <<-'END'
      ```yaml
      # inventory.yml
      all:
        children:
          webservers:
            hosts:
              web1.example.com:
              web2.example.com:
            vars:
              http_port: 80
          databases:
            hosts:
              db1.example.com:
              db2.example.com:
      ```
      END
    end

    entry do
      name 'List all hosts in inventory'
      notes "
      ```bash
      ansible all --list-hosts
      ```"
    end

    entry do
      name 'List hosts in specific group'
      notes "
      ```bash
      ansible webservers --list-hosts
      ```"
    end

    entry do
      name 'Get host variables'
      notes "
      ```bash
      ansible-inventory --host hostname
      ```"
    end

    entry do
      name 'View inventory graph'
      notes "
      ```bash
      ansible-inventory --graph
      ```"
    end

    entry do
      name 'Use dynamic inventory script'
      notes "
      ```bash
      ansible-playbook -i ec2.py playbook.yml
      ```"
    end
  end

  category do
    id 'Playbook Structure'

    entry do
      name 'Basic playbook structure'
      notes <<-'END'
      ```yaml
      ---
      - name: Configure web servers
        hosts: webservers
        become: yes
        vars:
          http_port: 80

        tasks:
          - name: Install Apache
            apt:
              name: apache2
              state: present

          - name: Start Apache service
            service:
              name: apache2
              state: started
              enabled: yes
      ```
      END
    end

    entry do
      name 'Multiple plays in one playbook'
      notes <<-'END'
      ```yaml
      ---
      - name: Configure web servers
        hosts: webservers
        tasks:
          - name: Task 1
            ...

      - name: Configure database servers
        hosts: databases
        tasks:
          - name: Task 2
            ...
      ```
      END
    end

    entry do
      name 'Include tasks from file'
      notes <<-'END'
      ```yaml
      tasks:
        - name: Include common tasks
          include_tasks: common-tasks.yml
      ```
      END
    end

    entry do
      name 'Import tasks from file'
      notes <<-'END'
      ```yaml
      tasks:
        - name: Import common tasks
          import_tasks: common-tasks.yml
      ```
      END
    end

    entry do
      name 'Include variables from file'
      notes <<-'END'
      ```yaml
      - name: Include variables
        include_vars: vars.yml
      ```
      END
    end
  end

  category do
    id 'Common Modules'

    entry do
      name 'apt - Manage packages (Debian/Ubuntu)'
      notes <<-'END'
      ```yaml
      - name: Install package
        apt:
          name: nginx
          state: present
          update_cache: yes

      - name: Remove package
        apt:
          name: nginx
          state: absent

      - name: Install multiple packages
        apt:
          name:
            - nginx
            - git
            - vim
          state: present
      ```
      END
    end

    entry do
      name 'yum - Manage packages (RHEL/CentOS)'
      notes <<-'END'
      ```yaml
      - name: Install package
        yum:
          name: httpd
          state: present

      - name: Install specific version
        yum:
          name: httpd-2.4.6
          state: present
      ```
      END
    end

    entry do
      name 'package - Generic package manager'
      notes <<-'END'
      ```yaml
      - name: Install package (OS agnostic)
        package:
          name: htop
          state: present
      ```
      END
    end

    entry do
      name 'service - Manage services'
      notes <<-'END'
      ```yaml
      - name: Start and enable service
        service:
          name: nginx
          state: started
          enabled: yes

      - name: Restart service
        service:
          name: nginx
          state: restarted

      - name: Stop service
        service:
          name: nginx
          state: stopped
      ```
      END
    end

    entry do
      name 'copy - Copy files to remote hosts'
      notes <<-'END'
      ```yaml
      - name: Copy file
        copy:
          src: /local/path/file.txt
          dest: /remote/path/file.txt
          owner: root
          group: root
          mode: '0644'

      - name: Copy with inline content
        copy:
          content: "Hello World"
          dest: /tmp/hello.txt
      ```
      END
    end

    entry do
      name 'file - Manage files and directories'
      notes <<-'END'
      ```yaml
      - name: Create directory
        file:
          path: /opt/myapp
          state: directory
          mode: '0755'

      - name: Create symlink
        file:
          src: /path/to/source
          dest: /path/to/link
          state: link

      - name: Delete file
        file:
          path: /tmp/file.txt
          state: absent

      - name: Touch file
        file:
          path: /tmp/file.txt
          state: touch
      ```
      END
    end

    entry do
      name 'template - Template files using Jinja2'
      notes <<-'END'
      ```yaml
      - name: Template a configuration file
        template:
          src: nginx.conf.j2
          dest: /etc/nginx/nginx.conf
          owner: root
          group: root
          mode: '0644'
        notify: restart nginx
      ```
      END
    end

    entry do
      name 'lineinfile - Manage lines in files'
      notes <<-'END'
      ```yaml
      - name: Add line to file
        lineinfile:
          path: /etc/hosts
          line: '192.168.1.100 myserver.example.com'

      - name: Replace or add line
        lineinfile:
          path: /etc/ssh/sshd_config
          regexp: '^PermitRootLogin'
          line: 'PermitRootLogin no'
      ```
      END
    end

    entry do
      name 'user - Manage user accounts'
      notes <<-'END'
      ```yaml
      - name: Create user
        user:
          name: johndoe
          state: present
          shell: /bin/bash
          groups: sudo
          append: yes

      - name: Remove user
        user:
          name: johndoe
          state: absent
          remove: yes
      ```
      END
    end

    entry do
      name 'group - Manage groups'
      notes <<-'END'
      ```yaml
      - name: Create group
        group:
          name: developers
          state: present
      ```
      END
    end

    entry do
      name 'git - Manage git repositories'
      notes <<-'END'
      ```yaml
      - name: Clone repository
        git:
          repo: https://github.com/user/repo.git
          dest: /opt/myapp
          version: main

      - name: Pull latest changes
        git:
          repo: https://github.com/user/repo.git
          dest: /opt/myapp
          update: yes
      ```
      END
    end

    entry do
      name 'shell - Execute shell commands'
      notes <<-'END'
      ```yaml
      - name: Run shell command
        shell: echo "Hello" > /tmp/hello.txt
        args:
          creates: /tmp/hello.txt
      ```
      END
    end

    entry do
      name 'command - Execute commands'
      notes <<-'END'
      ```yaml
      - name: Run command
        command: ls -la /tmp
        args:
          chdir: /home/user
      ```

      Note: `command` module does not support piping, redirection, or shell variables. Use `shell` module for those.
      END
    end

    entry do
      name 'debug - Print debug messages'
      notes <<-'END'
      ```yaml
      - name: Print variable
        debug:
          var: ansible_hostname

      - name: Print message
        debug:
          msg: "The hostname is {{ ansible_hostname }}"
      ```
      END
    end

    entry do
      name 'assert - Assertions'
      notes <<-'END'
      ```yaml
      - name: Assert condition
        assert:
          that:
            - ansible_os_family == "Debian"
            - ansible_distribution_version >= "20.04"
          fail_msg: "This playbook requires Ubuntu 20.04 or later"
      ```
      END
    end

    entry do
      name 'uri - Interact with HTTP/HTTPS'
      notes <<-'END'
      ```yaml
      - name: Make HTTP request
        uri:
          url: https://api.example.com/health
          method: GET
          status_code: 200
      ```
      END
    end

    entry do
      name 'wait_for - Wait for a condition'
      notes <<-'END'
      ```yaml
      - name: Wait for port to be available
        wait_for:
          port: 80
          delay: 10
          timeout: 300
      ```
      END
    end
  end

  category do
    id 'Variables and Facts'

    entry do
      name 'Define variables in playbook'
      notes <<-'END'
      ```yaml
      vars:
        http_port: 80
        app_name: myapp
      ```
      END
    end

    entry do
      name 'Use variables in tasks'
      notes <<-'END'
      ```yaml
      - name: Install {{ app_name }}
        apt:
          name: "{{ app_name }}"
          state: present
      ```
      END
    end

    entry do
      name 'Gather facts from hosts'
      notes <<-'END'
      ```yaml
      - name: Gather facts
        hosts: all
        gather_facts: yes
      ```

      Common facts:
      - `ansible_hostname`
      - `ansible_os_family`
      - `ansible_distribution`
      - `ansible_distribution_version`
      - `ansible_architecture`
      - `ansible_default_ipv4.address`
      END
    end

    entry do
      name 'Disable fact gathering'
      notes <<-'END'
      ```yaml
      - name: Play without facts
        hosts: all
        gather_facts: no
      ```
      END
    end

    entry do
      name 'Set fact dynamically'
      notes <<-'END'
      ```yaml
      - name: Set fact
        set_fact:
          my_var: "{{ ansible_hostname }}_backup"
      ```
      END
    end

    entry do
      name 'Register task output as variable'
      notes <<-'END'
      ```yaml
      - name: Get disk usage
        shell: df -h /
        register: disk_usage

      - name: Print disk usage
        debug:
          var: disk_usage.stdout
      ```
      END
    end

    entry do
      name 'Variable precedence (low to high)'
      notes <<-'END'
      1. Role defaults
      2. Inventory variables
      3. Playbook variables
      4. Host facts
      5. Registered variables
      6. Set facts
      7. Role and include variables
      8. Block variables
      9. Task variables
      10. Extra variables (command line `-e`)
      END
    end

    entry do
      name 'Pass extra variables via command line'
      notes <<-'END'
      ```bash
      ansible-playbook playbook.yml -e "http_port=8080"
      ansible-playbook playbook.yml -e "@vars.yml"
      ```
      END
    end
  end

  category do
    id 'Conditionals and Loops'

    entry do
      name 'Conditional execution with when'
      notes <<-'END'
      ```yaml
      - name: Install Apache on Debian
        apt:
          name: apache2
          state: present
        when: ansible_os_family == "Debian"

      - name: Install Apache on RedHat
        yum:
          name: httpd
          state: present
        when: ansible_os_family == "RedHat"
      ```
      END
    end

    entry do
      name 'Multiple conditions'
      notes <<-'END'
      ```yaml
      - name: Task with AND conditions
        debug:
          msg: "Condition met"
        when:
          - ansible_os_family == "Debian"
          - ansible_distribution_version >= "20.04"

      - name: Task with OR conditions
        debug:
          msg: "Condition met"
        when: ansible_os_family == "Debian" or ansible_os_family == "RedHat"
      ```
      END
    end

    entry do
      name 'Loop over list'
      notes <<-'END'
      ```yaml
      - name: Install packages
        apt:
          name: "{{ item }}"
          state: present
        loop:
          - nginx
          - git
          - vim
      ```
      END
    end

    entry do
      name 'Loop over dictionary'
      notes <<-'END'
      ```yaml
      - name: Create users
        user:
          name: "{{ item.key }}"
          state: present
          groups: "{{ item.value.groups }}"
        loop: "{{ users | dict2items }}"
        vars:
          users:
            alice:
              groups: sudo
            bob:
              groups: developers
      ```
      END
    end

    entry do
      name 'Loop with index'
      notes <<-'END'
      ```yaml
      - name: Print items with index
        debug:
          msg: "Item {{ item.0 }}: {{ item.1 }}"
        loop: "{{ packages | zip(range(packages | length)) | list }}"
      ```
      END
    end

    entry do
      name 'Loop until condition is met'
      notes <<-'END'
      ```yaml
      - name: Retry until success
        shell: /usr/bin/check-service.sh
        register: result
        until: result.rc == 0
        retries: 5
        delay: 10
      ```
      END
    end
  end

  category do
    id 'Handlers'

    entry do
      name 'Define and use handlers'
      notes <<-'END'
      ```yaml
      tasks:
        - name: Update nginx config
          template:
            src: nginx.conf.j2
            dest: /etc/nginx/nginx.conf
          notify: restart nginx

      handlers:
        - name: restart nginx
          service:
            name: nginx
            state: restarted
      ```
      END
    end

    entry do
      name 'Multiple handlers'
      notes <<-'END'
      ```yaml
      tasks:
        - name: Update config
          template:
            src: config.j2
            dest: /etc/app/config
          notify:
            - restart app
            - clear cache

      handlers:
        - name: restart app
          service:
            name: myapp
            state: restarted

        - name: clear cache
          file:
            path: /var/cache/myapp
            state: absent
      ```
      END
    end

    entry do
      name 'Force handler execution'
      notes <<-'END'
      ```yaml
      - name: Force handlers to run now
        meta: flush_handlers
      ```
      END
    end
  end

  category do
    id 'Roles'

    entry do
      name 'Role directory structure'
      notes <<-'END'
      ```
      roles/
        common/
          tasks/
            main.yml
          handlers/
            main.yml
          templates/
            config.j2
          files/
            script.sh
          vars/
            main.yml
          defaults/
            main.yml
          meta/
            main.yml
      ```
      END
    end

    entry do
      name 'Use role in playbook'
      notes <<-'END'
      ```yaml
      - name: Configure web servers
        hosts: webservers
        roles:
          - common
          - nginx
          - php
      ```
      END
    end

    entry do
      name 'Use role with parameters'
      notes <<-'END'
      ```yaml
      - name: Configure web servers
        hosts: webservers
        roles:
          - role: nginx
            vars:
              http_port: 8080
              server_name: example.com
      ```
      END
    end

    entry do
      name 'Install role from Ansible Galaxy'
      notes <<-'END'
      ```bash
      ansible-galaxy install geerlingguy.nginx
      ```
      END
    end

    entry do
      name 'List installed roles'
      notes <<-'END'
      ```bash
      ansible-galaxy list
      ```
      END
    end

    entry do
      name 'Create new role structure'
      notes <<-'END'
      ```bash
      ansible-galaxy init myrole
      ```
      END
    end

    entry do
      name 'Install roles from requirements file'
      notes <<-'END'
      ```bash
      # requirements.yml
      - src: geerlingguy.nginx
      - src: geerlingguy.php

      # Install
      ansible-galaxy install -r requirements.yml
      ```
      END
    end
  end

  category do
    id 'Ansible Vault'

    entry do
      name 'Create encrypted file'
      notes <<-'END'
      ```bash
      ansible-vault create secrets.yml
      ```
      END
    end

    entry do
      name 'Encrypt existing file'
      notes <<-'END'
      ```bash
      ansible-vault encrypt vars.yml
      ```
      END
    end

    entry do
      name 'Edit encrypted file'
      notes <<-'END'
      ```bash
      ansible-vault edit secrets.yml
      ```
      END
    end

    entry do
      name 'Decrypt file'
      notes <<-'END'
      ```bash
      ansible-vault decrypt secrets.yml
      ```
      END
    end

    entry do
      name 'View encrypted file'
      notes <<-'END'
      ```bash
      ansible-vault view secrets.yml
      ```
      END
    end

    entry do
      name 'Rekey encrypted file'
      notes <<-'END'
      ```bash
      ansible-vault rekey secrets.yml
      ```
      END
    end

    entry do
      name 'Run playbook with vault password'
      notes <<-'END'
      ```bash
      ansible-playbook playbook.yml --ask-vault-pass
      ```
      END
    end

    entry do
      name 'Use vault password file'
      notes <<-'END'
      ```bash
      ansible-playbook playbook.yml --vault-password-file ~/.vault_pass
      ```
      END
    end

    entry do
      name 'Encrypt string inline'
      notes <<-'END'
      ```bash
      ansible-vault encrypt_string 'secretpassword' --name 'db_password'
      ```

      Output can be used directly in playbooks:
      ```yaml
      db_password: !vault |
        $ANSIBLE_VAULT;1.1;AES256
        ...
      ```
      END
    end
  end

  category do
    id 'Tags'

    entry do
      name 'Define tags on tasks'
      notes <<-'END'
      ```yaml
      - name: Install packages
        apt:
          name: nginx
          state: present
        tags:
          - packages
          - nginx

      - name: Configure nginx
        template:
          src: nginx.conf.j2
          dest: /etc/nginx/nginx.conf
        tags:
          - configuration
          - nginx
      ```
      END
    end

    entry do
      name 'Tag entire play or role'
      notes <<-'END'
      ```yaml
      - name: Configure web servers
        hosts: webservers
        tags: webserver
        roles:
          - role: nginx
            tags: nginx
      ```
      END
    end

    entry do
      name 'Run only tagged tasks'
      notes <<-'END'
      ```bash
      ansible-playbook playbook.yml --tags "configuration"
      ansible-playbook playbook.yml --tags "nginx,php"
      ```
      END
    end

    entry do
      name 'Skip tagged tasks'
      notes <<-'END'
      ```bash
      ansible-playbook playbook.yml --skip-tags "testing"
      ```
      END
    end

    entry do
      name 'List all tags in playbook'
      notes <<-'END'
      ```bash
      ansible-playbook playbook.yml --list-tags
      ```
      END
    end

    entry do
      name 'Special tags'
      notes <<-'END'
      - `always` - Always run, even with `--tags`
      - `never` - Never run unless explicitly specified
      - `tagged` - Run all tagged tasks
      - `untagged` - Run all untagged tasks
      - `all` - Run everything (default)

      ```yaml
      - name: Always run this
        debug:
          msg: "This always runs"
        tags: always
      ```
      END
    end
  end

  category do
    id 'Best Practices'

    entry do
      name 'Use descriptive names'
      notes <<-'END'
      ```yaml
      # Good
      - name: Install and configure nginx web server
        ...

      # Bad
      - name: Install stuff
        ...
      ```
      END
    end

    entry do
      name 'Make tasks idempotent'
      notes <<-'END'
      Tasks should be safe to run multiple times without changing the result beyond the initial run.

      ```yaml
      # Idempotent
      - name: Ensure nginx is installed
        apt:
          name: nginx
          state: present

      # Not idempotent
      - name: Append to file
        shell: echo "line" >> /etc/config
      ```
      END
    end

    entry do
      name 'Use version control'
      notes <<-'END'
      - Store playbooks, roles, and inventory in Git
      - Use meaningful commit messages
      - Review changes before applying
      - Tag releases
      END
    end

    entry do
      name 'Organize with roles'
      notes <<-'END'
      - Break complex playbooks into reusable roles
      - Keep roles focused on single responsibility
      - Use role dependencies when needed
      - Share common roles across projects
      END
    end

    entry do
      name 'Test before production'
      notes <<-'END'
      ```bash
      # Syntax check
      ansible-playbook playbook.yml --syntax-check

      # Dry run
      ansible-playbook playbook.yml --check

      # Run on test hosts first
      ansible-playbook playbook.yml --limit "test-servers"
      ```
      END
    end

    entry do
      name 'Use become appropriately'
      notes <<-'END'
      ```yaml
      # On entire play
      - name: System configuration
        hosts: all
        become: yes
        tasks: ...

      # On specific task
      - name: Install package
        apt:
          name: nginx
        become: yes
      ```
      END
    end

    entry do
      name 'Document your playbooks'
      notes <<-'END'
      - Add comments explaining complex logic
      - Document required variables
      - Include README for roles
      - Provide example inventory files
      END
    end
  end

  category do
    id 'Troubleshooting'

    entry do
      name 'Check connectivity'
      notes <<-'END'
      ```bash
      ansible all -m ping
      ```
      END
    end

    entry do
      name 'Increase verbosity'
      notes <<-'END'
      ```bash
      ansible-playbook playbook.yml -v     # Level 1
      ansible-playbook playbook.yml -vv    # Level 2
      ansible-playbook playbook.yml -vvv   # Level 3
      ansible-playbook playbook.yml -vvvv  # Level 4 (connection debug)
      ```
      END
    end

    entry do
      name 'Debug variable values'
      notes <<-'END'
      ```yaml
      - name: Show all variables
        debug:
          var: hostvars[inventory_hostname]

      - name: Show specific variable
        debug:
          var: ansible_os_family
      ```
      END
    end

    entry do
      name 'List all facts'
      notes <<-'END'
      ```bash
      ansible hostname -m setup
      ```
      END
    end

    entry do
      name 'Test with single host'
      notes <<-'END'
      ```bash
      ansible-playbook playbook.yml --limit "hostname"
      ```
      END
    end

    entry do
      name 'Enable callback plugins for better output'
      notes <<-'END'
      ```ini
      # ansible.cfg
      [defaults]
      stdout_callback = yaml
      # or
      stdout_callback = debug
      ```
      END
    end
  end

  notes <<-'END'
    * Based on official Ansible documentation
    * Ansible documentation: https://docs.ansible.com/
  END
end
