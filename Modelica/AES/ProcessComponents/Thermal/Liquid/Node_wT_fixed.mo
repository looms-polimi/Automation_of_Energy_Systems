within AES.ProcessComponents.Thermal.Liquid;

model Node_wT_fixed
  extends Interfaces.flowOnePort_pwh;
  parameter SI.MassFlowRate w=0.1;
  parameter SI.Temperature T=293.15;
equation
  pwh_a.w = -w;
  pwh_a.h = cp*T;
annotation(
    Icon(graphics = {Ellipse(fillColor = {211, 215, 207}, fillPattern = FillPattern.Sphere, extent = {{-100, 100}, {100, -100}}, endAngle = 360), Text(origin = {-1, 5}, lineColor = {204, 0, 0}, fillColor = {252, 233, 79}, fillPattern = FillPattern.Solid, extent = {{-69, 53}, {69, -53}}, textString = "wT")}));
end Node_wT_fixed;