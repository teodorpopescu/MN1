function m = morse()
  %-----Ultimul nivel------%
  H = {'H' {} {}};
  V = {'V' {} {}};
  F = {'F' {} {}};
  L = {'L' {} {}};
  P = {'P' {} {}};
  J = {'J' {} {}};
  B = {'B' {} {}};
  X = {'X' {} {}};
  C = {'C' {} {}};
  Y = {'Y' {} {}};
  Z = {'Z' {} {}};
  Q = {'Q' {} {}};
  
  %----Penultimul nivel----%
  S = {'S' H V};
  U = {'U' F {}};
  R = {'R' L {}};
  W = {'W' P J};
  D = {'D' B X};
  K = {'K' C Y};
  G = {'G' Z Q};
  O = {'O' {} {}};
  
  %----Al treilea nivel----%
  I = {'I' S U};
  A = {'A' R W};
  N = {'N' D K};
  M = {'M' G O};
  
  %----Al doilea nivel-----%
  E = {'E' I A};
  T = {'T' N M};
  
  %--------Radacina--------%
  m = {'' E T};
end