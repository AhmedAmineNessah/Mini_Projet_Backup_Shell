backup ()
{
			uid=`cat /etc/passwd | grep $USER | cut -f3 -d:`
esem=`cat /etc/passwd | grep $USER | cut -f1 -d:`
		
		name=esem
		
	
	if [[ $uid -ge 1000 &&  $uid -le 6000 && ! -r /backup ]]
	then 	
		cd /
		 sudo mkdir backup #zenity --password --text "Entre mot de passe" 
		
		cd backup

		sudo mkdir -p "$esem"	

		sudo cp -rf /home/$esem /backup 
		else
			 echo "backup existe deja" #| zenity --width=200 --height=200 --info --text "<span color=\"red\" font=\"30\"><b>Backup existe deja</b></span>" 
		fi  
 		#zenity --info --text "<span color=\"red\" font=\"30\"><b>Done</b></span>"
}

backup
