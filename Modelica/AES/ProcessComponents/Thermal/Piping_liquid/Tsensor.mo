within AES.ProcessComponents.Thermal.Piping_liquid;

model Tsensor
  extends Interfaces.flowOnePort_pwh;
  Modelica.Blocks.Interfaces.RealOutput oT annotation(
    Placement(visible = true, transformation(origin = {-76, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {20, 0}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
equation
  pwh_a.w=0;
  oT=pwh_a.h/system.cp;
annotation(
    Icon(graphics = {Ellipse(origin = {60, -60}, lineColor = {239, 41, 41}, fillColor = {239, 41, 41}, fillPattern = FillPattern.Solid, extent = {{-20, 20}, {20, -20}}, endAngle = 360), Ellipse(origin = {60, 72}, lineColor = {239, 41, 41}, fillColor = {239, 41, 41}, fillPattern = FillPattern.Solid, extent = {{-10, 8}, {10, -8}}, endAngle = 360), Rectangle(origin = {60, 12}, lineColor = {239, 41, 41}, fillColor = {239, 41, 41}, fillPattern = FillPattern.Solid, extent = {{-10, 60}, {10, -60}})}));
end Tsensor;