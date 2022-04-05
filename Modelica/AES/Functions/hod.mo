within AES.Functions;

function hod "hour of day (0-23)"
  extends Modelica.Icons.Function;
  input Real t;
  input Real hour_start=0;
  input Real min_start=0;
  input Real sec_start=0;
  output Real y;
algorithm
  y := 1.0*(floor(Functions.sod(t,hour_start,min_start,sec_start)/3600));
end hod;