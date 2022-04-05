within AES.Functions;

function sod "second of day (0-86399)"
  extends Modelica.Icons.Function;
  input Real t;
  input Real hour_start=0;
  input Real min_start=0;
  input Real sec_start=0;
  output Real y;
algorithm
  y := mod(t+3600*hour_start+60*min_start+sec_start,86400);
end sod;