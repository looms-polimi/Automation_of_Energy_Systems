within AES.Coursework.ThermSys_control_problems.Thermal_zones_control;

model Thermal_zones_case_01
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
    Placement(visible = true, transformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.RealExpression SP2(y = 293.15) annotation(
    Placement(visible = true, transformation(origin = {-144, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression SP1(y = 293.15 + 5 * sign(sin(6.28 * time / 1800))) annotation(
    Placement(visible = true, transformation(origin = {-144, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.TITOdecoupler_zeroInit D(Fcs1d = {1}, Fcs2d = {1}) annotation(
    Placement(visible = true, transformation(origin = {-10, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_full C1(CSmax = 1000, CSmin = 0, K = 100, Ti = 100, hasBias = true) annotation(
    Placement(visible = true, transformation(origin = {-62, 28}, extent = {{-10, 20}, {10, -20}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_full C2(CSmax = 1000, CSmin = 0,K = 100, Ti = 100, hasBias = true) annotation(
    Placement(visible = true, transformation(origin = {-62, -32}, extent = {{-10, -20}, {10, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Ta(y = if time < 3600 then 283.15 else 278.15) annotation(
    Placement(visible = true, transformation(origin = {10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Gcoupling(y = if sin(6.28 *time / 900) > 0.8 then 100 else 20) annotation(
    Placement(visible = true, transformation(origin = {10, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor sTz1 annotation(
    Placement(visible = true, transformation(origin = {72, -60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor sTz2 annotation(
    Placement(visible = true, transformation(origin = {42, -80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(SP1.y, C1.SP) annotation(
    Line(points = {{-133, 14}, {-72, 14}}, color = {0, 0, 127}));
  connect(SP2.y, C2.SP) annotation(
    Line(points = {{-133, -18}, {-72, -18}}, color = {0, 0, 127}));
  connect(D.BiasToC1, C1.Bias) annotation(
    Line(points = {{-20, 2}, {-62, 2}, {-62, 8}}, color = {0, 0, 127}));
  connect(D.BiasToC2, C2.Bias) annotation(
    Line(points = {{-20, -6}, {-62, -6}, {-62, -12}}, color = {0, 0, 127}));
  connect(C1.CS, D.CSfromC1) annotation(
    Line(points = {{-52, 14}, {-40, 14}, {-40, 6}, {-20, 6}}, color = {0, 0, 127}));
  connect(C2.CS, D.CSfromC2) annotation(
    Line(points = {{-52, -18}, {-40, -18}, {-40, -10}, {-20, -10}}, color = {0, 0, 127}));
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
    Line(points = {{22, 40}, {60, 40}, {60, 0}, {74, 0}}, color = {0, 0, 127}));
  connect(D.CS1, Pz1.Q_flow) annotation(
    Line(points = {{0, 2}, {10, 2}, {10, 20}, {20, 20}}, color = {0, 0, 127}));
  connect(D.CS2, Pz2.Q_flow) annotation(
    Line(points = {{0, -6}, {10, -6}, {10, -20}, {20, -20}}, color = {0, 0, 127}));
  connect(Cz1.port, sTz1.port) annotation(
    Line(points = {{140, 20}, {130, 20}, {130, -60}, {82, -60}}, color = {191, 0, 0}));
  connect(Cz2.port, sTz2.port) annotation(
    Line(points = {{140, -20}, {100, -20}, {100, -80}, {52, -80}}, color = {191, 0, 0}));
  connect(sTz1.T, C1.PV) annotation(
    Line(points = {{62, -60}, {-82, -60}, {-82, 18}, {-72, 18}}, color = {0, 0, 127}));
  connect(sTz2.T, C2.PV) annotation(
    Line(points = {{32, -80}, {-86, -80}, {-86, -22}, {-72, -22}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 7200, Tolerance = 1e-6, Interval = 1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end Thermal_zones_case_01;