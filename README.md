Shell interval training timer
=============================


A [small shell script](https://github.com/kljensen/shell-interval-training-timer/blob/master/workout.sh) for doing [interval training](http://en.wikipedia.org/wiki/Interval_training)
(or circuit training) coveniently from your desk.  The script will make your computer call out the exercises you need to do, when you need to do them.  I was inspired to write this quick script after
reading the
[NY Times "The Scientific 7-Minute Workout"](http://well.blogs.nytimes.com/2013/05/09/the-scientific-7-minute-workout/)
article covering the
[HICT research by Kilka & Jordan](http://journals.lww.com/acsm-healthfitness/Fulltext/2013/05000/HIGH_INTENSITY_CIRCUIT_TRAINING_USING_BODY_WEIGHT_.5.aspx).
The workout from that manuscript is the default for this script.  

![Calvin Coolidge getting fit](http://files.kyle-jensen.com.s3.amazonaws.com/shared/coolidge.jpg "Calvin Coolidge getting fit")


### How it works

The shell script loops through a list of exercises (potentially user-supplied)
and announces each one verbally
(literaly, over your speakers)
using the [`say` command](http://www.unix.com/man-page/osx/1/SAY/).
The script sleeps between exercises using the
[`sleep` command](http://www.unix.com/man-page/osx/1/sleep/).  This basically sounds like

> **Ready? We're going to do 10 exercises for 30s each, starting with  'push ups'.**

> [a moment passes]

> **Ok, 'push ups' for 30 seconds, Go!**

> [30s passes]

> **Stop, Rest 10 seconds.  Next, you will do 'sit-ups'**

> [10s passes and the process repeats itself]

So, the computer is leading you through the exercises in a manner that

* keeps track of time for you;
* does not require looking at the computer;
* alerts you to the upcoming exercise so that you can get ready; and,
* allows you to play music in the background.


### Installation

The easiest way to install the script is to clone the repo on GitHub:

	git clone https://github.com/kljensen/shell-interval-training-timer

Or you can just grab the shell script

	curl -O https://raw.github.com/kljensen/shell-interval-training-timer/master/workout.sh
	

### Usage

First, you probably want to make the script executable

	chmod a+x ./workout.sh

Do the default workout

	./workout.sh

Or, you can supply a file with your own exercises, 1 per line

	./workout.sh -i my-exercises.txt

Finally, here's how you would supply a file with your own exercises,
1 per line and do each for 45 seconds, resting for 20.

	./workout.sh -i my-exercises.txt -t 45 -r 20

### Caveats

This has only been tested on Mac OSX.
