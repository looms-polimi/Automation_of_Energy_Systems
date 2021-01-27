within AES.Functions;

function magnitude
  extends Modelica.Icons.Function;
  input Complex u;
  output Real y;
algorithm
  y := sqrt(u.re^2+u.im^2);
end magnitude;
