# the task is to watch the movement of two balls and to judge which ball will arrive at the wall first
# one session comprises 2 runs of n_max1 and n_max2 trials, resp.
# in run 1 (adjustment phase) the program individually adjusts the difficulty of the task such that error rates will be around 30-40%
# in run 2 (stabilization phase) difficulty will be kept such that error rates stay around 30-40%

#  trigger definition

#  200 .. start of block
#  201 .. end of block

#  100 .. warning (wall)
#  101 .. begin of ball movement
#  102 .. question (which ball)
#  103 .. certainty judgment question (only in later versions!)

#  responses:
#  1,2 .. response buttons
#  9   .. space

#  feedback:
#  111 .. correct
#  112 .. error
#  110 .. no response
#  121 .. correct - no feedback
#  122 .. error - no feedback
#  255 .. mr-trigger

scenario = "feedback on ball movement judgment";
no_logfile = false;
pcl_file = "stabilization_phase.pcl";

### fmri settings
scenario_type = fMRI_emulation;		# change for real fMRI experiment!
scan_period = 1000;			# TR in ms
pulses_per_scan = 1;
sequence_interrupt = false;		# a sequence of events with a given mri_pulse number can be
					# interrupted by the occurance of a later main pulse with an
					# associated event sequence if the previous event sequence
					# has not completed.
pulse_code = 255;

### buttons
active_buttons = 3;
button_codes = 1, 2, 9;		# 9; 99 = key for start/continuation (e.g., SPACE)
### screen
screen_width = 1024;			# screen requirements (if screen has lower resolution, change parameters in feedb2.pcl!!!
screen_height = 768;
screen_bit_depth = 16;
default_font_size = 20;

begin;

picture {} default;

bitmap { filename = "ball1wob.bmp"; } ball1;
bitmap { filename = "ball2wob.bmp"; } ball2;
bitmap { filename = "corr_wob.bmp"; width = 80; height = 80; } correct;
bitmap { filename = "err_wob.bmp"; width = 80; height = 80; } error;
bitmap { filename = "miss_wob.bmp"; width = 80; height = 80; } miss;
bitmap { filename = "nf_wob.bmp"; width = 80; height = 80; } nf;

box { height = 500; width = 7; color = 200,200,200; } wall;
text { caption = "Welche Kugel?"; } question;

picture {
  box { height = 15; width = 3; color = 180,180,180; };
  x = 0; y = 0;
  box { height = 3; width = 15; color = 180,180,180; };
  x = 0; y = 0;
} fixcross;

picture {
  text { caption = "gleich geht's los..."; };
  x = 0; y = 0;
} los;

trial {
  picture los;
  time = 0;
  duration = next_picture;
  code = "wait_for_start_trigger";
} intro2;

trial {
  stimulus_event {
    picture fixcross;
    deltat = 1;
    duration = next_picture;
    code = "fix";
  } fix;
} fixation;

trial {
  picture {
    box wall;
    x = 400; y = 0;
  } warn;
  deltat = 1;
  duration = 300;
} warning;

trial {
  trial_duration = stimuli_length;
  trial_type = fixed;
  stimulus_event {
    picture {
      bitmap ball1;
      x = 0; y = 100;
      bitmap ball2;
      x = 0; y = -100;
      box wall;
      x = 400; y = 0;
    } ball;
    deltat = 1;
    duration = next_picture;
    code = "ball";
  } one_step;
} ball_mv;

trial {
  trial_duration = stimuli_length;
  trial_type = first_response;
  stimulus_event {
    picture {
      text question;
      x = 0; y = 0;
    };
    deltat = 1;
    duration = 1500;
    target_button = 1;
    code = "question";
  } resp;
} ask;

trial {
  trial_duration = stimuli_length;
  trial_type = fixed;
  stimulus_event {
    picture {
      bitmap correct;
      x = 0; y = 0;
    } symbol;
    deltat = 750;
    duration = 1000;
    code = "feedbk";
  } feed_event;
} feedbk;

trial {
  trial_duration = forever;
  trial_type = correct_response;
  picture {
    text { caption = "Pause\n\n..."; };
    x=0; y=0;
  };
  deltat = 1;
  target_button = 3;  # allow experimenter only to continue
  code = "pause";
} pause;

trial {
  trial_duration = forever;
  trial_type = correct_response;
  picture {
    text { caption = "Ende des Blocks\n\nWarte auf Leertaste..."; };
    x=0; y=0;
  };
  deltat = 1;
  target_button = 3;  # allow experimenter only to continue
} ende;

trial {
  stimulus_event {
    nothing {};
    time = 0;
    code = "t_diff";
      # log parameters:
      # 1. t_diff
      # 2. v[1st ball];v[2nd ball]
      # 3. p[1st ball];p[2nd ball]
      # 4. td_avr;errors
  } log_event;
} log_param;

trial {
  trial_duration = forever;
  trial_type = correct_response;
  picture {
    text { caption = "FEHLER beim Lesen der Parameterdatei!!\n\nEnde mit ESC"; };
    x=0; y=0;
  };
  deltat = 1;
  target_button = 3;  # allow experimenter only to continue
} fehler;
