within AES.ProcessComponents.Thermal.Air;

model Tsensor
  Modelica.Blocks.Interfaces.RealOutput oT annotation(
    Placement(visible = true, transformation(origin = {-76, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {20, 0}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Interfaces.MAport_waxa air_flange1 annotation(
    Placement(visible = true, transformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {119, 0}, extent = {{-19, -20}, {19, 20}}, rotation = 0)));
protected
 Media.Substances.MoistAir air;
equation
  air_flange1.wa = 0;
  air_flange1.ha = 0; // meaningless, no flow
  air_flange1.xa = 0; // meaningless, no flow
  air.p = air_flange1.pa;
  air.h = inStream(air_flange1.ha);
  air.X = inStream(air_flange1.xa);
  oT    = air.T;
annotation(
    Icon(graphics = {Ellipse(origin = {60, -42}, lineColor = {239, 41, 41}, fillColor = {239, 41, 41}, fillPattern = FillPattern.Solid, extent = {{-20, 20}, {20, -20}}, endAngle = 360), Ellipse(origin = {60, 72}, lineColor = {239, 41, 41}, fillColor = {239, 41, 41}, fillPattern = FillPattern.Solid, extent = {{-10, 8}, {10, -8}}, endAngle = 360), Rectangle(origin = {60, 12}, lineColor = {239, 41, 41}, fillColor = {239, 41, 41}, fillPattern = FillPattern.Solid, extent = {{-10, 60}, {10, -60}}), Text(origin = {-40, -70}, extent = {{-60, 30}, {60, -30}}, textString = "%name")}));
end Tsensor;