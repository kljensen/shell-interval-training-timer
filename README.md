Shell interval training timer
=============================

A small shell script for doing [interval training](http://en.wikipedia.org/wiki/Interval_training)
(or circuit training) coveniently from your desk.  I was inspired to write this quick script after
reading the
[NY Times "The Scientific 7-Minute Workout"](http://well.blogs.nytimes.com/2013/05/09/the-scientific-7-minute-workout/)
article covering the
[HICT research by Kilka & Jordan](http://journals.lww.com/acsm-healthfitness/Fulltext/2013/05000/HIGH_INTENSITY_CIRCUIT_TRAINING_USING_BODY_WEIGHT_.5.aspx).
The workout from that manuscript is the default for this script.  

### How it works

The shell script loops through list of exercises (potentially user-supplied)
and announces each one verbally
(literaly, over your speakers)
using the [`say` command](http://www.unix.com/man-page/osx/1/SAY/).
The script sleeps between exercises using the
[`sleep` command](http://www.unix.com/man-page/osx/1/sleep/).  It has only been tested on Mac OSX.

### Usage

First, you probably want to make the script executable

	chmod a+x ./workout.sh

Do the default workout

	./workout.sh

Or, you can supply a file with your own exercises, 1 per line

	./workout.sh my-exercises.txt

Finally, here's how you would supply a file with your own exercises,
1 per line and do each for 45 seconds, resting for 20.

	./workout.sh my-exercises.txt 45 20