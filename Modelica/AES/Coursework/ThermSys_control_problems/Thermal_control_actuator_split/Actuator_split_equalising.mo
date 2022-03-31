within AES.Coursework.ThermSys_control_problems.Thermal_control_actuator_split;

model Actuator_split_equalising
  extends Icons.CourseworkModel;
  Modelica.Blocks.Sources.RealExpression SP(y = 293.15 + 5 * sign(sin(6.28 * time / 1800))) annotation(
    Placement(visible = true, transformation(origin = {-150, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.ActuationSchemes.SplitRange01 SR(DeadZone = 0.05) annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction FA2(a = {0.8}, b = {1}) annotation(
    Placement(visible = true, transformation(origin = {-10, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction FA1(a = {20, 1}, b = {5, 1}) annotation(
    Placement(visible = true, transformation(origin = {-10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder Act2(T = 20, k = -800) annotation(
    Placement(visible = true, transformation(origin = {30, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder Act1(T = 5, k = 1000) annotation(
    Placement(visible = true, transformation(origin = {30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature Tamb(T(displayUnit = "K") = 293.15)  annotation(
    Placement(visible = true, transformation(origin = {30, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor sT annotation(
    Placement(visible = true, transformation(origin = {-10, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Cap(C = 1e4, T(displayUnit = "K"))  annotation(
    Placement(visible = true, transformation(origin = {142, 10}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor Gloss(G = 100)  annotation(
    Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow Pa1 annotation(
    Placement(visible = true, transformation(origin = {70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow Pa2 annotation(
    Placement(visible = true, transformation(origin = {70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ControlBlocks.AnalogueControllers.PI_awfb_basic CT(K = 1, Ti = 100)  annotation(
    Placement(visible = true, transformation(origin = {-90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(SR.CSo01_neg, FA2.u) annotation(
    Line(points = {{-38, 4}, {-30, 4}, {-30, -10}, {-22, -10}}, color = {0, 0, 127}));
  connect(SR.CSo01_pos, FA1.u) annotation(
    Line(points = {{-38, 16}, {-30, 16}, {-30, 30}, {-22, 30}}, color = {0, 0, 127}));
  connect(FA2.y, Act2.u) annotation(
    Line(points = {{1, -10}, {17, -10}}, color = {0, 0, 127}));
  connect(FA1.y, Act1.u) annotation(
    Line(points = {{1, 30}, {17, 30}}, color = {0, 0, 127}));
  connect(Act1.y, Pa1.Q_flow) annotation(
    Line(points = {{42, 30}, {60, 30}}, color = {0, 0, 127}));
  connect(Act2.y, Pa2.Q_flow) annotation(
    Line(points = {{42, -10}, {60, -10}}, color = {0, 0, 127}));
  connect(Tamb.port, Gloss.port_a) annotation(
    Line(points = {{40, 70}, {60, 70}}, color = {191, 0, 0}));
  connect(Gloss.port_b, Cap.port) annotation(
    Line(points = {{80, 70}, {100, 70}, {100, 10}, {122, 10}}, color = {191, 0, 0}));
  connect(Pa1.port, Cap.port) annotation(
    Line(points = {{80, 30}, {100, 30}, {100, 10}, {122, 10}}, color = {191, 0, 0}));
  connect(Pa2.port, Cap.port) annotation(
    Line(points = {{80, -10}, {100, -10}, {100, 10}, {122, 10}}, color = {191, 0, 0}));
  connect(Cap.port, sT.port) annotation(
    Line(points = {{122, 10}, {100, 10}, {100, -50}, {0, -50}}, color = {191, 0, 0}));
  connect(CT.PV, sT.T) annotation(
    Line(points = {{-102, 6}, {-120, 6}, {-120, -50}, {-20, -50}}, color = {0, 0, 127}));
  connect(SP.y, CT.SP) annotation(
    Line(points = {{-138, 16}, {-102, 16}}, color = {0, 0, 127}));
  connect(CT.CS, SR.CSi01) annotation(
    Line(points = {{-78, 10}, {-62, 10}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 3000, Tolerance = 1e-6, Interval = 1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end Actuator_split_equalising;