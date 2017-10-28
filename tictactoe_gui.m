function [] = tictactoe_gui()
  size = 150; % "constanta" in functie de care se ajustaeza dimensiunea gui
  H.buttons = zeros(3); % handlere catre casutele tabelei de joc
  H.figure = figure(
      "numbertitle", "off",
      "name", "Tic-Tac-Toe",
      "resize", "off",
      "position", [600, 200, 3 * size, 4 * size]);
  % dummy ui component ce retine cu ce joaca jucatorul
  H.x = uicontrol("parent", H.figure,
                  "style", "text",
                  "backgroundcolor", [1 1 1],
                  "foregroundcolor", [1 1 1],
                  "string", "X");
                  
  % score table
  H.text_you = uicontrol("parent", H.figure,
                         "style", "text",
                         "horizontalalignment", "center",
                         "backgroundcolor", [0, 0.5, 0],
                         "position", [0, 7/2 * size, 2/3 * size, size / 2],
                         "fontweight", "bold",
                         "fontsize", size / 6,
                         "foregroundcolor", [1, 1, 1],
                         "string", "YOU");
  H.text_you_score = uicontrol("parent", H.figure,
                         "style", "text",
                         "horizontalalignment", "right",
                         "backgroundcolor", [1, 1, 1],
                         "position", [2/3 * size, 7/2 * size, 2/3 * size, size / 2],
                         "fontweight", "bold",
                         "fontsize", size / 4,
                         "foregroundcolor", [0, 0, 0],
                         "string", "0");
  H.text_cpu = uicontrol("parent", H.figure,
                         "style", "text", 
                         "horizontalalignment", "center",
                         "backgroundcolor", [0.65, 0, 0],
                         "position", [7/3 * size, 7/2 * size, 2/3 * size, size / 2],
                         "fontweight", "bold",
                         "foregroundcolor", [1, 1, 1],
                         "fontsize", size / 6,
                         "string", "CPU");
  H.text_cpu_score = uicontrol("parent", H.figure,
                         "style", "text", 
                         "horizontalalignment", "left",
                         "backgroundcolor", [1, 1, 1],
                         "position", [5/3 * size, 7/2 * size, 2/3 * size, size / 2],
                         "fontweight", "bold",
                         "foregroundcolor", [0, 0, 0],
                         "fontsize", size / 4,
                         "string", "0");
  H.text_line= uicontrol("parent", H.figure,
                         "style", "text", 
                         "horizontalalignment", "center",
                         "backgroundcolor", [1, 1, 1],
                         "position", [4/3 * size, 7/2 * size, 1/3 * size, size / 2],
                         "fontweight", "bold",
                         "foregroundcolor", [0, 0, 0],
                         "fontsize", size / 4,
                         "string", "-");
  % plasare butoane        
  for i = 1:3
    for j = 1:3
      H.buttons(i, j) = uicontrol (
                      "parent", H.figure,
                      "string", "",
                      "position", [size*(i-1), size*(j-1/2), size, size],
                      "fontsize", size / 2,
                      "callback", @tictactoe_make_move);
    end
  end
  % primul quest dialog pentru a afla cine muta primul
  a = H.quest = questdlg ("Alege simbolul", "X sau 0", "X", "O", "X");
  if strcmp(a, "O") == 1
    set(H.x, "string", "O");
    set(H.buttons(2, 2), "string", "X");
  end
  guidata(H.figure, H);
end