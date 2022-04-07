within AES.Coursework.ThermSys_case_studies.HVAC_simple;

model AHU_control_case_003a
  extends Icons.CourseworkModel;
  AES.ProcessComponents.Thermal.Air.Fan_controlled_q fan(qmax = 0.5) annotation(
    Placement(visible = true, transformation(origin = {-110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression qcmd(y = 1) annotation(
    Placement(visible = true, transformation(origin = {-130, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Air.MAvolume Room2(Tstart(displayUnit = "K") , V = 5 * 5 * 3, phistart = 0.6) annotation(
    Placement(visible = true, transformation(origin = {60, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Air.MAvolume Room1(Tstart(displayUnit = "K") , V = 5 * 5 * 3, phistart = 0.6) annotation(
    Placement(visible = true, transformation(origin = {100, 100}, extent = {{-20, 20}, {20, -20}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Air.DPlin_NomPoint dpin1 annotation(
    Placement(visible = true, transformation(origin = {10, 100}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Air.DPlin_NomPoint dpin2 annotation(
    Placement(visible = true, transformation(origin = {10, -80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Air.DPlin_NomPoint dprec1 annotation(
    Placement(visible = true, transformation(origin = {48, 140}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Air.DPlin_NomPoint dprec2 annotation(
    Placement(visible = true, transformation(origin = {10, -120}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Air.Node_pTphi_prescribed amb annotation(
    Placement(visible = true, transformation(origin = {-150, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression pamb(y = 101325)  annotation(
    Placement(visible = true, transformation(origin = {-212, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Tamb(y = 273.15 + 30)  annotation(
    Placement(visible = true, transformation(origin = {-212, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression phiamb(y = 0.9)  annotation(
    Placement(visible = true, transformation(origin = {-212, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature pTamb annotation(
    Placement(visible = true, transformation(origin = {-150, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor conv1a(G = 2 * 10 * 3)  annotation(
    Placement(visible = true, transformation(origin = {60, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor conv2a(G = 2 * 10 * 3)  annotation(
    Placement(visible = true, transformation(origin = {60, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  AES.ProcessComponents.Thermal.Air.Tsensor sTret annotation(
    Placement(visible = true, transformation(origin = {-154, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Air.Tsensor tsensor annotation(
    Placement(visible = true, transformation(origin = {172, 100}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow LocalActuator_Room1 annotation(
    Placement(visible = true, transformation(origin = {100, 50}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_basic PI_Room1(CSmax = 1, CSmin = -1, K = 0.5, Ti = 30)  annotation(
    Placement(visible = true, transformation(origin = {210, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression spTroom1(y = 273.15 + 21 + 0.5 * sign(sin(time / 1000)))  annotation(
    Placement(visible = true, transformation(origin = {258, -4}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Air.damper_linear damperRoom1 annotation(
    Placement(visible = true, transformation(origin = {40, 100}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  AES.ControlBlocks.ActuationSchemes.SplitRange01 SR_room1 annotation(
    Placement(visible = true, transformation(origin = {170, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain Pcmax(k = -1500)  annotation(
    Placement(visible = true, transformation(origin = {100, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.RealExpression uDampR1(y = 1 - SR_room1.CSo01_pos) annotation(
    Placement(visible = true, transformation(origin = {40, 68}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
equation
  connect(qcmd.y, fan.qcmd01) annotation(
    Line(points = {{-119, 70}, {-110, 70}, {-110, 54}}, color = {0, 0, 127}));
  connect(dpin2.air_flange1, Room2.air_flange1) annotation(
    Line(points = {{22, -80}, {36, -80}}, color = {0, 100, 150}));
  connect(dprec1.air_flange1, Room1.air_flange2) annotation(
    Line(points = {{60, 140}, {141, 140}, {141, 100}, {124, 100}}, color = {0, 100, 150}));
  connect(dprec2.air_flange1, Room2.air_flange2) annotation(
    Line(points = {{22, -120}, {100, -120}, {100, -80}, {84, -80}}, color = {0, 100, 150}));
  connect(dprec1.air_flange2, dprec2.air_flange2) annotation(
    Line(points = {{36, 140}, {-12, 140}, {-12, -120}, {-2, -120}}, color = {0, 100, 150}));
  connect(fan.air_flange1, dprec2.air_flange2) annotation(
    Line(points = {{-122, 50}, {-130, 50}, {-130, -120}, {-2, -120}}, color = {0, 100, 150}));
  connect(amb.air_flange1, fan.air_flange1) annotation(
    Line(points = {{-138, 50}, {-122, 50}}, color = {0, 100, 150}));
  connect(Tamb.y, amb.T) annotation(
    Line(points = {{-201, 50}, {-162, 50}}, color = {0, 0, 127}));
  connect(pamb.y, amb.p) annotation(
    Line(points = {{-201, 70}, {-170, 70}, {-170, 56}, {-160, 56}}, color = {0, 0, 127}));
  connect(phiamb.y, amb.phi) annotation(
    Line(points = {{-201, 30}, {-170, 30}, {-170, 44}, {-160, 44}}, color = {0, 0, 127}));
  connect(Tamb.y, pTamb.T) annotation(
    Line(points = {{-201, 50}, {-183, 50}, {-183, 10}, {-163, 10}}, color = {0, 0, 127}));
  connect(conv1a.port_b, conv2a.port_b) annotation(
    Line(points = {{60, 20}, {60, -20}}, color = {191, 0, 0}));
  connect(conv2a.port_a, Room2.heatPort) annotation(
    Line(points = {{60, -40}, {60, -62}}, color = {191, 0, 0}));
  connect(pTamb.port, conv1a.port_b) annotation(
    Line(points = {{-140, 10}, {60, 10}, {60, 20}}, color = {191, 0, 0}));
  connect(sTret.air_flange1, dprec2.air_flange2) annotation(
    Line(points = {{-142.1, -120}, {-2.1, -120}}, color = {0, 100, 150}));
  connect(LocalActuator_Room1.port, Room1.heatPort) annotation(
    Line(points = {{100, 60}, {100, 82}}, color = {191, 0, 0}));
  connect(Room1.air_flange2, tsensor.air_flange1) annotation(
    Line(points = {{124, 100}, {160, 100}}, color = {0, 100, 150}));
  connect(tsensor.oT, PI_Room1.PV) annotation(
    Line(points = {{170, 100}, {232, 100}, {232, -14}, {222, -14}}, color = {0, 0, 127}));
  connect(PI_Room1.SP, spTroom1.y) annotation(
    Line(points = {{222, -3.8}, {247, -3.8}}, color = {0, 0, 127}));
  connect(Room1.heatPort, conv1a.port_a) annotation(
    Line(points = {{100, 82}, {100, 70}, {60, 70}, {60, 40}}, color = {191, 0, 0}));
  connect(damperRoom1.air_flange1, dpin1.air_flange1) annotation(
    Line(points = {{28, 100}, {22, 100}}, color = {0, 100, 150}));
  connect(damperRoom1.air_flange2, Room1.air_flange1) annotation(
    Line(points = {{52, 100}, {76, 100}}, color = {0, 100, 150}));
  connect(SR_room1.CSi01, PI_Room1.CS) annotation(
    Line(points = {{182, -10}, {198, -10}}, color = {0, 0, 127}));
  connect(SR_room1.CSo01_neg, Pcmax.u) annotation(
    Line(points = {{158, -16}, {100, -16}, {100, -2}}, color = {0, 0, 127}));
  connect(Pcmax.y, LocalActuator_Room1.Q_flow) annotation(
    Line(points = {{100, 21}, {100, 40}}, color = {0, 0, 127}));
  connect(uDampR1.y, damperRoom1.x) annotation(
    Line(points = {{40, 80}, {40, 90}}, color = {0, 0, 127}));
  connect(fan.air_flange2, dpin1.air_flange2) annotation(
    Line(points = {{-98, 50}, {-30, 50}, {-30, 100}, {-2, 100}}, color = {0, 100, 150}));
  connect(fan.air_flange2, dpin2.air_flange2) annotation(
    Line(points = {{-98, 50}, {-30, 50}, {-30, -80}, {-2, -80}}, color = {0, 100, 150}));
protected
  annotation(
    experiment(StartTime = 0, StopTime = 10000, Tolerance = 1e-6, Interval = 1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-300, -200}, {300, 200}})));
end AHU_control_case_003a;