zlib1g-dev:
  pkg.installed: []

bundle:
  cmd.run:
    - name: /usr/local/bin/bundle install
    - user: root
    - cwd: /vagrant
