within AES.ProcessComponents.Thermal.Liquid;

model Pump_volumetric
  extends Interfaces.flowTwoPorts_pwh(final pbhi=true);
  parameter SI.MassFlowRate w0=1 "mass flowrate at cmd=1";
  Modelica.Blocks.Interfaces.RealInput cmd annotation(
    Placement(visible = true, transformation(origin = {-120, 48}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {0, 80}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  SI.Power P;
equation
  w   = cmd*w0;
  hao = hbi-dp/ro;
  hbo = hai+dp/ro;
  P   = w*dp/ro;
  assert(w>=0, "flow reversal not allowed in centrifugal pump");
annotation(
    Icon(graphics = {Rectangle(lineColor = {46, 52, 54},fillColor = {211, 215, 207}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, 20}, {100, -20}}), Ellipse(origin = {-20.31, -0.29}, fillColor = {211, 215, 207}, fillPattern = FillPattern.Sphere, extent = {{-59.69, 60.29}, {59.69, -60.29}}, endAngle = 360), Polygon(origin = {-1, -79}, lineColor = {32, 74, 135}, fillColor = {52, 101, 164}, fillPattern = FillPattern.Solid, points = {{-59, 5}, {41, 5}, {41, 13}, {61, -1}, {41, -15}, {41, -7}, {-59, -7}, {-59, 5}}), Ellipse(origin = {21.69, -0.29}, fillColor = {211, 215, 207}, fillPattern = FillPattern.Sphere, extent = {{-59.69, 60.29}, {59.69, -60.29}}, endAngle = 360)}));

end Pump_volumetric;