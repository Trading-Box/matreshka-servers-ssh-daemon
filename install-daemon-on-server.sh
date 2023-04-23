apt install -y python-pip

pip install git+https://github.com/Trading-Box/matreshka-servers-ssh-daemon#egg=matreshka-servers-live-sshpip

touch /etc/systemd/system/matreshka-live-ssh.service

echo "[Unit]
Description = Matreshka Server Live SSH
After = network.target
 
[Service]
Type = simple
ExecStart = /usr/local/bin/wssh --debug=true --origin=* --xsrf=false --fbidhttp=false
User = root
Restart = on-failure 
SyslogIdentifier = matreshka-server-live-ssh
RestartSec = 5
TimeoutStartSec = infinity
 
[Install]
WantedBy = multi-user.target" >> /etc/systemd/system/matreshka-live-ssh.service

systemctl enable matreshka-live-ssh
systemctl daemon-reload
systemctl start matreshka-live-ssh