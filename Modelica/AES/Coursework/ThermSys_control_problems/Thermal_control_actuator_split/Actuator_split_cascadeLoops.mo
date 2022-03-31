within AES.Coursework.ThermSys_control_problems.Thermal_control_actuator_split;

model Actuator_split_cascadeLoops
  extends Icons.CourseworkModel;
  Modelica.Blocks.Sources.RealExpression SP(y = 293.15 + 5 * sign(sin(6.28 * time / 1800))) annotation(
    Placement(visible = true, transformation(origin = {-170, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.ActuationSchemes.SplitRange01 SR(DeadZone = 0.05) annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder Act2(T = 20, k = -800) annotation(
    Placement(visible = true, transformation(origin = {50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder Act1(T = 5, k = 1000) annotation(
    Placement(visible = true, transformation(origin = {50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature Tamb(T(displayUnit = "K") = 293.15)  annotation(
    Placement(visible = true, transformation(origin = {50, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor sT annotation(
    Placement(visible = true, transformation(origin = {10, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Cap(C = 1e4, T(displayUnit = "K"))  annotation(
    Placement(visible = true, transformation(origin = {162, 10}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor Gloss(G = 100)  annotation(
    Placement(visible = true, transformation(origin = {90, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow Pa1 annotation(
    Placement(visible = true, transformation(origin = {90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow Pa2 annotation(
    Placement(visible = true, transformation(origin = {90, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_basic CT(K = 1, Ti = 100)  annotation(
    Placement(visible = true, transformation(origin = {-110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_basic CA1(CSmin = 0,K = 0.25, Ti = 5) annotation(
    Placement(visible = true, transformation(origin = {10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_basic CA2(CSmin = 0,K = -1.25, Ti = 20) annotation(
    Placement(visible = true, transformation(origin = {10, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain pm1(k = 1000)  annotation(
    Placement(visible = true, transformation(origin = {-28, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain pm2(k = -800) annotation(
    Placement(visible = true, transformation(origin = {-30, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Act1.y, Pa1.Q_flow) annotation(
    Line(points = {{61, 30}, {79, 30}}, color = {0, 0, 127}));
  connect(Act2.y, Pa2.Q_flow) annotation(
    Line(points = {{61, -10}, {79, -10}}, color = {0, 0, 127}));
  connect(Tamb.port, Gloss.port_a) annotation(
    Line(points = {{60, 70}, {80, 70}}, color = {191, 0, 0}));
  connect(Gloss.port_b, Cap.port) annotation(
    Line(points = {{100, 70}, {120, 70}, {120, 10}, {142, 10}}, color = {191, 0, 0}));
  connect(Pa1.port, Cap.port) annotation(
    Line(points = {{100, 30}, {120, 30}, {120, 10}, {142, 10}}, color = {191, 0, 0}));
  connect(Pa2.port, Cap.port) annotation(
    Line(points = {{100, -10}, {120, -10}, {120, 10}, {142, 10}}, color = {191, 0, 0}));
  connect(Cap.port, sT.port) annotation(
    Line(points = {{142, 10}, {120, 10}, {120, -50}, {20, -50}}, color = {191, 0, 0}));
  connect(CT.PV, sT.T) annotation(
    Line(points = {{-122, 6}, {-140, 6}, {-140, -50}, {0, -50}}, color = {0, 0, 127}));
  connect(SP.y, CT.SP) annotation(
    Line(points = {{-159, 16}, {-122, 16}}, color = {0, 0, 127}));
  connect(CT.CS, SR.CSi01) annotation(
    Line(points = {{-98, 10}, {-82, 10}}, color = {0, 0, 127}));
  connect(CA1.CS, Act1.u) annotation(
    Line(points = {{22, 30}, {38, 30}}, color = {0, 0, 127}));
  connect(Act1.y, CA1.PV) annotation(
    Line(points = {{61, 30}, {69, 30}, {69, 12}, {-11, 12}, {-11, 26}, {-3, 26}}, color = {0, 0, 127}));
  connect(CA2.CS, Act2.u) annotation(
    Line(points = {{22, -10}, {38, -10}}, color = {0, 0, 127}));
  connect(Act2.y, CA2.PV) annotation(
    Line(points = {{61, -10}, {69, -10}, {69, -28}, {-11, -28}, {-11, -14}, {-3, -14}}, color = {0, 0, 127}));
  connect(SR.CSo01_neg, pm2.u) annotation(
    Line(points = {{-58, 4}, {-50, 4}, {-50, -4}, {-42, -4}}, color = {0, 0, 127}));
  connect(SR.CSo01_pos, pm1.u) annotation(
    Line(points = {{-58, 16}, {-50, 16}, {-50, 36}, {-40, 36}}, color = {0, 0, 127}));
  connect(pm1.y, CA1.SP) annotation(
    Line(points = {{-16, 36}, {-2, 36}}, color = {0, 0, 127}));
  connect(pm2.y, CA2.SP) annotation(
    Line(points = {{-18, -4}, {-2, -4}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 3000, Tolerance = 1e-6, Interval = 1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end Actuator_split_cascadeLoops;