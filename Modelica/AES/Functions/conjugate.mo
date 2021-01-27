within AES.Functions;

function conjugate
  extends Modelica.Icons.Function;
  input Complex u;
  output Complex y;
algorithm
  y.re := u.re;
  y.im := -u.im;
end conjugate;
