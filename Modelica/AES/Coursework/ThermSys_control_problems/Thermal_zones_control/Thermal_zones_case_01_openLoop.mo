within AES.Coursework.ThermSys_control_problems.Thermal_zones_control;

model Thermal_zones_case_01_openLoop
  extends AES.Icons.CourseworkModel;
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature Tamb annotation(
    Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow Pz1 annotation(
    Placement(visible = true, transformation(origin = {30, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow Pz2 annotation(
    Placement(visible = true, transformation(origin = {30, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Cz1(C = 1e4, T(displayUnit = "K"))  annotation(
    Placement(visible = true, transformation(origin = {160, 20}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Cz2(C = 1e4, T(displayUnit = "K"))  annotation(
    Placement(visible = true, transformation(origin = {160, -20}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor Gloss1(G = 25)  annotation(
    Placement(visible = true, transformation(origin = {130, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor Glss2(G = 25)  annotation(
    Placement(visible = true, transformation(origin = {100, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  AES.ProcessComponents.Thermal.Containment.VariableThermalConductor vGc annotation(
    Placement(visible = true, transformation(origin = {80, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Blocks.Sources.RealExpression P2(y = if time < 3600 then 0 else 1000)  annotation(
    Placement(visible = true, transformation(origin = {-36, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression P1(y = if time < 0 then 0 else 1000)  annotation(
    Placement(visible = true, transformation(origin = {-38, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Ta(y =  293.15) annotation(
    Placement(visible = true, transformation(origin = {10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Gcoupling(y =  100) annotation(
    Placement(visible = true, transformation(origin = {10, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor sTz1 annotation(
    Placement(visible = true, transformation(origin = {72, -60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor sTz2 annotation(
    Placement(visible = true, transformation(origin = {42, -80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(Ta.y, Tamb.T) annotation(
    Line(points = {{22, 70}, {58, 70}}, color = {0, 0, 127}));
  connect(Tamb.port, Glss2.port_a) annotation(
    Line(points = {{80, 70}, {100, 70}, {100, 60}}, color = {191, 0, 0}));
  connect(Tamb.port, Gloss1.port_a) annotation(
    Line(points = {{80, 70}, {130, 70}, {130, 60}}, color = {191, 0, 0}));
  connect(Glss2.port_b, Cz2.port) annotation(
    Line(points = {{100, 40}, {100, -20}, {140, -20}}, color = {191, 0, 0}));
  connect(Cz2.port, vGc.hp_a) annotation(
    Line(points = {{140, -20}, {80, -20}, {80, -10}}, color = {191, 0, 0}));
  connect(Gloss1.port_b, Cz1.port) annotation(
    Line(points = {{130, 40}, {130, 20}, {140, 20}}, color = {191, 0, 0}));
  connect(Cz1.port, vGc.hp_b) annotation(
    Line(points = {{140, 20}, {80, 20}, {80, 10}}, color = {191, 0, 0}));
  connect(Pz1.port, Cz1.port) annotation(
    Line(points = {{40, 20}, {140, 20}}, color = {191, 0, 0}));
  connect(Pz2.port, Cz2.port) annotation(
    Line(points = {{40, -20}, {140, -20}}, color = {191, 0, 0}));
  connect(Gcoupling.y, vGc.Gc) annotation(
    Line(points = {{22, 40}, {60, 40}, {60, 0}, {76, 0}}, color = {0, 0, 127}));
  connect(Cz1.port, sTz1.port) annotation(
    Line(points = {{140, 20}, {130, 20}, {130, -60}, {82, -60}}, color = {191, 0, 0}));
  connect(Cz2.port, sTz2.port) annotation(
    Line(points = {{140, -20}, {100, -20}, {100, -80}, {52, -80}}, color = {191, 0, 0}));
  connect(P1.y, Pz1.Q_flow) annotation(
    Line(points = {{-27, 20}, {20, 20}}, color = {0, 0, 127}));
  connect(P2.y, Pz2.Q_flow) annotation(
    Line(points = {{-24, -20}, {20, -20}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 7200, Tolerance = 1e-6, Interval = 1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end Thermal_zones_case_01_openLoop;