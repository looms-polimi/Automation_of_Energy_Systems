within AES.ProcessComponents.Thermal.Liquid;

model Valve_linear
  extends Interfaces.flowTwoPorts_pwh;
  parameter SI.PressureDifference dpnom=5e4 "nominal dp at wnom and x=1";
  parameter SI.MassFlowRate wnom=1 "nominal w at dpnom and x=1";
  Modelica.Blocks.Interfaces.RealInput x annotation(
    Placement(visible = true, transformation(origin = {-78, 88}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {0, 100}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
//protected
  final parameter Real kv(fixed=false) annotation(Evaluate = true);
equation
  w   = max(Constants.cmdeps,min(x,1))*kv*Functions.sqrtReg(dp);
  hao = hbi;
  hbo = hai;
initial equation
  0 = wnom - kv*sqrt(dpnom);
annotation(
    Icon(graphics = {Polygon(origin = {0, 70}, fillColor = {114, 159, 207}, fillPattern = FillPattern.VerticalCylinder, points = {{0, -10}, {-40, -10}, {-40, -2}, {-20, 10}, {20, 10}, {40, -2}, {40, -10}, {0, -10}}), Rectangle(origin = {0, 30}, fillColor = {46, 52, 54}, fillPattern = FillPattern.Solid, extent = {{-2, 30}, {2, -30}}), Polygon(origin = {-50, 0}, fillColor = {211, 215, 207}, fillPattern = FillPattern.HorizontalCylinder, points = {{50, 0}, {-50, 40}, {-50, -40}, {50, 0}}), Polygon(origin = {50, 0}, rotation = 180, fillColor = {211, 215, 207}, fillPattern = FillPattern.HorizontalCylinder, points = {{50, 0}, {-50, 40}, {-50, -40}, {50, 0}}), Ellipse( fillColor = {211, 215, 207}, fillPattern = FillPattern.Sphere, extent = {{-20, 20}, {20, -20}}, endAngle = 360), Polygon(origin = {-6, -60}, fillColor = {52, 101, 164}, fillPattern = FillPattern.Solid, points = {{-40, 6}, {20, 6}, {20, 20}, {50, 0}, {20, -20}, {20, -6}, {-40, -6}, {-40, 6}})}));
end Valve_linear;