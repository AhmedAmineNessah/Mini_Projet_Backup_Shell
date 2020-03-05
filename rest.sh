rest()
{


esem=`cat /etc/passwd | grep $USER | cut -f1 -d:`
		
		name=esem
cd /backup
for i in `ls`
	do 
	text=$(echo $i | cut -d. -f3)
	if [[ $text == "xz" ]]
then

cd /backup
		
		sudo tar -xJf $esem.tar.xz 
		sudo rm -r $esem.tar.xz
		cd /
		sudo mv backup /home #| zenity --width=200 --height=200 --info --text "<span color=\"red\" font=\"30\"><b>Restoration terminée avec success</b></span>"
fi
if [[ $text == "gz" ]]
then
cd /backup
sudo tar -zxvf $i 
sudo rm -r $esem.tar.gz
sudo rm -r $esem.tar.gz
		cd /
		sudo mv backup /home #| zenity --width=200 --height=200 --info --text "<span color=\"red\" font=\"30\"><b>Restoration terminée avec success</b></span>"

fi
if [[ $text == "bz2" ]]
then
cd /backup
sudo tar -jxvf $i
sudo rm -r $esem.tar.bz2
cd /
		sudo mv backup /home #| zenity --width=200 --height=200 --info --text "<span color=\"red\" font=\"30\"><b>Restoration terminée avec success</b></span>"

fi
done
}

rest
