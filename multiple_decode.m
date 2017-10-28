function x = multiple_decode(sir)
  s = strsplit(sir); % se imparte sirul dupa caractere albe
  x = ''; % initial, rezultatul este vid
  
  for i = 1:length(s) % pentru fiecare 'bucata' de cod morse
    x = strcat(x, morse_decode(s{i})); % decodificam caracterul
  end
end