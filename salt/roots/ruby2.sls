ruby-ng:
  pkgrepo.managed:
    - ppa: brightbox/ruby-ng

ruby2_2:
  pkg.installed:
    - name: ruby2.2
    - require:
      - pkgrepo: ruby-ng

ruby2_2-dev:
  pkg.installed:
    - name: ruby2.2-dev
    - require:
      - pkgrepo: ruby-ng
