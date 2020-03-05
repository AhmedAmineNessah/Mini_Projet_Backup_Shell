

graph()
{


PRIVATE=$(zenity --password --username)
echo "bienvenue dans l'applicaation"

choix=6
esem=`cat /etc/passwd | grep $USER | cut -f1 -d:`
option=$(zenity --width=500 --height=500 --list --title "Bienvenue dans l'app" --text "<span color=\"red\">bonjour mr `echo $PRIVATE | cut -d'|' -f1`</span>" --column MENU "1--Copier les donnees dans un repertoir backup" "2--Archiver Backup" "3--Compresser Backup.tar" "4--Restorer les donées" "5--Afficher help" "6--Exit")
#until [[ $choix -le 5 &&  $choix -ge 1 ]]
#do
#echo -e "1--Copier les donnees dans un repertoir backup"
#echo -e "2--Archiver Backup"
#echo -e "3--Compresser Backup.tar"
#echo -e "4--Restorer les donées "
#echo -e "5--Afficher he"
#read choix
#done
case $option in
	
	"1--Copier les donnees dans un repertoir backup") uid=`cat /etc/passwd | grep $USER | cut -f3 -d:`
		
		name=esem
		
	
	if [[ $uid -ge 1000 &&  $uid -le 6000 && ! -r /backup ]]
	then 	
		cd /
		 sudo mkdir backup #zenity --password --text "Entre mot de passe" 
		
		cd backup

		sudo mkdir -p "$esem"	

		sudo cp -rf /home/$esem /backup 
		else
			 echo "backup existe deja" | zenity --width=200 --height=200 --info --text "<span color=\"red\" font=\"30\"><b>Backup existe deja</b></span>" 
		fi  
 		zenity --info --text "<span color=\"red\" font=\"30\"><b>Done</b></span>" 
     			

		;;
	"2--Archiver Backup")
			
			if [[ ! -a /backup/$esem.tar ]]
			then	
			cd /backup
			 sudo tar -cvf $esem.tar $esem/
				sudo rm -r amine
 				else echo "existe deja  " | zenity --width=200 --height=200 --info --text "<span color=\"red\" font=\"30\"><b>Backup existe deja</b></span>"
				fi
			zenity --info --text "<span color=\"red\" font=\"30\"><b>Done</b></span>"

				;;
	"3--Compresser Backup.tar")
		choix2="ll"
until [[ $choix2 = "-arbz2" || $choix2 = "-argz" || $choix2 = "-arxz" ]]
do
echo -e "-arbz2) Compresserr en BZ2"
echo -e "-argz) Compresserer en GZ"
echo -e "-arxz) Compresserer en XZ"
read choix2
done
esem=`cat /etc/passwd | grep $USER | cut -f1 -d:`
		
		name=esem
if [[ ! -a /backup/$esem.tar.xz && $choix2 == "-arxz" ]]
    			then
			cd /backup
          
		sudo xz -k9 $esem.tar
		sudo rm -r $esem.tar #| zenity --width=200 --height=200 --info --text "<span color=\"red\" font=\"30\"><b>Backup COMPRESSAGE ET SUPPRESSION TERMINER</b></span>"
		else echo "$esem.tar.xz existe deja" #| zenity --width=200 --height=200 --info --text "<span color=\"red\" font=\"30\"><b>Backup existe deja</b></span>"
			fi
if [[ ! -a /backup/$esem.tar.bz2 && $choix2 == "-arbz2" ]]
    			then
			cd /backup
		sudo  bzip2 -z $esem.tar
		sudo rm -r $esem.tar #| zenity --width=200 --height=200 --info --text "<span color=\"red\" font=\"30\"><b>Backup COMPRESSAGE ET SUPPRESSION TERMINER</b></span>"
		else echo "$esem.tar.bz2 existe deja" #| zenity --width=200 --height=200 --info --text "<span color=\"red\" font=\"30\"><b>Backup existe deja</b></span>"
			fi
if [[ ! -a /backup/$esem.tar.gz && $choix2 == "-argz" ]]
    			then
			cd /backup
		sudo gzip -k  $esem.tar
		sudo rm -r $esem.tar #| zenity --width=200 --height=200 --info --text "<span color=\"red\" font=\"30\"><b>Backup COMPRESSAGE ET SUPPRESSION TERMINER</b></span>"
		else echo "$esem.tar.gz existe deja" #| zenity --width=200 --height=200 --info --text "<span color=\"red\" font=\"30\"><b>Backup existe deja</b></span>"
			fi

		;;
	
	"4--Restorer les donées")
		
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
 zenity --width=200 --height=200 --info --text "<span color=\"red\" font=\"30\"><b>Restoration terminée avec success</b></span>"
		;;
	"5--Afficher help")
	zenity --width=200 --height=200 --info --text "<span color=\"red\" font=\"30\"><b></b></span>
							"
		;;
	"6--Exit")
		return
		;;
		
		
esac


}
graph


