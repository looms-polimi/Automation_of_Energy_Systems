within AES.ProcessComponents.Thermal.Piping_liquid;

model Pump_centrifugal
  extends Interfaces.flowTwoPorts_pwh(final pbhi=true,w(start=w0/1000));
  parameter SI.PressureDifference dp0=1e5 "dp at cmd=1, zero flow";
  parameter SI.MassFlowRate w0=1 "mass flowrate at cmd=1, zero dp";
  Modelica.Blocks.Interfaces.RealInput cmd annotation(
    Placement(visible = true, transformation(origin = {-114, 108}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {0, 80}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  SI.Power P;
protected
  final parameter Real kp(fixed=false) annotation(Evaluate = true);
equation
  dp  = dp0*max(0,min(cmd,1))-kp*w^2;
  hao = hbi-dp/ro;
  hbo = hai+dp/ro;
  P   = w*(pwh_b.h-pwh_a.h);
  assert(w>=0, "flow reversal not allowed in centrifugal pump");
initial equation
  dp0-kp*w0^2 = 0;
annotation(
    Icon(graphics = {Polygon(origin = {51, 20}, fillColor = {186, 189, 182}, fillPattern = FillPattern.Sphere, points = {{49, 0}, {37, 0}, {29, 4}, {9, 24}, {-11, 36}, {-31, 40}, {-51, 40}, {-53, 12}, {-9, -14}, {13, -32}, {19, -36}, {31, -40}, {49, -40}, {49, 0}}), Ellipse(fillColor = {211, 215, 207}, fillPattern = FillPattern.Sphere, extent = {{-60, 60}, {60, -60}}, endAngle = 360), Polygon(origin = {-35, 0}, lineColor = {46, 52, 54}, fillColor = {211, 215, 207}, fillPattern = FillPattern.HorizontalCylinder, points = {{-65, 20}, {33, 20}, {43, 16}, {51, 8}, {53, 0}, {51, -8}, {43, -16}, {33, -20}, {-53, -20}, {-65, -20}, {-65, 20}}), Polygon(origin = {-1, -79}, lineColor = {32, 74, 135}, fillColor = {52, 101, 164}, fillPattern = FillPattern.Solid, points = {{-59, 5}, {41, 5}, {41, 13}, {61, -1}, {41, -15}, {41, -7}, {-59, -7}, {-59, 5}})}));
end Pump_centrifugal;