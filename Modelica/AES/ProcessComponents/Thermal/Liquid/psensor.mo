within AES.ProcessComponents.Thermal.Liquid;

model psensor
  extends Interfaces.flowOnePort_pwh;
  Modelica.Blocks.Interfaces.RealOutput op annotation(
    Placement(transformation(origin = {-76, 6}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-40, 0}, extent = {{20, -20}, {-20, 20}})));
equation
  pwh_a.w = 0;
  pwh_a.h = -1;
/* meaningless, no flow */
  op = pwh_a.p;
  annotation(
    Icon(graphics = {Text(origin = {-40, -70}, extent = {{-60, 30}, {60, -30}}, textString = "%name"), Ellipse(origin = {40, 0}, fillColor = {232, 232, 232}, fillPattern = FillPattern.Solid, lineThickness = 0.75, extent = {{-60, 60}, {60, -60}}), Line(origin = {26, 12}, points = {{16, -14}, {-16, 14}}, thickness = 2)}));
end psensor;