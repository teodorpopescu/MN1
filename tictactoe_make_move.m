%-- Functie callback ce este apelata la apasarea unei zone din tabla de joc --%
function tictactoe_make_move
 
  % obtine informatii de la gui
  H = guidata(gcf);
  pushed_button = gcbo;

  % actualizeaza gui-ul si se formeaza o matrice auxiliara a configuratiei
  m = zeros(3);
  for i = 1:3
    for j = 1:3
      if H.buttons(i, j) == pushed_button
        if strcmp(get(H.buttons(i, j), "string"), "") == 0;
          return
        end 
        set(H.buttons(i, j), "string", get(H.x, "string"));
      end
      if strcmp(get(H.buttons(i, j), "string"), "X") == 1
        m(i, j) = 1;
      elseif strcmp(get(H.buttons(i, j), "string"), "O") == 1
        m(i, j) = -1;
      end
    end
  end
  
  % verificam daca jucatorul a facut o mutare castigatoare (imposibil, oricum)
  x = tictactoe_is_won(m);
  if x != 0
    msgbox("Felicitari, ati castigat!", "Meciul s-a terminat");
    % se ajusteaza scorul
    set(H.text_you_score, "string",
      num2str(str2num(get(H.text_you_score, "string")) + 1));
    % se curata tabla de joc
    for i = 1:3
      for j = 1:3
        set(H.buttons(i, j), "string", "");
      end
    end
    % quest pentru noua partida
    a = H.quest = questdlg ("Alege simbolul", "X sau 0", "X", "O", "X");
    if strcmp(a, "O") == 1
      set(H.x, "string", "O");
      set(H.buttons(2, 2), "string", "X");
    else
      set(H.x, "string", "X");
    end
    return
  end
  
  % verificam daca s-a terminat egal
  n_empty = 0;
  for i = 1:3
    for j = 1:3
      if m(i, j) == 0;
        ++n_empty;
      end
    end
  end
  if n_empty == 0
    msgbox("Meciul este egal!", "Meciul s-a terminat");
    for i = 1:3
      for j = 1:3
        set(H.buttons(i, j), "string", "");
      end
    end
    a = H.quest = questdlg ("Alege simbolul", "X sau 0", "X", "O", "X");
    if strcmp(a, "O") == 1
      set(H.x, "string", "O");
      set(H.buttons(2, 2), "string", "X");
    else
      set(H.x, "string", "X");
    end
    return
  end
  
  % mutarea calculatorului
  v = [0 0];
  if strcmp(get(H.x, "string"), "X") == 1
    v = tictactoe_ai(m, -1);
    m(v(1), v(2)) = -1;
    set(H.buttons(v(1), v(2)), "string", "O");
  else
    v = tictactoe_ai(m, 1);
    m(v(1), v(2)) = 1;
    set(H.buttons(v(1), v(2)), "string", "X");
  end;
  
  % verificam daca a castigat calculatorul
  x = tictactoe_is_won(m);
  if x != 0
    msgbox("Din pacate ati pierdut!", "Meciul s-a terminat");
    set(H.text_cpu_score, "string",
      num2str(str2num(get(H.text_cpu_score, "string")) + 1));
    for i = 1:3
      for j = 1:3
        set(H.buttons(i, j), "string", "");
      end
    end
    a = H.quest = questdlg ("Alege simbolul", "X sau 0", "X", "O", "X");
    if strcmp(a, "O") == 1
      set(H.x, "string", "O");
      set(H.buttons(2, 2), "string", "X");
    else
      set(H.x, "string", "X");
    end
    
  % verificama daca s-a termiant egal
  elseif n_empty == 1
    msgbox("Meciul este egal!", "Meciul s-a terminat");
    for i = 1:3
      for j = 1:3
        set(H.buttons(i, j), "string", "");
      end
    end
    a = H.quest = questdlg ("Alege simbolul", "X sau 0", "X", "O", "X");
    if strcmp(a, "O") == 1
      set(H.x, "string", "O");
      set(H.buttons(2, 2), "string", "X");
    else
      set(H.x, "string", "X");
    end
  end
end