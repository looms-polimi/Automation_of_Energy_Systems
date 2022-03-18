within AES.Coursework.ThermSys_component_models.Heater_power_vs_wTin;

model heater_wT
  extends Icons.CourseworkModel;
  parameter SI.MassFlowRate wmin = 0.01;
  parameter SI.MassFlowRate wmax = 0.2;
  parameter SI.Temperature Timin = 273.15 + 40;
  parameter SI.Temperature Timax = 273.15 + 70;
  AES.ProcessComponents.Thermal.Liquid.Node_wT_prescribed src annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Node_pT_fixed snk annotation(
    Placement(visible = true, transformation(origin = {-50, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.TubeStream tube(wnom = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-10, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  AES.ProcessComponents.Thermal.Liquid.VectorHPtoHP_conductor conv(Gtotal = 10)  annotation(
    Placement(visible = true, transformation(origin = {30, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature Ta(T(displayUnit = "K") = 293.15) annotation(
    Placement(visible = true, transformation(origin = {70, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp w(duration = 8e5, height = wmax - wmin, offset = wmin, startTime = 1e5) annotation(
    Placement(visible = true, transformation(origin = {-110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 8e5, height = Timax - Timin, offset = Timin, startTime = 1e5) annotation(
    Placement(visible = true, transformation(origin = {-110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(src.pwh_a, tube.pwh_a) annotation(
    Line(points = {{-38, 30}, {-10, 30}, {-10, 2}}, color = {46, 52, 54}));
  connect(snk.pwh_a, tube.pwh_b) annotation(
    Line(points = {{-38, -50}, {-10, -50}, {-10, -22}}, color = {46, 52, 54}));
  connect(tube.surf, conv.vectorHP) annotation(
    Line(points = {{-4.6, -10}, {25.4, -10}}, color = {144, 5, 5}));
  connect(conv.HP, Ta.port) annotation(
    Line(points = {{34, -10}, {60, -10}}, color = {191, 0, 0}));
  connect(w.y, src.w) annotation(
    Line(points = {{-99, 50}, {-80.5, 50}, {-80.5, 36}, {-60, 36}}, color = {0, 0, 127}));
  connect(ramp.y, src.T) annotation(
    Line(points = {{-99, 10}, {-80, 10}, {-80, 24}, {-60, 24}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 1.5e6, Tolerance = 1e-06, Interval = 1500),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end heater_wT;