zc#!/bin/bash
key=/home/ec2-user/ram-cloud.pem
file=/home/ec2-user/hosts.txt
host=`hostname`
for i in `cat $file`
do
echo "logging into host $i"
ssh -i $key ec2-user@$i echo -e "::DETAILS ABOUT HOST:$host::" >> ram.txt;
echo -e "\n::Free space:: \n" >> ram.txt
df -h >> ram.txt;
echo -e "\n::Memory Details:: \n" >> ram.txt
free -m >> ram.txt;
echo -e "\n::Load Avg::\n">> ram.txt
uptime >> ram.txt
done

#!/bin/bash
set -x
for i in `cat test.txt`;
do
echo "Users under $i" >> ram.txt;
ssh -i ../private.pem rguthul@root@vmname@edc.personl.net cat /etc/passwd | awk '{print $1 $2}' >> ram.txt;
done
