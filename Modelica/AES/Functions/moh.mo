within AES.Functions;

function moh "minute of hour (0-59)"
  extends Modelica.Icons.Function;
  input Real t;
  input Real hour_start=0;
  input Real min_start=0;
  input Real sec_start=0;
  output Real y;
protected
  Real s,h;
algorithm
  s := Functions.sod(t,hour_start,min_start,sec_start);
  h := Functions.hod(t,hour_start,min_start,sec_start);
  y := 1.0*(floor((s-3600*h)/60));
end moh;