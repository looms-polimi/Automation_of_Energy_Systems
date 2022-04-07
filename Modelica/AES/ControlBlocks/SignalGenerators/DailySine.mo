within AES.ControlBlocks.SignalGenerators;

model DailySine
  parameter Real ymax = 1;
  parameter Real ymin = 0;
  parameter Real hmax = 12 "hour of ymax";
  parameter Real mmax = 0 "minute of ymax";
  parameter Real smax = 0 "second of ymax";
  parameter Real hs = 8 "simulation start hour";
  parameter Real ms = 0 "simulation start minute";
  parameter Real ss = 0 "simulation start second";
  Real day_s;
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(visible = true, transformation(origin = {28, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {119, 1}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
protected
  parameter Real phase =  (3600*hmax+60*mmax+smax)/86400
                         *2*Modelica.Constants.pi;
equation
  day_s = time+3600*hs+60*ms+ss;
  y     =  (ymax+ymin)/2+(ymax-ymin)/2
          *cos(2*Modelica.Constants.pi/86400*day_s-phase);
end DailySine;