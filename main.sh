#!/bin/bash









main()
{
choix=6


	#until [[ $choix -le 5 &&  $choix -ge 1 ]]
	#do
	
	#done

	case $1 in
		"-G") source app.sh
	;;
		"-s") source backup.sh
	;;
		"-ar") source archive.sh
	;;
		"-c") source comp.sh
	;;
		"-r") source rest.sh
		
	;;
				"-h")
			cat help.txt
	;;
		*) echo "Rien a ete entre, entrez -h pour help"
	;;

				
	esac

		






}
main $1
