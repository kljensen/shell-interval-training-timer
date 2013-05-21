#!/usr/bin/env bash
#
# workout.sh - An audio timer for interval workouts on the mac
#
# Usage:
#
#    # Do the default workout
#    ./workout.sh
#
#
#    # Supply a file with your own exercises, 1 per line
#    ./workout.sh my-exercises.txt
#
#
#    # Supply a file with your own exercises, 1 per line
#    # and do each for 45 seconds, resting for 20
#    ./workout.sh my-exercises.txt 45 20
#

# Custom die function.
#
die() { echo >&2 -e "\nERROR: $@\n"; exit 1; }


# The default exercises
#
EXERCISES=(
	"jumping jacks"
	"wall sit"
	"push ups"
	"abdominal crunch"
	"chair step-up"
	"squats"
	"triceps dip on chair"
	"plank on floor"
	"high knee running"
	"lunge"
	"push-ups with rotating arms"
	"side plank"
)

# Default interval for exercises
exercise_interval=30

# Default interval for resting
rest_interval=10


# Parse user options
#
while getopts ":i:t:r:" opt; do
  case $opt in

	# Read in a user-supplied file with exercises.
    i)
		if [[ -r $OPTARG ]]; then
			# Need to swap out IFS in case there are spaces
			# in the exercise names.
			OLD_IFS=$IFS
			IFS=$'\n'
			EXERCISES=( $(cat "$OPTARG") )
			IFS=$OLD_IFS
		else
			die "$OPTARG is not a valid input file"
		fi
		;;

    # Set user-supplied exercise interval
    t)
		if [[ "$OPTARG" =~ ^[0-9]+$ ]] ; then
			exercise_interval=${OPTARG}		
		else
			die "Invalid parameter for exercise interval: ${OPTARG}. It should be an integer."
		fi
    	;;

    # Set user-supplied rest interval
    r)
		if [[ "$OPTARG" =~ ^[0-9]+$ ]] ; then
			rest_interval=${OPTARG}		
		else
			die "Invalid parameter for exercise interval: ${OPTARG}. It should be an integer."
		fi
    	;;

    \?)
		echo "Invalid option: -$OPTARG" >&2
		exit 1
		;;
    :)
		echo "Option -$OPTARG requires an argument." >&2
		exit 1
		;;
  esac
done


# Loop through the exercises, announcing them one-by-one.
#
NUM_EXERCISES=${#EXERCISES[@]}
for (( i = 0; i < ${NUM_EXERCISES}; i++ )); do

	exercise=${EXERCISES[$i]}
	if [[ $i == 0 ]]; then
		say "Ready? We're going to do ${NUM_EXERCISES} different 
		exercises for $exercise_interval seconds each, starting 
		with $exercise in 5 seconds."
		sleep 5
	else
		say "Stop.  Rest $rest_interval seconds.  Next, you will do $exercise."
		sleep $rest_interval
	fi

	# Do the excersize
	#
	say "Ok, $exercise for $exercise_interval seconds, Go!"
	sleep $exercise_interval

done
say "Done!"


