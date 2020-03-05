
archive()

{

esem=`cat /etc/passwd | grep $USER | cut -f1 -d:`
		
		name=esem

if [[ ! -a /backup/$esem.tar ]]
			then	
			cd /backup
			 sudo tar -cvf $esem.tar $esem/
				sudo rm -r amine
 				else echo "existe deja  " #| zenity --width=200 --height=200 --info --text "<span color=\"red\" font=\"30\"><b>Backup existe deja</b></span>"
				fi
			#zenity --info --text "<span color=\"red\" font=\"30\"><b>Done</b></span>"

}
archive
