within AES.Coursework.ThermSys_component_models;

model HeatPump_case_001a
  extends Icons.CourseworkModel;
  Modelica.Blocks.Sources.RealExpression iTc(y = 273.15 + 20) annotation(
    Placement(transformation(origin = {-150, -50}, extent = {{-10, -10}, {10, 10}})));
  ProcessComponents.Thermal.HVAC.HP_CarnotFractionCOPh HP1 annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature Th annotation(
    Placement(transformation(origin = {-90, 70}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature Tc annotation(
    Placement(transformation(origin = {-90, -50}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression cmd(y = 0.5) annotation(
    Placement(transformation(origin = {-150, 30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression iTh(y = 273.15 + 35) annotation(
    Placement(transformation(origin = {-150, 70}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor Gh1(G = 200/5) annotation(
    Placement(transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor Gc1(G = 100/5) annotation(
    Placement(transformation(origin = {-50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  AES.ProcessComponents.Thermal.HVAC.HP_CarnotFractionCOPh HP2 annotation(
    Placement(transformation(origin = {8, 10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor Gh2(G = 200/2) annotation(
    Placement(transformation(origin = {8, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor Gc2(G = 100/2) annotation(
    Placement(transformation(origin = {8, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(iTh.y, Th.T) annotation(
    Line(points = {{-139, 70}, {-103, 70}}, color = {0, 0, 127}));
  connect(cmd.y, HP1.cmd01) annotation(
    Line(points = {{-139, 30}, {-98, 30}, {-98, 10}, {-58, 10}}, color = {0, 0, 127}));
  connect(iTc.y, Tc.T) annotation(
    Line(points = {{-139, -50}, {-103, -50}}, color = {0, 0, 127}));
  connect(Th.port, Gh1.port_b) annotation(
    Line(points = {{-80, 70}, {-50, 70}, {-50, 60}}, color = {191, 0, 0}));
  connect(Gh1.port_a, HP1.hotPort) annotation(
    Line(points = {{-50, 40}, {-50, 20}}, color = {191, 0, 0}));
  connect(Tc.port, Gc1.port_a) annotation(
    Line(points = {{-80, -50}, {-50, -50}, {-50, -40}}, color = {191, 0, 0}));
  connect(Gc1.port_b, HP1.coldPort) annotation(
    Line(points = {{-50, -20}, {-50, 2}}, color = {191, 0, 0}));
  connect(Gh2.port_a, HP2.hotPort) annotation(
    Line(points = {{8, 40}, {8, 20}}, color = {191, 0, 0}));
  connect(Gc2.port_b, HP2.coldPort) annotation(
    Line(points = {{8, -20}, {8, 2}}, color = {191, 0, 0}));
  connect(Tc.port, Gc2.port_a) annotation(
    Line(points = {{-80, -50}, {8, -50}, {8, -40}}, color = {191, 0, 0}));
  connect(Th.port, Gh2.port_b) annotation(
    Line(points = {{-80, 70}, {8, 70}, {8, 60}}, color = {191, 0, 0}));
  connect(cmd.y, HP2.cmd01) annotation(
    Line(points = {{-138, 30}, {-20, 30}, {-20, 10}, {0, 10}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 10000, Tolerance = 1e-06, Interval = 1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts",
    __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})));
end HeatPump_case_001a;