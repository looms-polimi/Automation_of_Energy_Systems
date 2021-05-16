within AES.ProcessComponents.Thermal.Liquid;

model MassFlowrateSensor
  extends Interfaces.flowTwoPorts_pwh;
  outer System_settings.System_liquid system;
  Modelica.Blocks.Interfaces.RealOutput ow annotation(
    Placement(visible = true, transformation(origin = {120, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
equation
  dp      = 0;
  ow      = w;
  pwh_a.h = inStream(pwh_b.h);
  pwh_b.h = inStream(pwh_a.h);
annotation(
    Icon(graphics = {Rectangle(origin = {-70, 0}, lineColor = {46, 52, 54}, fillColor = {211, 215, 207}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-30, 20}, {30, -20}}), Rectangle(origin = {-30, 0}, lineColor = {46, 52, 54}, fillColor = {211, 215, 207}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-10, 60}, {10, -60}}), Rectangle(origin = {30, 0}, lineColor = {46, 52, 54}, fillColor = {211, 215, 207}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-10, 60}, {10, -60}}), Rectangle(origin = {70, 0}, lineColor = {46, 52, 54}, fillColor = {211, 215, 207}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-30, 20}, {30, -20}}), Rectangle(origin = {0.05, -0.08}, fillColor = {52, 101, 164}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-19.85, 49.92}, {19.85, -49.92}})}));
end MassFlowrateSensor;