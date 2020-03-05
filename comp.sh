comp()
{
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

}

comp
