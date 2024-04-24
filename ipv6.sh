#/bin/bash
FTPDIR=/home/chenj/ftp
BASHDIR=/home/chenj/bash/

if mount|grep curlftpfs > /dev/null; then
	sudo fusermount -u $FTPDIR
fi

sudo curlftpfs -o codepage=utf8 ftp://JamesChen:8807010705CJ@192.168.50.202 $FTPDIR

while true
do
	echo -n "PID=" > $BASHDIR/ubantuIp.txt
	echo $$ >> $BASHDIR/ubantuIp.txt

	ifconfig ens3|grep inet6 >> $BASHDIR/ubantuIp.txt
	sudo cp $BASHDIR/ubantuIp.txt $FTPDIR/ubantuIp.txt
	sleep 30
done

