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

# Use the default exercises or read in user specified exercises
#
if [ -z "$1" ]; then

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
else

	# Need to swap out IFS in case there are spaces
	# in the exercise names.
	OLD_IFS=$IFS
	IFS=$'\n'
	EXERCISES=( $(cat "$1") )
	IFS=$OLD_IFS
fi


# Use the default intervals or get user-specified ones
#
default_exercise_interval=30
default_rest_interval=30
if [ -z "$2" ]; then
	exercise_interval=default_exercise_interval
	rest_interval=default_rest_interval
else
	exercise_interval=$2
	if [ -z "$3" ]; then
		rest_interval=default_rest_interval
	else
		rest_interval=$3
	fi
fi


# Get ready
#
say "Ready?"
sleep 2


NUM_EXERCISES=${#EXERCISES[@]}
for (( i = 0; i < ${NUM_EXERCISES}; i++ )); do

	# Do the excersize
	#
	exercise=${EXERCISES[$i]}
	say "$exercise for $exercise_interval seconds, Go!"
	sleep 5

	# Rest or finish up
	#
	if [[ $i != $((${NUM_EXERCISES} - 1)) ]]; then
		say "Rest $rest_interval seconds"
		sleep 10
	else
		say "Done!"
	fi
done