function x = morse_encode(c)
  %----Construire arbore----%
  m = morse();
  c = toupper(c); % case insensitive
  
  %----Parcurgere arbore----%
  x = morse_find(c, m); % cautam in tot arborele, recursiv
end