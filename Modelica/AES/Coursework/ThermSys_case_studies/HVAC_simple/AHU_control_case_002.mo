within AES.Coursework.ThermSys_case_studies.HVAC_simple;

model AHU_control_case_002
  extends Icons.CourseworkModel;
  AES.ProcessComponents.Thermal.Air.Fan_controlled_q fan(qmax = 0.5) annotation(
    Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression qcmd(y = 1) annotation(
    Placement(visible = true, transformation(origin = {-90, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.HVAC.ControlledAHU U1 annotation(
    Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression spTret(y = if time < 5000 then 273.15 + 20 else 273.15 + 18) annotation(
    Placement(visible = true, transformation(origin = {-230, 116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression spphi(y = 0.55) annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression AHUon(y = true) annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Air.MAvolume Room2(Tstart(displayUnit = "K") , V = 5 * 5 * 3, phistart = 0.6) annotation(
    Placement(visible = true, transformation(origin = {100, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Air.MAvolume Room1(Tstart(displayUnit = "K") , V = 5 * 5 * 3, phistart = 0.6) annotation(
    Placement(visible = true, transformation(origin = {100, 100}, extent = {{-20, 20}, {20, -20}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Air.DPlin_NomPoint dpin1 annotation(
    Placement(visible = true, transformation(origin = {50, 100}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Air.DPlin_NomPoint dpin2 annotation(
    Placement(visible = true, transformation(origin = {50, -80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Air.DPlin_NomPoint dprec1 annotation(
    Placement(visible = true, transformation(origin = {48, 140}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Air.DPlin_NomPoint dprec2 annotation(
    Placement(visible = true, transformation(origin = {50, -120}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Air.Node_pTphi_prescribed amb annotation(
    Placement(visible = true, transformation(origin = {-110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression pamb(y = 101325)  annotation(
    Placement(visible = true, transformation(origin = {-172, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Tamb(y = 273.15 + 30)  annotation(
    Placement(visible = true, transformation(origin = {-172, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression phiamb(y = 0.9)  annotation(
    Placement(visible = true, transformation(origin = {-172, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature pTamb annotation(
    Placement(visible = true, transformation(origin = {-110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor conv1a(G = 2 * 10 * 3)  annotation(
    Placement(visible = true, transformation(origin = {100, 52}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor conv2a(G = 2 * 10 * 3)  annotation(
    Placement(visible = true, transformation(origin = {100, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  AES.ProcessComponents.Thermal.Air.Tsensor sTret annotation(
    Placement(visible = true, transformation(origin = {-114, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_basic PI_Tret(CSmax = 273.15 + 25, CSmin = 273.15 + 15, Ti = 100)  annotation(
    Placement(visible = true, transformation(origin = {-170, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Air.Tsensor tsensor annotation(
    Placement(visible = true, transformation(origin = {172, 100}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow LocalActuator_Room1 annotation(
    Placement(visible = true, transformation(origin = {170, 70}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_basic PI_Room1(CSmax = 1500, CSmin = -1500, K = 100, Ti = 30)  annotation(
    Placement(visible = true, transformation(origin = {210, 70}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression spTroom1(y = 273.15 + 19 + 0.5 * sign(sin(time / 1000)))  annotation(
    Placement(visible = true, transformation(origin = {270, 76}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(fan.air_flange2, U1.air_flange1) annotation(
    Line(points = {{-58, 50}, {-18, 50}}, color = {0, 100, 150}));
  connect(qcmd.y, fan.qcmd01) annotation(
    Line(points = {{-79, 70}, {-70, 70}, {-70, 54}}, color = {0, 0, 127}));
  connect(spphi.y, U1.phisp) annotation(
    Line(points = {{-79, 90}, {-53, 90}, {-53, 54}, {-23, 54}}, color = {0, 0, 127}));
  connect(AHUon.y, U1.ON) annotation(
    Line(points = {{-39, 30}, {-28.5, 30}, {-28.5, 44}, {-22, 44}}, color = {255, 0, 255}));
  connect(dpin1.air_flange1, Room1.air_flange1) annotation(
    Line(points = {{62, 100}, {76, 100}}, color = {0, 100, 150}));
  connect(dpin2.air_flange1, Room2.air_flange1) annotation(
    Line(points = {{62, -80}, {76, -80}}, color = {0, 100, 150}));
  connect(U1.air_flange2, dpin1.air_flange2) annotation(
    Line(points = {{2, 50}, {20, 50}, {20, 100}, {38, 100}}, color = {0, 100, 150}));
  connect(U1.air_flange2, dpin2.air_flange2) annotation(
    Line(points = {{2, 50}, {20, 50}, {20, -80}, {38, -80}}, color = {0, 100, 150}));
  connect(dprec1.air_flange1, Room1.air_flange2) annotation(
    Line(points = {{60, 140}, {141, 140}, {141, 100}, {124, 100}}, color = {0, 100, 150}));
  connect(dprec2.air_flange1, Room2.air_flange2) annotation(
    Line(points = {{62, -120}, {140, -120}, {140, -80}, {124, -80}}, color = {0, 100, 150}));
  connect(dprec1.air_flange2, dprec2.air_flange2) annotation(
    Line(points = {{36, 140}, {28, 140}, {28, -120}, {38, -120}}, color = {0, 100, 150}));
  connect(fan.air_flange1, dprec2.air_flange2) annotation(
    Line(points = {{-82, 50}, {-90, 50}, {-90, -120}, {38, -120}}, color = {0, 100, 150}));
  connect(amb.air_flange1, fan.air_flange1) annotation(
    Line(points = {{-98, 50}, {-82, 50}}, color = {0, 100, 150}));
  connect(Tamb.y, amb.T) annotation(
    Line(points = {{-161, 50}, {-122, 50}}, color = {0, 0, 127}));
  connect(pamb.y, amb.p) annotation(
    Line(points = {{-161, 70}, {-130, 70}, {-130, 56}, {-120, 56}}, color = {0, 0, 127}));
  connect(phiamb.y, amb.phi) annotation(
    Line(points = {{-161, 30}, {-130, 30}, {-130, 44}, {-120, 44}}, color = {0, 0, 127}));
  connect(Tamb.y, pTamb.T) annotation(
    Line(points = {{-161, 50}, {-143, 50}, {-143, 10}, {-123, 10}}, color = {0, 0, 127}));
  connect(Room1.heatPort, conv1a.port_a) annotation(
    Line(points = {{100, 82}, {100, 62}}, color = {191, 0, 0}));
  connect(conv1a.port_b, conv2a.port_b) annotation(
    Line(points = {{100, 42}, {100, -20}}, color = {191, 0, 0}));
  connect(conv2a.port_a, Room2.heatPort) annotation(
    Line(points = {{100, -40}, {100, -62}}, color = {191, 0, 0}));
  connect(pTamb.port, conv1a.port_b) annotation(
    Line(points = {{-100, 10}, {100, 10}, {100, 42}}, color = {191, 0, 0}));
  connect(sTret.air_flange1, dprec2.air_flange2) annotation(
    Line(points = {{-102, -120}, {38, -120}}, color = {0, 100, 150}));
  connect(spTret.y, PI_Tret.SP) annotation(
    Line(points = {{-219, 116}, {-182, 116}}, color = {0, 0, 127}));
  connect(PI_Tret.CS, U1.Tsp) annotation(
    Line(points = {{-158, 110}, {-40, 110}, {-40, 58}, {-22, 58}}, color = {0, 0, 127}));
  connect(sTret.oT, PI_Tret.PV) annotation(
    Line(points = {{-112, -120}, {-200, -120}, {-200, 106}, {-182, 106}}, color = {0, 0, 127}));
  connect(LocalActuator_Room1.port, Room1.heatPort) annotation(
    Line(points = {{160, 70}, {100, 70}, {100, 82}}, color = {191, 0, 0}));
  connect(Room1.air_flange2, tsensor.air_flange1) annotation(
    Line(points = {{124, 100}, {160, 100}}, color = {0, 100, 150}));
  connect(LocalActuator_Room1.Q_flow, PI_Room1.CS) annotation(
    Line(points = {{180, 70}, {198, 70}}, color = {0, 0, 127}));
  connect(tsensor.oT, PI_Room1.PV) annotation(
    Line(points = {{170, 100}, {232, 100}, {232, 66}, {222, 66}}, color = {0, 0, 127}));
  connect(PI_Room1.SP, spTroom1.y) annotation(
    Line(points = {{222, 76}, {259, 76}}, color = {0, 0, 127}));
protected
  annotation(
    experiment(StartTime = 0, StopTime = 10000, Tolerance = 1e-6, Interval = 1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-300, -200}, {300, 200}})));
end AHU_control_case_002;