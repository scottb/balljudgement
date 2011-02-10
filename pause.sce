# movement judgment task with external feedback
# author:	Markus Ullsperger 
# last modification: 08/21/2001

# VERSION:  simple verbal feedback

# instruction part... 

##################### HEADER #############################

scenario = "instruction for ball movement judgment without feedback";
no_logfile = true;  # false;

scenario_type = trials; 
### buttons
active_buttons = 1;
button_codes = 99;		# 99 = key for start/continuation (e.g., SPACE)

### screen
screen_width = 1024;			# screen requirements (if screen has lower resolution, change parameters in feedb2.pcl!!! 
screen_height = 768;
screen_bit_depth = 16;
default_font_size = 20;

begin;

###################### BODY of SCENARIO ###################

# definition of pictures and texts #
picture {} default;

bitmap { filename = "ball1wob.bmp"; } ball1;
bitmap { filename = "ball2wob.bmp"; } ball2;
bitmap { filename = "corr_wob.bmp"; width = 80; height = 80;} correct;
bitmap { filename = "err_wob.bmp"; width = 80; height = 80;} error;
bitmap { filename = "miss_wob.bmp"; width = 80; height = 80;} miss;
bitmap { filename = "nf_wob.bmp"; width = 80; height = 80;} nf;


# trial definitions #


trial {
	trial_type = first_response;
	trial_duration = forever;

	picture {
		text {
			caption = "Kurze Pause...

           
     
                
                
     
           
           
           
Danach folgt der letzte Block -
Instruktion und Verlauf wie eben. 




Weiter mit Leertaste..."; 
		};
		x = 0; y = 0;
		bitmap correct;
		x = 0; y = 130;
	};
	time = 0;
};
