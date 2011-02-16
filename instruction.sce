scenario = "instruction for ball movement judgment";
no_logfile = true;

scenario_type = trials;

active_buttons = 1;
button_codes = 99;

screen_width = 1024;
screen_height = 768;
screen_bit_depth = 16;
default_font_size = 18;

begin;

picture {} default;

bitmap { filename = "ball1wob.bmp"; } ball1;
bitmap { filename = "ball2wob.bmp"; } ball2;
bitmap { filename = "corr_wob.bmp"; width = 80; height = 80; } correct;
bitmap { filename = "err_wob.bmp"; width = 80; height = 80; } error;
bitmap { filename = "miss_wob.bmp"; width = 80; height = 80; } miss;

box { height = 500; width = 7; color = 200,200,200; } wall;

text { caption = "Welche Kugel?"; } question;
text { caption = "jetzt antworten..."; font_color = 200,200,0; font_size = 16; } comment1;
text { caption = "linke Taste"; font_color = 200,200,0; font_size = 16; } comment2;
text { caption = "Kugel 1 ist Gewinner - linke Taste war richtig"; font_color = 200,200,0; font_size = 16;} comment3;
text { caption = "RICHTIG"; font_size = 20; } feed_txt;

picture {
  box { height = 15; width = 3; color = 180,180,180; };
  x = 0; y = 0;
  box { height = 3; width = 15; color = 180,180,180; };
  x = 0; y = 0;
} fixcross;

trial {
  trial_type = first_response;
  trial_duration = forever;
  picture {
    text { caption = "I N S T R U K T I O N\n\nSie sehen ausschnittsweise die Flugbahnen zweier Kugeln.\n\nBitte schätzen Sie ab,\nwelche der Kugeln zuerst die Wand durchquert.\n\nlinke Taste = Kugel 1                rechte Taste = Kugel 2\n(obere Bahn)                               (untere Bahn)\n\n\nBitte antworten Sie erst, wenn Sie dazu aufgefordert werden (\"Welche Kugel?\").\n\nSie bekommen eine Rückmeldung, ob Sie richtig geantwortet haben:\n\n       richtig                      falsch              keine Antwort\n\n\n\n\nALLE RÜCKMELDUNGEN ENTSPRECHEN DER WAHRHEIT\n(auch wenn sie bei schwierigen Durchgängen manchmal unglaubwürdig erscheinen mögen)\n\nWeiter zur Demonstration mit SPACE..."; };
    x = 0; y = 0;
    bitmap correct;
    x = -200; y = -150;
    bitmap error;
    x = 0; y = -150;
    bitmap miss;
    x = 200; y = -150;
    bitmap ball1;
    x = -173; y = 63;
    bitmap ball2;
    x = 210; y = 63;
  };
  time = 0;
};

trial { picture fixcross; time = 0; duration = 2000; };

LOOP $i 100;
  trial {
    picture {
      bitmap ball1;
      x = '-300 + ($i * 1.5)'; y = 100;
      bitmap ball2;
      x = '-200 + $i'; y = -100;
      box wall;
      x = 500; y = 0;
    };
    deltat = 1;
    duration = next_picture;  # one frame
  };
ENDLOOP;

trial {
  picture {
    text question;
    x = 0; y = 0;
    text comment1;
    x = 0; y = -200;
  };
  time = 0;
  duration = 1000;

  picture {
    text question;
    x = 0; y = 0;
    text comment2;
    x = 0; y = -200;
  };
  deltat = 1000;
  duration = 1000;

  picture {
    bitmap correct;
    x = 0; y = 0;
    text comment3;
    x = 0; y = -200;
  };
  deltat = 2500;
  duration = 3000;
};

trial {
  trial_type = first_response;
  trial_duration = forever;

  picture {
    text { caption = "Alles klar?\nBei Fragen wenden Sie sich bitte\nan den Versuchsleiter.\n\nWeiter mit SPACE..."; };
    x = 0; y = 0;
  };
  time = 0;
};

LOOP $i 510;
  trial {
    picture {
      text { caption = "Viel Spaß!"; font_color = 'abs(255-$i)','int($i/2)',0; };
      x = 0; y = 0;
      bitmap ball1;
      x = '200 * cos($i/100)'; y = '200 * sin($i/100)';
      bitmap ball2;
      x = '200  * cos($i/100)'; y = '200 * sin($i/100)';
      bitmap ball1;
      x = '200 * cos(($i-78)/100)'; y = '200 * sin(($i-78)/100)';
      bitmap ball2;
      x = '200 * cos(($i-157)/100)'; y = '200 * sin(($i-157)/100)';
      bitmap ball1;
      x = '200 * cos(($i-236)/100)'; y = '200 * sin(($i-236)/100)';
      bitmap ball2;
      x = '200 * cos(($i-314)/100)'; y = '200 * sin(($i-314)/100)';
      bitmap ball1;
      x = '200 * cos(($i-392)/100)'; y = '200 * sin(($i-392)/100)';
      bitmap ball2;
      x = '200 * cos(($i-471)/100)'; y = '200 * sin(($i-471)/100)';
      bitmap ball1;
      x = '200 * cos(($i-549)/100)'; y = '200 * sin(($i-549)/100)';
      bitmap correct;
      x = '300 * sin($i/100)'; y = '300 * cos($i/100)';
      bitmap error;
      x = '300 * sin(($i-419)/100)'; y = '300 * cos(($i-419)/100)';
      bitmap miss;
      x = '300 * sin(($i-209)/100)'; y = '300 * cos(($i-209)/100)';
    };
    deltat = 1;
    duration = next_picture;  # one frame
  };
ENDLOOP;
