#!/bin/sh

USER=vagrant

echo "in jdk."

if [ -d /usr/java/jdk1.7.0_71 ] ; then
	echo " - already."
	exit 0
fi

cd /tmp
echo " - download."
curl -L -O https://s3-ap-northeast-1.amazonaws.com/gennai/binary/jdk-7u71-linux-x64.rpm >/dev/null 2>&1

echo " - install."
rpm -ivh ./jdk-7u71-linux-x64.rpm >/dev/null 2>&1
ln -s /usr/java/default/bin/jps /usr/bin/jps

# environment
OUTPUT=/home/${USER}/.bashrc
echo >> ${OUTPUT}
echo "export JAVA_HOME=/usr/java/default" >> ${OUTPUT}
echo "export PATH=\${JAVA_HOME}/bin:\${PATH}" >> ${OUTPUT}

# cleanup
rm /tmp/jdk-7u71-linux-x64.rpm

#EOF
