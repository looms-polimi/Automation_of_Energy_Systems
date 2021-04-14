within AES.ProcessComponents.Thermal.HVAC;

model ControlledAHU
  extends ProcessComponents.Thermal.Interfaces.PartialTwoPorts_waxa;
  parameter SI.Temperature Tstart = 273.15 + 20 "initial T";
  parameter Real phistart = 0.5 "initial phi";
  parameter SI.Time TC = 4 "T control TC";
  parameter Real eta = 0.5 "efficiency";
  Media.Substances.MoistAir airin;
  Media.Substances.MoistAir air;
  SI.Temperature T(start = Tstart) "controlled T";
  Real phi(start = phistart);
  SI.Power Qbal, Qcons_est;
  Modelica.Blocks.Interfaces.BooleanInput ON annotation(
    Placement(visible = true,transformation(extent = {{-110, 48}, {-70, 88}}, rotation = 0), iconTransformation(extent = {{-100, -80}, {-80, -60}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Tsp annotation(
    Placement(visible = true,transformation(extent = {{-110, 10}, {-70, 50}}, rotation = 0), iconTransformation(extent = {{-100, 70}, {-80, 90}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput phisp annotation(
    Placement(visible = true,transformation(extent = {{-108, -62}, {-68, -22}}, rotation = 0), iconTransformation(extent = {{-100, 44}, {-80, 64}}, rotation = 0)));
equation
  assert(air_flange1.wa >= 0, "No flow reversal here");
  pa1 = pa2;
  wa1 + wa2 = 0;
  airin.p = air_flange1.pa;
  airin.h = inStream(air_flange1.ha);
  airin.X = inStream(air_flange1.xa);
  T + TC * der(T) = if ON then Tsp else airin.T;
  phi + TC * der(phi) = if ON then phisp else airin.phi;
  air.p = airin.p;
  air.phi = phi;
  air.T = T;
  haout1 = air.h;
  haout2 = air.h;
  xaout1 = air.X;
  xaout2 = air.X;
// Algebraic balance for Qbal, sign convention s.t. + is heating
  Qbal = air_flange1.wa * (air.h - airin.h);
  Qcons_est = abs(Qbal) / eta;
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(origin = {1.42109e-14, -26.5823},lineColor = {32, 74, 135}, fillColor = {114, 159, 207}, fillPattern = FillPattern.VerticalCylinder, extent = {{-80, 126.582}, {80, -73.4177}}), Text(origin = {-10.1951, 27.15},lineColor = {252, 233, 79}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{-51.8049, 72.85}, {66.1951, -21.15}}, textString = "AHU")}));
end ControlledAHU;