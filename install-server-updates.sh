#!/bin/bash

case "$1" in
	central)
		echo "APT software update and upgrade for IBES Central."
		read -n1 -r -p "Press any key to continue..."
		ssh -t soni@central.theestimatoronline.com "sudo apt-get update && sudo apt-get -y upgrade"
		;;

	jkt)
		echo "APT software update and upgrade for IBES Jakarta."
                read -n1 -r -p "Press any key to continue..."
		ssh -t soni@jkt.theestimatoronline.com -p 2222 "sudo apt-get update && sudo apt-get -y upgrade"
		;;

	tau)
		echo "APT software update and upgrade for IBES Tauranga."
                read -n1 -r -p "Press any key to continue..."
		ssh -t soni@tau.theestimatoronline.com "sudo apt-get update && sudo apt-get -y upgrade"
		;;

	solo)
		echo "APT software update and upgrade for IBES Solo."
                read -n1 -r -p "Press any key to continue..."
		ssh -t soni@solo.theestimatoronline.com -p 2222 "sudo apt-get update && sudo apt-get -y upgrade"
		;;

	free)
		echo "APT software update and upgrade for IBES Freelance."
                read -n1 -r -p "Press any key to continue..."
		ssh -t soni@jkt2.theestimatoronline.com "sudo apt-get update && sudo apt-get -y upgrade"
		;;

	

	all)
		echo "APT software update and upgrade for all IBES servers."
                read -n1 -r -p "Press any key to continue..."
		ssh -t soni@central.theestimatoronline.com "sudo apt-get update && sudo apt-get -y upgrade"
		ssh -t soni@jkt.theestimatoronline.com -p 2222 "sudo apt-get update && sudo apt-get -y upgrade"
		ssh -t soni@tau.theestimatoronline.com "sudo apt-get update && sudo apt-get -y upgrade"
		ssh -t soni@solo.theestimatoronline.com -p 2222 "sudo apt-get update && sudo apt-get -y upgrade"
		ssh -t soni@jkt2.theestimatoronline.com "sudo apt-get update && sudo apt-get -y upgrade"
		;;
	
	*)
		echo $"Usage: $0 {start|stop|restart|condrestart|status}"
		exit 1

esac
