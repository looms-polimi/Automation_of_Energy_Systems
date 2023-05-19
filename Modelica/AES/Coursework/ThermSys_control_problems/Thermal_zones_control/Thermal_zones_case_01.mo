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
    Placement(visible = true, transformation(origin = {80, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Blocks.Sources.RealExpression SP2(y = 293.15) annotation(
    Placement(visible = true, transformation(origin = {-144, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression SP1(y = 293.15 + 5 * sign(sin(6.28 * time / 3600))) annotation(
    Placement(visible = true, transformation(origin = {-144, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.TITOdecoupler_zeroInit D(Fcs1d = {1}, Fcs2d = {1}, P11d = {1}, P11n = {1.3}, P12d = {1}, P12n = {1}, P21d = {1}, P21n = {1}, P22d = {1}, P22n = {1.3}) annotation(
    Placement(visible = true, transformation(origin = {-12, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_full C1(CSmax = 1000, CSmin = 0, K = 300, Ti = 100, hasBias = false) annotation(
    Placement(visible = true, transformation(origin = {-85.5, 71}, extent = {{5.5, 11}, {-5.5, -11}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_full C2(CSmax = 1000, CSmin = 0,K = 300, Ti = 100, hasBias = false) annotation(
    Placement(visible = true, transformation(origin = {-64, -42}, extent = {{-10, -20}, {10, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Ta(y =  278.15) annotation(
    Placement(visible = true, transformation(origin = {10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Gcoupling(y = if sin(6.28 *time / 900) > 0.8 then 50 else 10) annotation(
    Placement(visible = true, transformation(origin = {10, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor sTz1 annotation(
    Placement(visible = true, transformation(origin = {72, -60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor sTz2 annotation(
    Placement(visible = true, transformation(origin = {42, -80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(SP1.y, C1.SP) annotation(
    Line(points = {{-133, 14}, {-102.5, 14}, {-102.5, 56}, {-80, 56}}, color = {0, 0, 127}));
  connect(SP2.y, C2.SP) annotation(
    Line(points = {{-133, -18}, {-104.5, -18}, {-104.5, -14}, {-74, -14}}, color = {0, 0, 127}));
  connect(D.BiasToC1, C1.Bias) annotation(
    Line(points = {{-22, -2}, {-22, 49}, {-85.5, 49}}, color = {0, 0, 127}));
  connect(D.BiasToC2, C2.Bias) annotation(
    Line(points = {{-22, -10}, {-22, 12}, {-64, 12}, {-64, -2}}, color = {0, 0, 127}));
  connect(C1.CS, D.CSfromC1) annotation(
    Line(points = {{-91, 56}, {-40, 56}, {-40, 2}, {-22, 2}}, color = {0, 0, 127}));
  connect(C2.CS, D.CSfromC2) annotation(
    Line(points = {{-54, -14}, {-22, -14}}, color = {0, 0, 127}));
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
  connect(D.CS1, Pz1.Q_flow) annotation(
    Line(points = {{-2, -2}, {10, -2}, {10, 20}, {20, 20}}, color = {0, 0, 127}));
  connect(D.CS2, Pz2.Q_flow) annotation(
    Line(points = {{-2, -10}, {10, -10}, {10, -20}, {20, -20}}, color = {0, 0, 127}));
  connect(Cz1.port, sTz1.port) annotation(
    Line(points = {{140, 20}, {130, 20}, {130, -60}, {82, -60}}, color = {191, 0, 0}));
  connect(Cz2.port, sTz2.port) annotation(
    Line(points = {{140, -20}, {100, -20}, {100, -80}, {52, -80}}, color = {191, 0, 0}));
  connect(sTz1.T, C1.PV) annotation(
    Line(points = {{62, -60}, {-80, -60}, {-80, 60}}, color = {0, 0, 127}));
  connect(sTz2.T, C2.PV) annotation(
    Line(points = {{32, -80}, {-74, -80}, {-74, -22}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 7200, Tolerance = 1e-6, Interval = 1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end Thermal_zones_case_01;