within AES.ProcessComponents.Thermal.Liquid;

model dp_quadratic
  extends Interfaces.flowTwoPorts_pwh;
  parameter SI.PressureDifference dpnom=5e4 "nominal dp";
  parameter SI.MassFlowRate wnom=1 "nominal w";
protected
  final parameter Real kv=wnom/sqrt(dpnom);
equation
  w   = kv*Functions.sqrtReg(dp);
  hao = hbi;
  hbo = hai;
initial equation
annotation(
    Icon(graphics = {Rectangle(fillColor = {238, 238, 236}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, 40}, {100, -40}}), Text(origin = {-3, 3}, lineColor = {252, 233, 79}, extent = {{-81, 27}, {81, -27}}, textString = "dp qua"), Text(origin = {-70, 70}, extent = {{-30, 30}, {30, -30}}, textString = "a"), Text(origin = {70, 70}, extent = {{-30, 30}, {30, -30}}, textString = "b")}));
end dp_quadratic;