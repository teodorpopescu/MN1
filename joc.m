function [] = joc()
  % afisaza gui-ul
  tictactoe_gui;
  % Obs: gui-ul va fi responsabil de intreaga evolutie a partidelor,
  % folosind functii de callback, msgbox-uri de I/O si apeluri catre functia
  % tictactoe_ai. Nu va exista un alt thread de executie in afara de gui.
  % (si nici nu stiu cum sau daca se pot face mai multe fire de executie in
  % octave, unul pentru gui si unul pentru ai-ul si engine-ul jocului.
end