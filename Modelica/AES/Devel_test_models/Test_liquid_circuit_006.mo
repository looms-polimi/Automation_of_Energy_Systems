within AES.Devel_test_models;

model Test_liquid_circuit_006
  extends Icons.TestModel;
  inner AES.ProcessComponents.Thermal.System_settings.System_liquid system annotation(
    Placement(visible = true, transformation(origin = {-170, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Node_pT_fixed src annotation(
    Placement(visible = true, transformation(origin = {-72, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Node_pT_fixed snk annotation(
    Placement(visible = true, transformation(origin = {30, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.TubeStream str1 annotation(
    Placement(visible = true, transformation(origin = {-20, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.TubeStream str2 annotation(
    Placement(visible = true, transformation(origin = {-20, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(src.pwh_a, str1.pwh_a) annotation(
    Line(points = {{-60, -10}, {-50, -10}, {-50, -30}, {-32, -30}}, color = {46, 52, 54}));
  connect(src.pwh_a, str2.pwh_a) annotation(
    Line(points = {{-60, -10}, {-50, -10}, {-50, 28}, {-32, 28}}, color = {46, 52, 54}));
  connect(str2.pwh_b, snk.pwh_a) annotation(
    Line(points = {{-8, 28}, {10, 28}, {10, -10}, {18, -10}}, color = {46, 52, 54}));
  connect(str1.pwh_b, snk.pwh_a) annotation(
    Line(points = {{-8, -30}, {8, -30}, {8, -10}, {18, -10}}, color = {46, 52, 54}));
protected
  annotation(
    experiment(StartTime = 0, StopTime = 1000, Tolerance = 1e-6, Interval = 0.1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})));
end Test_liquid_circuit_006;