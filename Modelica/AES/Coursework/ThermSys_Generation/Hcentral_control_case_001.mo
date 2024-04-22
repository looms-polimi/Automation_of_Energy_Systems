within AES.Coursework.ThermSys_Generation;

model Hcentral_control_case_001
  extends Icons.CourseworkModel;
  Modelica.Blocks.Continuous.FirstOrder FlowCtrl(T = 5, y_start = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-30, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.HVAC.ControlledLiquidHeater_lim H(Pmax = 1e6, Tcl = 20, Tstart = 273.15 + 20, V = 5) annotation(
    Placement(visible = true, transformation(origin = {-110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.DiffPressureSensor sdp annotation(
    Placement(visible = true, transformation(origin = {70, -28}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_basic PI_dpHC(CSmin = 0, K = 1e-6, Ti = 5) annotation(
    Placement(visible = true, transformation(origin = {30, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Pump_centrifugal P(dp00 = 1500000, dpn0 = 1200000, wn0 = 20) annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube line(Di(displayUnit = "km"),L = 1000, dz(displayUnit = "Gm"), n = 30, wnom = 5) annotation(
    Placement(visible = true, transformation(origin = {112, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner AES.ProcessComponents.Thermal.System_settings.System_liquid system annotation(
    Placement(visible = true, transformation(origin = {-270, 132}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner AES.ProcessComponents.Thermal.System_settings.System_terrain terrain annotation(
    Placement(visible = true, transformation(origin = {-230, 132}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube load(L = 100, wnom = 5) annotation(
    Placement(transformation(origin = {140, -60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  AES.ProcessComponents.Thermal.Liquid.surfTcond_fixed Tload annotation(
    Placement(visible = true, transformation(origin = {170, -62}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.RealExpression spdpHC(y = 5e5) annotation(
    Placement(visible = true, transformation(origin = {90, 56}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression spTo(y = 273.15 + 95) annotation(
    Placement(visible = true, transformation(origin = {-214, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression Hon(y = true) annotation(
    Placement(visible = true, transformation(origin = {-214, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.ExpansionVessel_isoT EV(V = 5, p0 = 399999.9999999999) annotation(
    Placement(visible = true, transformation(origin = {-110, -92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.MassFlowrateSensor sw annotation(
    Placement(visible = true, transformation(origin = {-68, -98}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_basic PI_wh(CSmin = 0, K = 0.2, Ti = 1) annotation(
    Placement(visible = true, transformation(origin = {-8, -48}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression spw(y = 5) annotation(
    Placement(visible = true, transformation(origin = {34, -42}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Valve_linear Vload annotation(
    Placement(visible = true, transformation(origin = {140, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.RealExpression xload(y = if sin(time/500) > 0 then 0.1 else 0.9) annotation(
    Placement(visible = true, transformation(origin = {170, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.Liquid.Valve_linear Vrec(dpnom = 99999.99999999999, wnom = 5) annotation(
    Placement(visible = true, transformation(origin = {-42, -48}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(PI_dpHC.CS, FlowCtrl.u) annotation(
    Line(points = {{18, 50}, {-18, 50}}, color = {0, 0, 127}));
  connect(H.pwh_b, P.pwh_a) annotation(
    Line(points = {{-98, 10}, {-82, 10}}, color = {46, 52, 54}));
  connect(FlowCtrl.y, P.cmd) annotation(
    Line(points = {{-41, 50}, {-70, 50}, {-70, 18}}, color = {0, 0, 127}));
  connect(load.pwh_b, sdp.pwh_lo) annotation(
    Line(points = {{140, -72}, {140, -98}, {58, -98}, {58, -34}}, color = {46, 52, 54}));
  connect(load.surf, Tload.surf) annotation(
    Line(points = {{145, -60}, {155.2, -60}, {155.2, -62}, {161.4, -62}}, color = {144, 5, 5}));
  connect(PI_dpHC.SP, spdpHC.y) annotation(
    Line(points = {{42, 56.2}, {80, 56.2}}, color = {0, 0, 127}));
  connect(EV.pwh_a, H.pwh_a) annotation(
    Line(points = {{-122, -98}, {-132, -98}, {-132, 10}, {-122, 10}}, color = {46, 52, 54}));
  connect(PI_dpHC.PV, sdp.oDp) annotation(
    Line(points = {{42, 45.6}, {80, 45.6}, {80, -28.4}, {68, -28.4}}, color = {0, 0, 127}));
  connect(Hon.y, H.ON) annotation(
    Line(points = {{-203, 4}, {-122, 4}}, color = {255, 0, 255}));
  connect(P.pwh_b, line.pwh_a) annotation(
    Line(points = {{-58, 10}, {100, 10}}, color = {46, 52, 54}));
  connect(P.pwh_b, sdp.pwh_hi) annotation(
    Line(points = {{-58, 10}, {58, 10}, {58, -22}}, color = {46, 52, 54}));
  connect(sw.ow, PI_wh.PV) annotation(
    Line(points = {{-68, -90}, {-68, -70}, {14, -70}, {14, -52}, {4, -52}}, color = {0, 0, 127}));
  connect(spw.y, PI_wh.SP) annotation(
    Line(points = {{23, -42}, {4, -42}}, color = {0, 0, 127}));
  connect(EV.pwh_b, sw.pwh_b) annotation(
    Line(points = {{-98, -98}, {-80, -98}}, color = {46, 52, 54}));
  connect(sw.pwh_a, sdp.pwh_lo) annotation(
    Line(points = {{-56, -98}, {58, -98}, {58, -34}}, color = {46, 52, 54}));
  connect(line.pwh_b, Vload.pwh_a) annotation(
    Line(points = {{124, 10}, {140, 10}, {140, -8}}, color = {46, 52, 54}));
  connect(Vload.pwh_b, load.pwh_a) annotation(
    Line(points = {{140, -32}, {140, -48}}, color = {46, 52, 54}));
  connect(Vload.x, xload.y) annotation(
    Line(points = {{150, -20}, {160, -20}}, color = {0, 0, 127}));
  connect(spTo.y, H.To) annotation(
    Line(points = {{-202, 22}, {-176, 22}, {-176, 16}, {-122, 16}}, color = {0, 0, 127}));
  connect(PI_wh.CS, Vrec.x) annotation(
    Line(points = {{-20, -48}, {-32, -48}}, color = {0, 0, 127}));
  connect(sw.pwh_a, Vrec.pwh_b) annotation(
    Line(points = {{-56, -98}, {-42, -98}, {-42, -60}}, color = {46, 52, 54}));
  connect(P.pwh_b, Vrec.pwh_a) annotation(
    Line(points = {{-58, 10}, {-42, 10}, {-42, -36}}, color = {46, 52, 54}));
  annotation(
    experiment(StartTime = 0, StopTime = 10000, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=stateselection",
    __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"),
    Diagram(coordinateSystem(extent = {{-300, -160}, {300, 160}})),
    Icon(coordinateSystem(extent = {{-300, -160}, {300, 160}})));
end Hcentral_control_case_001;