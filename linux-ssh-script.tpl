cat << EOF >> ~/.ssh/config

Host ${host}
  HostName ${hostname}
  User ${user}
  IdentityFile ${identityFile}
EOF
