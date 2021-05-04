within AES.Devel_test_models;

model Test_stank_001
  extends Icons.TestModel;
  inner AES.ProcessComponents.Thermal.System_settings.System_liquid system annotation(
    Placement(visible = true, transformation(origin = {-170, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.HVAC.StratifiedTank_2zones stank(Thotstart(displayUnit = "K") = 310)  annotation(
    Placement(visible = true, transformation(origin = {-10, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Node_pT_fixed pref annotation(
    Placement(visible = true, transformation(origin = {-74, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(pref.pwh_a, stank.coldOut) annotation(
    Line(points = {{-62, -22}, {-22, -22}}, color = {46, 52, 54}));
  annotation(
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-6, Interval = 8.64),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})));
end Test_stank_001;