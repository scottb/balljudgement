scenario = "instruction for ball movement judgment without feedback";
no_logfile = true;

scenario_type = trials;

active_buttons = 1;
button_codes = 99;

screen_width = 1024;
screen_height = 768;
screen_bit_depth = 16;
default_font_size = 20;

begin;

picture {} default;

trial {
  trial_type = first_response;
  trial_duration = forever;
  picture {
    text { caption = "Kurze Pause...\n\n\n\n\n\n\n\n\n\nDanach folgt der letzte Block -\nInstruktion und Verlauf wie eben.\n\n\n\n\nWeiter mit Leertaste..."; };
    x = 0; y = 0;
    bitmap { filename = "corr_wob.bmp"; width = 80; height = 80; };
    x = 0; y = 130;
  };
  time = 0;
};
