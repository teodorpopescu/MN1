%-- Returneaza cea mai buna mutare pentru configuratia m daca ai-ul muta cu--%
%-- x (-1 pentru 'O' si 1 pentru 'X') --%
function move = tictactoe_ai(m, x)

  % se numara casutele goale
  n_empty = 0;
  for p = 1:3
    for q = 1:3
      if m(p, q) == 0
        ++n_empty;
      end
    end
  end
  % daca tabla este goala punem in centru, fara a face alte calcule
  if n_empty == 9
    move = [2, 2];
    return
  % daca s-a facut o singura mutare punem fie in entru fie in colt
  elseif n_empty == 8
    if m(2, 2) == 0
      move = [2, 2];
    else
      move = [1, 1];
    end      
    return
  end
  %    Obs: Acest approach euristic pentru a reduce ovehead-ul destul de mare
  % la apelul tictactoe_make_decision penru o tabla goala cred ca este ideal
  %    In orice caz, din configuratiile obtinute nu se poate pierde daca jucatorii
  % continua sa joace ideal.
  
  % daca tabla nu este intr-o configuratie triviala, 
  % ne folosim de backtracking pentru a afla cea mai buna mutare
  [move_x, move_y, winner] = tictactoe_make_decision(m, x);
  move = [move_x, move_y];
end