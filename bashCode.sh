# the interpreter
#! /bin/bash

# puts the date and time into a variable called "now"
now=$(date +"%d/%m/%Y %H:%M")

# runs the tasks based on the selected option
function menuTasks {
	case $option in
		1)
			# prints when option 1 is selected
			# displays the details of the user
			echo	$PWD
			echo	$HOME
			echo	$USER
			echo	$HOSTNAME
			echo	${now}
			menu_Options
			;;
		2)
			# prints when option 2 is selected
			# lists 5 smallest files by increasing size from /etc 
			la -laSr /etc/*.conf | head -5
			menu_Options
			;;
		3)
			# prints when option 3 is selected
			# displays the total number of regular files
			find /home -type f -print | wc -l 
			menu_Options
			;;
		4)
			# prints when option 4 is selected
			# displays the names of only regular files in /home 
			find /home -type f -perm /u=r -perm /a=x
			menu_Options
			;;
		5)
			# prints when option 5 is selected
			# asks for a file from /tmp, prints the contents in double space
			echo	"Please enter a file from /tmp : "
			read file
			cat $file | pr -Td
			menu_Options
			;;
		6)
			# prints when option 6 is selected
			# asks user for 2 values displaying 8 randomly from it
			echo	"Input first value : "
			read firstInput
			echo	"Input second value of 50 higher than the first : "
			read secondInput
			echo
			if [[ $(expr "$secondInput" - "$firstInput") -gt 50 ]]; then
					shuf -i "$firstInput" - "$secondInput" -n 8
			else
					echo "Number out of range!"
			fi
			menu_Options
			;;
		7)
			# prints when option 7 is selected
			# displays the highest/lowest number from the users range
			if [[ $(expr "$secondInput" - "$firstInput") -gt 50 ]]; then
					readarray VALUE < <(shuf -i "$firstInput"-"$secondInput" -n 8 | sort -u)
					echo ${VALUE[0]}
					echo ${VALUE[7]}
			fi
			menu_Options
			;;
		8)
			# exits program when option 8 is selected
			# backs up /home to /tmp with tar
			echo "backing up files...please wait"
			tar czvf /tmp/username_bkp_home.tgz /home
			echo	"backing up complete...exiting program!"
			exit 1
			
esac
}

# displays the list options
function menu_Options {
	echo	
	echo	"Menu Selection : "
	echo	"1. Details of the user and the date/time"
	echo	"2. List 5 smallest files from /etc"
	echo	"3. Show total number of regular files in /home"
	echo	"4. Shows only the names of regular files in /home"
	echo	"5. Displays contents from a selected file in /tmp"
	echo	"6. Displays 8 random numbers from your input range"
	echo	"7. Displays the highest/lowest numbers from the 8 random numbers"
	echo	"8. Backup files in /home, puts the saved file in /tmp then exits program"
	echo
	
	# asks the user for their input
	echo	"Please select an option : "
	# puts the selected option into the "option" variable
	read option
	echo
	
	# displays an error message if input is incorrect
	if [[ $option -gt 8 ]]; then
			echo	"incorrect input...Try again!"
			menu_Options
	fi
	
	menuTasks
}

# runs the function
menu_Options

			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			