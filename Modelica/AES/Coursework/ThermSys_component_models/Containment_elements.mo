within AES.Coursework.ThermSys_component_models;

model Containment_elements
  extends Icons.CourseworkModel;
  AES.ProcessComponents.Thermal.Containment.SolidMultilayer_Homogeneous homogeneous(s = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Containment.SolidMultilayer_NonHomogeneous nonhomogeneous(lambda = {2.4, 0.02, 0.1}, s = {0.02, 0.05, 0.01}) annotation(
    Placement(visible = true, transformation(origin = {-10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature T2(T = 273.15 + 20) annotation(
    Placement(visible = true, transformation(origin = {50, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow P1h annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow P1n annotation(
    Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression P1(y = 100) annotation(
    Placement(visible = true, transformation(origin = {-110, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(homogeneous.side_b, T2.port) annotation(
    Line(points = {{-2, 10}, {20, 10}, {20, -10}, {40, -10}}, color = {191, 0, 0}));
  connect(nonhomogeneous.side_b, T2.port) annotation(
    Line(points = {{-2, -30}, {20, -30}, {20, -10}, {40, -10}}, color = {191, 0, 0}));
  connect(P1h.port, homogeneous.side_a) annotation(
    Line(points = {{-40, 10}, {-16, 10}}, color = {191, 0, 0}));
  connect(P1n.port, nonhomogeneous.side_a) annotation(
    Line(points = {{-40, -30}, {-16, -30}}, color = {191, 0, 0}));
  connect(P1.y, P1h.Q_flow) annotation(
    Line(points = {{-98, -10}, {-80, -10}, {-80, 10}, {-60, 10}}, color = {0, 0, 127}));
  connect(P1.y, P1n.Q_flow) annotation(
    Line(points = {{-98, -10}, {-80, -10}, {-80, -30}, {-60, -30}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 100000, Tolerance = 1e-6, Interval = 10),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})));
end Containment_elements;