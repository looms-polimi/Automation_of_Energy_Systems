within AES.Devel_test_models;

model Test_header_002
  extends Icons.TestModel;
  inner AES.ProcessComponents.Thermal.System_settings.System_liquid system annotation(
    Placement(visible = true, transformation(origin = {-170, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Node_pT_fixed pref annotation(
    Placement(visible = true, transformation(origin = {90, -22}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.Liquid.Header header annotation(
    Placement(visible = true, transformation(origin = {-16, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.Liquid.Node_wT_fixed src annotation(
    Placement(visible = true, transformation(origin = {-102, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow P(Q_flow = 1000)  annotation(
    Placement(visible = true, transformation(origin = {-68, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(src.pwh_a, header.pwh_a) annotation(
    Line(points = {{-90, -20}, {-28, -20}, {-28, -22}}, color = {46, 52, 54}));
  connect(header.pwh_b, pref.pwh_a) annotation(
    Line(points = {{-4, -22}, {78, -22}}, color = {46, 52, 54}));
  connect(P.port, header.heatPort) annotation(
    Line(points = {{-58, 24}, {-16, 24}, {-16, -12}}, color = {191, 0, 0}));
  annotation(
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-6, Interval = 8.64),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})));
end Test_header_002;