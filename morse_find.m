%-- Cauta recursiv caracterul in arborele morse --%
function x = morse_find(c, m)
  if length(m) == 0 % daca s-a ajuns la sfarsitul ramurii
    x = '*'; % se marcheaza ca nu a fost gasit caracterul
  elseif m{1} == c % daca caracterul se afla in nodul curent
    x = ''; % cautarea s-a terminat
  else % cazul recursiv
    a = morse_find(c, m{2}); % se cauta in ramura stanga
    if a == '*' % daca nu s-a gasit in ramura stanga
      a = morse_find(c, m{3}); % se cauta in ramura dreapta
      if a == '*' % daca caracterul nu a fost gasit
        x = '*';
      else % am gasit caracterul pe ramura dreapta
       x = strcat('-', a);
      end
    else % am gasit caracterul pe ramura stanga
      x = strcat('.', a);
    end
  end
end