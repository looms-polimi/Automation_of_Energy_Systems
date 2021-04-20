within AES.Devel_test_models;

model Test_HP_001
  extends Icons.TestModel;
  Modelica.Blocks.Sources.RealExpression iTc(y = 273.15 + 7 - min(5, time / 200)) annotation(
    Placement(visible = true, transformation(origin = {-150, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.HVAC.HP_CarnotFractionCOPh HP annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature Th annotation(
    Placement(visible = true, transformation(origin = {-90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature Tc annotation(
    Placement(visible = true, transformation(origin = {-90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression cmd(y = 0.5) annotation(
    Placement(visible = true, transformation(origin = {-150, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression iTh(y = 273.15 + 35) annotation(
    Placement(visible = true, transformation(origin = {-150, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(iTh.y, Th.T) annotation(
    Line(points = {{-138, 50}, {-102, 50}}, color = {0, 0, 127}));
  connect(cmd.y, HP.cmd01) annotation(
    Line(points = {{-138, 10}, {-58, 10}}, color = {0, 0, 127}));
  connect(iTc.y, Tc.T) annotation(
    Line(points = {{-138, -30}, {-102, -30}}, color = {0, 0, 127}));
  connect(Th.port, HP.hotPort) annotation(
    Line(points = {{-80, 50}, {-50, 50}, {-50, 20}}, color = {191, 0, 0}));
  connect(HP.coldPort, Tc.port) annotation(
    Line(points = {{-50, 2}, {-50, -30}, {-80, -30}}, color = {191, 0, 0}));
  annotation(
    experiment(StartTime = 0, StopTime = 10000, Tolerance = 1e-6, Interval = 1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})));
end Test_HP_001;