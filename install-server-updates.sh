#!/bin/bash

TARGET=$1
USER=$2

case "$1" in
	central)
		echo "APT software update and upgrade for IBES Central."
		read -n1 -r -p "Press any key to continue..."
		ssh -t "$USER"@central.theestimatoronline.com "sudo apt-get update && sudo apt-get -y upgrade"
		;;
	
	jkt)
		echo "APT software update and upgrade for IBES Jakarta."
                read -n1 -r -p "Press any key to continue..."
		ssh -t "$USER"@jkt.theestimatoronline.com -p 2222 "sudo apt-get update && sudo apt-get -y upgrade"
		;;

	tau)
		echo "APT software update and upgrade for IBES Tauranga."
                read -n1 -r -p "Press any key to continue..."
		ssh -t "$USER"@tau.theestimatoronline.com "sudo apt-get update && sudo apt-get -y upgrade"
		;;

	solo)
		echo "APT software update and upgrade for IBES Solo."
                read -n1 -r -p "Press any key to continue..."
		ssh -t "$USER"@solo.theestimatoronline.com -p 2222 "sudo apt-get update && sudo apt-get -y upgrade"
		;;

	free)
		echo "APT software update and upgrade for IBES Freelance."
                read -n1 -r -p "Press any key to continue..."
		ssh -t "$USER"@jkt2.theestimatoronline.com "sudo apt-get update && sudo apt-get -y upgrade"
		;;

	aus)
		echo "APT software update and upgrade for IBES Estimateit."
		read -n1 -r -p "Press any key to continue..."
		ssh -t "$USER"@52.63.168.202 "sudo apt-get update && sudo apt-get -y upgrade"
		;;

	ibestest)
		echo "APT software update and upgrade for IBES Ibestest."
                read -n1 -r -p "Press any key to continue..."
		ssh -t "$USER"@52.77.33.109 "sudo apt-get update && sudo apt-get -y upgrade"
		;;

	monitor)
		echo "APT software update and upgrade for IBES Monitor."
                read -n1 -r -p "Press any key to continue..."
		ssh -t "$USER"@52.63.159.89 "sudo apt-get update && sudo apt-get -y upgrade"
		;;	

	all)
		echo "APT software update and upgrade for IBES Central."
                read -n1 -r -p "Press any key to continue..."
		ssh -t "$USER"@central.theestimatoronline.com "sudo apt-get update && sudo apt-get -y upgrade"
		
		echo
		echo "APT software update and upgrade for IBES Jakarta."
                read -n1 -r -p "Press any key to continue..."
		ssh -t "$USER"@jkt.theestimatoronline.com -p 2222 "sudo apt-get update && sudo apt-get -y upgrade"

		echo
		echo "APT software update and upgrade for IBES Tauranga."
                read -n1 -r -p "Press any key to continue..."
		ssh -t "$USER"@tau.theestimatoronline.com "sudo apt-get update && sudo apt-get -y upgrade"

		echo
		echo "APT software update and upgrade for IBES Solo."
                read -n1 -r -p "Press any key to continue..."
		ssh -t "$USER"@solo.theestimatoronline.com -p 2222 "sudo apt-get update && sudo apt-get -y upgrade"

		echo
		echo "APT software update and upgrade for IBES Freelance."
	        read -n1 -r -p "Press any key to continue..."
		ssh -t "$USER"@jkt2.theestimatoronline.com "sudo apt-get update && sudo apt-get -y upgrade"

		echo
		echo "APT software update and upgrade for IBES Estimateit."
                read -n1 -r -p "Press any key to continue..."
		ssh -t "$USER"@52.63.168.202 "sudo apt-get update && sudo apt-get -y upgrade"

		echo
		echo "APT software update and upgrade for IBES Ibestest."
                read -n1 -r -p "Press any key to continue..."
		ssh -t "$USER"@52.77.33.109 "sudo apt-get update && sudo apt-get -y upgrade"

		echo
		echo "APT software update and upgrade for all IBES Monitor."
                read -n1 -r -p "Press any key to continue..."
		ssh -t "$USER"@52.63.159.89 "sudo apt-get update && sudo apt-get -y upgrade"
		;;
	
	*)
		echo $"Usage: $0 [target] [username]"
		exit 1
esac
