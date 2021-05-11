within AES.ProcessComponents.Thermal.HVAC;

model ControlledAHU
  extends ProcessComponents.Thermal.Interfaces.PartialTwoPorts_waxa;
  parameter SI.Temperature Tstart = 273.15 + 20 "initial T";
  parameter Real phistart = 0.5 "initial phi";
  parameter SI.Time TCT = 10 "T control TC";
  parameter SI.Time TCphi = 15 "T control TC";
  parameter Real eta = 0.5 "efficiency";
  Media.Substances.MoistAir airin;
  Media.Substances.MoistAir air;
  SI.Temperature T(start = Tstart) "controlled T";
  Real phi(start = phistart);
  SI.Power Qbal, Qcons_est;
  Modelica.Blocks.Interfaces.BooleanInput ON annotation(
    Placement(visible = true,transformation(extent = {{-110, 48}, {-70, 88}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Tsp annotation(
    Placement(visible = true,transformation(extent = {{-110, 10}, {-70, 50}}, rotation = 0), iconTransformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput phisp annotation(
    Placement(visible = true,transformation(extent = {{-108, -62}, {-68, -22}}, rotation = 0), iconTransformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  assert(air_flange1.wa >= 0, "No flow reversal here");
  pa1 = pa2;
  wa1 + wa2 = 0;
  airin.p = air_flange1.pa;
  airin.h = inStream(air_flange1.ha);
  airin.X = inStream(air_flange1.xa);
  T + TCT * der(T) = if ON then Tsp else airin.T;
  phi + TCphi * der(phi) = if ON then phisp else airin.phi;
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
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(origin = {0, 12.6582},lineColor = {32, 74, 135}, fillColor = {114, 159, 207}, fillPattern = FillPattern.VerticalCylinder, extent = {{-100, 87.3415}, {100, -50.6582}}), Rectangle(origin = {0, -78.51}, fillColor = {186, 189, 182}, fillPattern = FillPattern.VerticalCylinder, extent = {{-100, 40.51}, {100, -23.49}}), Text(origin = {-9.1707, 3.85}, lineColor = {252, 233, 79}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{-58.8293, 82.15}, {75.1707, -23.85}}, textString = "AHU"), Text(origin = {0, -70}, lineColor = {255, 255, 85}, extent = {{-100, 32}, {100, -32}}, textString = "%name")}));
end ControlledAHU;