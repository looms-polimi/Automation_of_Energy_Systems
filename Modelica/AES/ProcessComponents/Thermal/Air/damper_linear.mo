within AES.ProcessComponents.Thermal.Air;

model damper_linear

  extends ProcessComponents.Thermal.Interfaces.PartialTwoPorts_waxa;
  parameter SI.Pressure dpnom = 1000 "Nominal pressure drop, fully open";
  parameter SI.VolumeFlowRate qnom = 0.3 "Nominal volume flowrate, fully open";
  Modelica.Blocks.Interfaces.RealInput x annotation(
    Placement(visible = true, transformation(origin = {-78, 88}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {0, 100}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
protected
  final parameter Real kv(fixed=false) annotation(Evaluate = true);
equation
  // No mass storage
  wa1 + wa2 = 0;
  wa1 = max(0,min(x,1))*kv*Functions.sqrtReg(pa1-pa2);
  // other equations
  haout1 = inStream(air_flange2.ha);
  haout2 = inStream(air_flange1.ha);
  xaout1 = inStream(air_flange2.xa);
  xaout2 = inStream(air_flange1.xa);
initial equation
  qnom*Media.Constants.d_a_typ = kv*sqrt(dpnom);
  annotation(
    Icon(graphics = {Polygon(origin = {0, 70}, fillColor = {114, 159, 207}, fillPattern = FillPattern.VerticalCylinder, points = {{0, -10}, {-40, -10}, {-40, -2}, {-20, 10}, {20, 10}, {40, -2}, {40, -10}, {0, -10}}), Polygon(origin = {-6, -60}, fillColor = {52, 101, 164}, fillPattern = FillPattern.Solid, points = {{-40, 6}, {20, 6}, {20, 20}, {50, 0}, {20, -20}, {20, -6}, {-40, -6}, {-40, 6}}), Rectangle(origin = {0, -1}, lineColor = {52, 101, 164}, fillColor = {255, 255, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, 41}, {100, -41}}), Polygon(origin = {-1, -2}, fillColor = {46, 52, 54}, fillPattern = FillPattern.Solid, points = {{-31, -30}, {33, 32}, {35, 30}, {-29, -32}, {-31, -30}}), Rectangle(origin = {0, 50}, fillColor = {46, 52, 54}, fillPattern = FillPattern.Solid, extent = {{-2, 10}, {2, -10}})}),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end damper_linear;