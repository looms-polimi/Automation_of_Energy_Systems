within AES.Devel_test_models;

model Test_HP_001a
  extends Icons.TestModel;
  Modelica.Blocks.Sources.RealExpression iTamb(y = 273.15 + 50) annotation(
    Placement(transformation(origin = {-150, -50}, extent = {{-10, -10}, {10, 10}})));
  ProcessComponents.Thermal.HVAC.HP_CarnotFractionCOPh HP(maxCOPheat = 8)  annotation(
    Placement(transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature Tamb annotation(
    Placement(transformation(origin = {-90, -50}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression cmd(y = 0.5 + 0.49*sin(time)) annotation(
    Placement(transformation(origin = {-110, 10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor Ghot(G = 10) annotation(
    Placement(transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor Gcold(G = 1) annotation(
    Placement(transformation(origin = {-50, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(cmd.y, HP.cmd01) annotation(
    Line(points = {{-99, 10}, {-58, 10}}, color = {0, 0, 127}));
  connect(iTamb.y, Tamb.T) annotation(
    Line(points = {{-139, -50}, {-103, -50}}, color = {0, 0, 127}));
  connect(HP.hotPort, Ghot.port_a) annotation(
    Line(points = {{-50, 20}, {-50, 32}, {-10, 32}, {-10, 20}}, color = {191, 0, 0}));
  connect(Tamb.port, Gcold.port_a) annotation(
    Line(points = {{-80, -50}, {-50, -50}, {-50, -36}}, color = {191, 0, 0}));
  connect(Gcold.port_b, HP.coldPort) annotation(
    Line(points = {{-50, -16}, {-50, 2}}, color = {191, 0, 0}));
  connect(Tamb.port, Ghot.port_b) annotation(
    Line(points = {{-80, -50}, {-10, -50}, {-10, 0}}, color = {191, 0, 0}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts",
    __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})));
end Test_HP_001a;