/usr/sbin/init
echo "start mounting"
mount -t nfs 10.15.172.54:/sac/tools /sac/tools
mount point /sac/tools
echo "mounting done successfully"
SSHFILE=~/.ssh/id_rsa.pub

if [ ! -f "$SSHFILE" ]; then
    ssh-keygen -N "" -f ~/.ssh/id_rsa
fi
export https_proxy="http://87.254.212.120:8080"
export http_proxy="http://87.254.212.120:8080"
export ftp_proxy="http://87.254.212.120:8080"
export no_proxy="127.0.0.1,10.75.52.104,localhost,repo.lab.pl.alcatel-lucent.com"
export JAVA_HOME=/usr/lib/jvm/java
export SAC_TOOLS=/sac/tools/bin/
cat ~/.ssh/id_rsa.pub
echo "add this ssh key to your gerrit account sittings"
mkdir /home/sps_projects
echo "change to directory /home/sps_projects and clone the the project"
cat ~/.ssh/id_rsa.pub
bash $1