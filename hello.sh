# chef나 puppet 같은거 쓰지 왜 이런거 쓰니ㅠㅠ





#
# 01. 일단 비밀 번호부터 바꾸자.
#
#passwd

#
# 02. Hostname 변경
#

# (hostname 확인은 그냥 보이지만) hostname
# echo "new hostname"> /proc/sys/kernel/hostname
# (추가하자, 다른 서버도 필요시)vi /etc/hosts
# vi /etc/sysconfig/network
# (재부팅) init 6

#
# 03. OS의 패키지 관리자로 필요 한 것을 설치하자.
#

ARCH=$(uname -m | sed 's/x86_//;s/i[3-6]86/32/')
if [ -f /etc/lsb-release ]; then
    . /etc/lsb-release
    OS=$DISTRIB_ID
    VER=$DISTRIB_RELEASE
elif [ -f /etc/debian_version ]; then
    OS=Debian  # XXX or Ubuntu??
    VER=$(cat /etc/debian_version)
    echo "Ubuntu"
    sudo sed -i -e 's/us.archive\.ubuntu\.com/ftp\.daum\.net/g' /etc/apt/sources.list
    sudo sed -i -e 's/kr.archive\.ubuntu\.com/ftp\.daum\.net/g' /etc/apt/sources.list
    sudo apt-get update;
    sudo apt-get upgrade -y;
    sudo apt-get install python-software-properties python g++ make -y;
    #sudo apt-get install python-software-properties -y;
    sudo add-apt-repository ppa:chris-lea/node.js  
    sudo apt-get update;
    sudo apt-get install nodejs npm -y;
elif [ -f /etc/redhat-release ]; then
    # TODO add code for Red Hat and CentOS here
    echo "CentOS"
    yum update -y  
    yum install gcc-c++ gcc openssl-devel make git screen -y
	echo -e "[mariadb]\nname = MariaDB\nbaseurl = http://yum.mariadb.org/5.5/centos5-x86\ngpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB\ngpgcheck=1" > /etc/yum.repos.d/MariaDB.repo
	yum remove mysql-libs -y
	yum install MariaDB-server MariaDB-client -y
else
    OS=$(uname -s)
    VER=$(uname -r)
fi


#
# node.js 는 컴파일 해서 설치 한다.
#
cd /usr/local/src/
wget http://nodejs.org/dist/v0.10.24/node-v0.10.24-linux-x64.tar.gz
tar zxvf node-v0.10.24-linux-x64.tar.gz
cd node-v0.10.24-linux-x64
./configure
make -j
make install
node -v
npm -v


#npms
npm install -g forever
npm install -g express

#
# redis를 설치한다.
#
cd /usr/local/src 
wget http://download.redis.io/releases/redis-2.8.3.tar.gz
tar xvfz redis-2.8.3.tar.gz
cd redis-2.8.3
make -j
make install
cd utils
./install_server.sh
/etc/init.d/redis_6379 start


#install vimrc screenrc
wget https://raw.github.com/hoyajigi/linuxtoys/master/vimrc
mv vimrc ~/.vimrc


#deploy

#forever start example.js to start a process.
#forever list to see list of all processes started by forever
#forever stop example.js to stop the process, or forever stop 0 to stop the process with index 0 (as shown by forever list).
