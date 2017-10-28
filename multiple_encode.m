function x = multiple_encode(str)
  x = ''; % initial, rezultatul este vid
  
  for i = 1:length(str) - 1 % pentru fiecare caracter, exceptand ultimul
    x = cstrcat(x, morse_encode(str(i))); % se face decodificarea
    x = cstrcat(x, ' '); % se adauga un spatiu alb
  end
  x = cstrcat(x, morse_encode(str(length(str)))); % ultimul caracter
  % Obs: Nu s-a dorit adaugarea unui spaiu alb dupa ultimul caracter
end