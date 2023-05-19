within AES.ProcessComponents.Thermal.Liquid;

model Pump_centrifugal
  extends Interfaces.flowTwoPorts_pwh(final pbhi=true);
  parameter Real cmdnom = 0.75 "nominal cmd [0,1]";
  parameter SI.PressureDifference dpn0=2e5 "dp at cmd=cmdnom, w=wnom";
  parameter SI.MassFlowRate wn0=1 "w at cmd=cmdnom, dp=dpnom";
  parameter SI.PressureDifference dp00=2.5e5 "dp at cmd=cmdnom, w=0";
  parameter Real etaHopt=0.8 "optimal hydraulic efficiency, at cmd=cmdHopt";
  parameter Real cmdHopt=0.8 "optimal efficiency cmd";
  parameter Real etaH0=0.3 "min hydraulic efficiency (at cmd near zero)";
  parameter Boolean noReverse=true "strictly prohibit reverse flow";
  Modelica.Blocks.Interfaces.RealInput cmd annotation(
    Placement(visible = true, transformation(origin = {-114, 108}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {0, 80}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Real etaH "hydraulic efficiency";
  SI.Power Pabs "absorbed power (power to fluid over hydraulic efficiency)";
protected
  final parameter Real kp=(dp00-dpn0)/wn0^2;
  final parameter Real keta=(etaHopt-etaH0)/cmdHopt^2;
equation
  dp   = dp00*(max(Constants.cmdeps,min(1,cmd))/cmdnom)^2-kp*w^2;
  hao  = hbi-dp/ro;
  hbo  = hai+dp/ro;
  etaH = etaHopt-keta*(cmd-cmdHopt)^2;
         assert(etaH>=0, "negative hydraulic efficiency in centrifugal pump, check data");
  Pabs = if w>0 then w*dp/ro/etaH else 0;
  if noReverse then
     assert(w>=0, "flow reversal not allowed in centrifugal pump");
  end if;
annotation(
    Icon(graphics = {Polygon(origin = {51, 20}, fillColor = {186, 189, 182}, fillPattern = FillPattern.Sphere, points = {{49, 0}, {37, 0}, {29, 4}, {9, 24}, {-11, 36}, {-31, 40}, {-51, 40}, {-53, 12}, {-9, -14}, {13, -32}, {19, -36}, {31, -40}, {49, -40}, {49, 0}}), Ellipse(fillColor = {211, 215, 207}, fillPattern = FillPattern.Sphere, extent = {{-60, 60}, {60, -60}}, endAngle = 360), Polygon(origin = {-35, 0}, lineColor = {46, 52, 54}, fillColor = {211, 215, 207}, fillPattern = FillPattern.HorizontalCylinder, points = {{-65, 20}, {33, 20}, {43, 16}, {51, 8}, {53, 0}, {51, -8}, {43, -16}, {33, -20}, {-53, -20}, {-65, -20}, {-65, 20}}), Polygon(origin = {-1, -79}, lineColor = {32, 74, 135}, fillColor = {52, 101, 164}, fillPattern = FillPattern.Solid, points = {{-59, 5}, {41, 5}, {41, 13}, {61, -1}, {41, -15}, {41, -7}, {-59, -7}, {-59, 5}})}));
end Pump_centrifugal;