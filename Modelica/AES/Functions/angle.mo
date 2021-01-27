within AES.Functions;

function angle
  extends Modelica.Icons.Function;
  input Complex u;
  output Real y;
algorithm
  y := atan2(u.im,u.re);
end angle;
