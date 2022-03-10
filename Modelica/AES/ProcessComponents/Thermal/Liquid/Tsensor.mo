within AES.ProcessComponents.Thermal.Liquid;

model Tsensor
  extends Interfaces.flowOnePort_pwh;
  Modelica.Blocks.Interfaces.RealOutput oT annotation(
    Placement(visible = true, transformation(origin = {-76, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {20, 0}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
equation
  pwh_a.w = 0;
  pwh_a.h = -1; /* meaningless, no flow */
  oT=inStream(pwh_a.h)/system.cp+pwh_a.p/system.cp/system.ro;
annotation(
    Icon(graphics = {Ellipse(origin = {60, -42}, lineColor = {239, 41, 41}, fillColor = {239, 41, 41}, fillPattern = FillPattern.Solid, extent = {{-20, 20}, {20, -20}}, endAngle = 360), Ellipse(origin = {60, 72}, lineColor = {239, 41, 41}, fillColor = {239, 41, 41}, fillPattern = FillPattern.Solid, extent = {{-10, 8}, {10, -8}}, endAngle = 360), Rectangle(origin = {60, 12}, lineColor = {239, 41, 41}, fillColor = {239, 41, 41}, fillPattern = FillPattern.Solid, extent = {{-10, 60}, {10, -60}}), Text(origin = {-40, -70}, extent = {{-60, 30}, {60, -30}}, textString = "%name")}));
end Tsensor;