```
Setting up python (2.7.15~rc1-1) ...
Setting up libc++1:amd64 (6.0-2) ...
Setting up mssql-server (14.0.3048.4-1) ...

+--------------------------------------------------------------+
Please run 'sudo /opt/mssql/bin/mssql-conf setup'
to complete the setup of Microsoft SQL Server
+--------------------------------------------------------------+

SQL Server needs to be restarted in order to apply this setting. Please run
'systemctl restart mssql-server.service'.
Processing triggers for libc-bin (2.27-3ubuntu1) ...
devtest@ubuntu:~/Downloads$ 
```

```
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/16.04/mssql-server-2017.list)"
sudo apt-get update
sudo apt-get install -y mssql-server

```

```
sudo /opt/mssql/bin/sqlservr-setup
sudo ufw allow 1433/tcp

systemctl status mssql-server

```