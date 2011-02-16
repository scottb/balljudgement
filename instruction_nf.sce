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
    text { caption = "I N S T R U K T I O N\n\nIn den nächsten zwei Blöcken bearbeiten Sie wieder dieselbe Aufgabe.\n\nBitte antworten Sie erst, wenn Sie dazu aufgefordert werden.\n\nAuch diesmal bekommen Sie wieder die Rückmeldungen wie im vorherigen Block,\n\naber gelegentlich kommt eine weitere Rückmeldung,\n\ndie nichts darüber aussagt, ob Sie richtig oder falsch gedrückt haben:\n\n\n\n\n\n\nWeiter mit Leertaste..."; };
    x = 0; y = 0;
    bitmap { filename = "nf_wob.bmp"; width = 80; height = 80; };
    x = 0; y = -150;
  };
  time = 0;
};
