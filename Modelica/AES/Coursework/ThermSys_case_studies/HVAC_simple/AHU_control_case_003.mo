within AES.Coursework.ThermSys_case_studies.HVAC_simple;

model AHU_control_case_003
  extends Icons.CourseworkModel;
  AES.ProcessComponents.Thermal.Air.Fan_controlled_q fan(qmax = 0.5) annotation(
    Placement(visible = true, transformation(origin = {-110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression qcmd(y = 1) annotation(
    Placement(visible = true, transformation(origin = {-130, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.HVAC.ControlledAHU U1 annotation(
    Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression spTret(y = if time < 5000 then 273.15 + 22 else 273.15 + 20) annotation(
    Placement(visible = true, transformation(origin = {-270, 116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression spphi(y = 0.55) annotation(
    Placement(visible = true, transformation(origin = {-130, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression AHUon(y = true) annotation(
    Placement(visible = true, transformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Air.MAvolume Room2(Tstart(displayUnit = "K") , V = 5 * 5 * 3, phistart = 0.6) annotation(
    Placement(visible = true, transformation(origin = {100, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Air.MAvolume Room1(Tstart(displayUnit = "K") , V = 5 * 5 * 3, phistart = 0.6) annotation(
    Placement(visible = true, transformation(origin = {102, 100}, extent = {{-20, 20}, {20, -20}}, rotation = 0)));
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
    Placement(visible = true, transformation(origin = {60, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  AES.ProcessComponents.Thermal.Air.Tsensor sTret annotation(
    Placement(visible = true, transformation(origin = {-154, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_basic PI_Tret(CSmax = 273.15 + 25, CSmin = 273.15 + 15, Ti = 100)  annotation(
    Placement(visible = true, transformation(origin = {-210, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Air.Tsensor sTroom1 annotation(
    Placement(visible = true, transformation(origin = {172, 100}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow LocalActuator_Room1 annotation(
    Placement(visible = true, transformation(origin = {100, 50}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_basic PI_Room1(CSmax = 1, CSmin = 0, K = -0.5, Ti = 30)  annotation(
    Placement(visible = true, transformation(origin = {226, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression spTroom1(y = 273.15 + 21 + 0.5 * sign(sin(time / 1000)))  annotation(
    Placement(visible = true, transformation(origin = {274, 42}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Air.damper_linear damperRoom1 annotation(
    Placement(visible = true, transformation(origin = {40, 100}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain Pcmax1(k = -1500)  annotation(
    Placement(visible = true, transformation(origin = {150, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  AES.ProcessComponents.Thermal.Air.Tsensor sTroom2 annotation(
    Placement(visible = true, transformation(origin = {170, -80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ControlBlocks.ActuationSchemes.DaisyChain_uniform DCroom1 annotation(
    Placement(visible = true, transformation(origin = {190, 74}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(fan.air_flange2, U1.air_flange1) annotation(
    Line(points = {{-98, 50}, {-58, 50}}, color = {0, 100, 150}));
  connect(qcmd.y, fan.qcmd01) annotation(
    Line(points = {{-119, 70}, {-110, 70}, {-110, 54}}, color = {0, 0, 127}));
  connect(spphi.y, U1.phisp) annotation(
    Line(points = {{-119, 90}, {-93, 90}, {-93, 54}, {-63, 54}}, color = {0, 0, 127}));
  connect(AHUon.y, U1.ON) annotation(
    Line(points = {{-79, 30}, {-68.5, 30}, {-68.5, 44}, {-62, 44}}, color = {255, 0, 255}));
  connect(U1.air_flange2, dpin1.air_flange2) annotation(
    Line(points = {{-38, 50}, {-20, 50}, {-20, 100}, {-2, 100}}, color = {0, 100, 150}));
  connect(U1.air_flange2, dpin2.air_flange2) annotation(
    Line(points = {{-38, 50}, {-20, 50}, {-20, -80}, {-2, -80}}, color = {0, 100, 150}));
  connect(dprec1.air_flange1, Room1.air_flange2) annotation(
    Line(points = {{60, 140}, {141, 140}, {141, 100}, {126, 100}}, color = {0, 100, 150}));
  connect(dprec2.air_flange1, Room2.air_flange2) annotation(
    Line(points = {{22, -120}, {140, -120}, {140, -80}, {124, -80}}, color = {0, 100, 150}));
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
    Line(points = {{60, 20}, {60, 0}}, color = {191, 0, 0}));
  connect(conv2a.port_a, Room2.heatPort) annotation(
    Line(points = {{60, -20}, {60, -51}, {100, -51}, {100, -62}}, color = {191, 0, 0}));
  connect(pTamb.port, conv1a.port_b) annotation(
    Line(points = {{-140, 10}, {60, 10}, {60, 20}}, color = {191, 0, 0}));
  connect(sTret.air_flange1, dprec2.air_flange2) annotation(
    Line(points = {{-142.1, -120}, {-2.1, -120}}, color = {0, 100, 150}));
  connect(spTret.y, PI_Tret.SP) annotation(
    Line(points = {{-259, 116}, {-222, 116}}, color = {0, 0, 127}));
  connect(PI_Tret.CS, U1.Tsp) annotation(
    Line(points = {{-198, 110}, {-80, 110}, {-80, 58}, {-62, 58}}, color = {0, 0, 127}));
  connect(sTret.oT, PI_Tret.PV) annotation(
    Line(points = {{-152, -120}, {-240, -120}, {-240, 106}, {-222, 106}}, color = {0, 0, 127}));
  connect(LocalActuator_Room1.port, Room1.heatPort) annotation(
    Line(points = {{100, 60}, {100, 70}, {102, 70}, {102, 82}}, color = {191, 0, 0}));
  connect(Room1.air_flange2, sTroom1.air_flange1) annotation(
    Line(points = {{126, 100}, {160, 100}}, color = {0, 100, 150}));
  connect(PI_Room1.SP, spTroom1.y) annotation(
    Line(points = {{238, 46}, {250.5, 46}, {250.5, 42}, {263, 42}}, color = {0, 0, 127}));
  connect(Room1.heatPort, conv1a.port_a) annotation(
    Line(points = {{102, 82}, {102, 70}, {60, 70}, {60, 40}}, color = {191, 0, 0}));
  connect(damperRoom1.air_flange1, dpin1.air_flange1) annotation(
    Line(points = {{28, 100}, {22, 100}}, color = {0, 100, 150}));
  connect(damperRoom1.air_flange2, Room1.air_flange1) annotation(
    Line(points = {{52, 100}, {78, 100}}, color = {0, 100, 150}));
  connect(Room2.air_flange2, sTroom2.air_flange1) annotation(
    Line(points = {{124, -80}, {158, -80}}, color = {0, 100, 150}));
  connect(Pcmax1.y, LocalActuator_Room1.Q_flow) annotation(
    Line(points = {{140, 30}, {100, 30}, {100, 40}}, color = {0, 0, 127}));
  connect(sTroom1.oT, PI_Room1.PV) annotation(
    Line(points = {{170, 100}, {254, 100}, {254, 36}, {238, 36}}, color = {0, 0, 127}));
  connect(DCroom1.CSi01, PI_Room1.CS) annotation(
    Line(points = {{202, 74}, {210, 74}, {210, 40}, {214, 40}}, color = {0, 0, 127}));
  connect(DCroom1.CSo01[1], damperRoom1.x) annotation(
    Line(points = {{178, 74}, {40, 74}, {40, 90}}, color = {0, 0, 127}));
  connect(dpin2.air_flange1, Room2.air_flange1) annotation(
    Line(points = {{22, -80}, {76, -80}}, color = {0, 100, 150}));
  connect(DCroom1.CSo01[2], Pcmax1.u) annotation(
    Line(points = {{178, 74}, {172, 74}, {172, 30}, {162, 30}}, color = {0, 0, 127}));
protected
  annotation(
    experiment(StartTime = 0, StopTime = 10000, Tolerance = 1e-6, Interval = 1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-300, -200}, {300, 200}})));
end AHU_control_case_003;