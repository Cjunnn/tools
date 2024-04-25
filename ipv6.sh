#/bin/bash
FTPDIR=/home/chenj/ftp
BASHDIR=/home/chenj/bash/
FILENAME=ubantuIp.txt
SCRIPTNAME=$0

if mount|grep curlftpfs > /dev/null; then
	sudo fusermount -u $FTPDIR
fi

sudo curlftpfs -o codepage=utf8 ftp://JamesChen:8807010705CJ@192.168.50.202 $FTPDIR

while true
do
	OUTFILE=$BASHDIR/$FILENAME
	date "+%Y/%m/%d-%H:%M:%S" > $OUTFILE
	echo -n "PID=" >> $OUTFILE
	echo $$ >> $OUTFILE

	ifconfig ens3 |grep inet6|awk '/0x0/{print $2}' >> $OUTFILE
	sudo cp $OUTFILE $FTPDIR/
	sleep 60
done

