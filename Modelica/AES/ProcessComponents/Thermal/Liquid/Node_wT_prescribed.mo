within AES.ProcessComponents.Thermal.Liquid;

model Node_wT_prescribed
  extends Interfaces.flowOnePort_pwh;
  Modelica.Blocks.Interfaces.RealInput w annotation(
    Placement(visible = true, transformation(origin = {-178, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput T annotation(
    Placement(visible = true, transformation(origin = {-170, -38}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  pwh_a.w = -w;
  pwh_a.h = cp*T;
annotation(
    Icon(graphics = {Ellipse(fillColor = {211, 215, 207}, fillPattern = FillPattern.Sphere, extent = {{-100, 100}, {100, -100}}, endAngle = 360), Text(origin = {-1, 5}, lineColor = {204, 0, 0}, fillColor = {252, 233, 79}, fillPattern = FillPattern.Solid, extent = {{-69, 53}, {69, -53}}, textString = "wT")}));
end Node_wT_prescribed;