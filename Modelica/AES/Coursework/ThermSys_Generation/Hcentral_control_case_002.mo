within AES.Coursework.ThermSys_Generation;

model Hcentral_control_case_002
  extends Icons.CourseworkModel;
  Modelica.Blocks.Continuous.FirstOrder FlowCtrl(T = 5, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = 1e-6) annotation(
    Placement(visible = true, transformation(origin = {-30, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.DiffPressureSensor sdp annotation(
    Placement(visible = true, transformation(origin = {70, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_basic PI_dpHC(CSmin = 0, K = 1e-6, Ti = 5) annotation(
    Placement(visible = true, transformation(origin = {30, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Pump_centrifugal P(dp00 = 1500000, dpn0 = 1200000, wn0 = 20) annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube line(L = 1000, wnom = 5) annotation(
    Placement(visible = true, transformation(origin = {112, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner AES.ProcessComponents.Thermal.System_settings.System_liquid system annotation(
    Placement(visible = true, transformation(origin = {-270, 132}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner AES.ProcessComponents.Thermal.System_settings.System_terrain terrain annotation(
    Placement(visible = true, transformation(origin = {-230, 132}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube load(L = 100, wnom = 5) annotation(
    Placement(visible = true, transformation(origin = {140, -62}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  AES.ProcessComponents.Thermal.Liquid.surfTcond_fixed Tload annotation(
    Placement(visible = true, transformation(origin = {170, -62}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.RealExpression spdpHC(y = 5e5) annotation(
    Placement(visible = true, transformation(origin = {90, 56}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression spTo(y = 273.15 + 95) annotation(
    Placement(visible = true, transformation(origin = {-212, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.ExpansionVessel_isoT EV(V = 1, p0 = 399999.9999999999) annotation(
    Placement(visible = true, transformation(origin = {-110, -92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.MassFlowrateSensor sw annotation(
    Placement(visible = true, transformation(origin = {-70, -98}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tsensor sTo annotation(
    Placement(visible = true, transformation(origin = {-172, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_basic PI_To(CSmax = 1e6, CSmin = 0, K = 1e6, Ti = 500) annotation(
    Placement(visible = true, transformation(origin = {-166, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_basic PI_wh(CSmin = 0, K = 0.2, Ti = 1) annotation(
    Placement(visible = true, transformation(origin = {-10, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Valve_linear Vrec(dpnom = 99999.99999999999, wnom = 5) annotation(
    Placement(visible = true, transformation(origin = {-42, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.RealExpression spw(y = 5) annotation(
    Placement(visible = true, transformation(origin = {30, -44}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Valve_linear Vload annotation(
    Placement(visible = true, transformation(origin = {140, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.RealExpression xload(y = if sin(time/500) > 0 then 0.4 else 0.7) annotation(
    Placement(visible = true, transformation(origin = {170, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Header heater(V = 5) annotation(
    Placement(visible = true, transformation(origin = {-110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow Ph annotation(
    Placement(visible = true, transformation(origin = {-130, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression(y = 1e6) annotation(
    Placement(visible = true, transformation(origin = {-198, 102}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(PI_dpHC.CS, FlowCtrl.u) annotation(
    Line(points = {{18, 50}, {-18, 50}}, color = {0, 0, 127}));
  connect(load.pwh_b, sdp.pwh_lo) annotation(
    Line(points = {{140, -74}, {140, -98}, {58, -98}, {58, -36}}, color = {46, 52, 54}));
  connect(load.surf, Tload.surf) annotation(
    Line(points = {{145, -62}, {161.4, -62}}, color = {144, 5, 5}));
  connect(PI_dpHC.SP, spdpHC.y) annotation(
    Line(points = {{42, 56.2}, {80, 56.2}}, color = {0, 0, 127}));
  connect(PI_dpHC.PV, sdp.oDp) annotation(
    Line(points = {{42, 45.6}, {80, 45.6}, {80, -30}, {68, -30}}, color = {0, 0, 127}));
  connect(sTo.oT, PI_To.PV) annotation(
    Line(points = {{-170, -20}, {-192, -20}, {-192, 46}, {-178, 46}}, color = {0, 0, 127}));
  connect(spTo.y, PI_To.SP) annotation(
    Line(points = {{-201, 56}, {-178, 56}}, color = {0, 0, 127}));
  connect(P.pwh_b, line.pwh_a) annotation(
    Line(points = {{-58, 10}, {21, 10}, {21, 12}, {100, 12}}, color = {46, 52, 54}));
  connect(P.pwh_b, sdp.pwh_hi) annotation(
    Line(points = {{-58, 10}, {58, 10}, {58, -24}}, color = {46, 52, 54}));
  connect(P.pwh_b, Vrec.pwh_a) annotation(
    Line(points = {{-58, 10}, {-42, 10}, {-42, -38}}, color = {46, 52, 54}));
  connect(sTo.pwh_a, Vrec.pwh_a) annotation(
    Line(points = {{-160, -20}, {-42, -20}, {-42, -38}}, color = {46, 52, 54}));
  connect(PI_wh.CS, Vrec.x) annotation(
    Line(points = {{-22, -50}, {-32, -50}}, color = {0, 0, 127}));
  connect(sw.ow, PI_wh.PV) annotation(
    Line(points = {{-70, -90}, {-70, -70}, {14, -70}, {14, -54}, {2, -54}}, color = {0, 0, 127}));
  connect(spw.y, PI_wh.SP) annotation(
    Line(points = {{19, -44}, {2, -44}}, color = {0, 0, 127}));
  connect(EV.pwh_b, sw.pwh_b) annotation(
    Line(points = {{-98, -98}, {-82, -98}}, color = {46, 52, 54}));
  connect(sw.pwh_a, Vrec.pwh_b) annotation(
    Line(points = {{-58, -98}, {-42, -98}, {-42, -62}}, color = {46, 52, 54}));
  connect(sw.pwh_a, sdp.pwh_lo) annotation(
    Line(points = {{-58, -98}, {58, -98}, {58, -36}}, color = {46, 52, 54}));
  connect(line.pwh_b, Vload.pwh_a) annotation(
    Line(points = {{124, 12}, {140, 12}, {140, -8}}, color = {46, 52, 54}));
  connect(Vload.pwh_b, load.pwh_a) annotation(
    Line(points = {{140, -32}, {140, -50}}, color = {46, 52, 54}));
  connect(Vload.x, xload.y) annotation(
    Line(points = {{150, -20}, {160, -20}}, color = {0, 0, 127}));
  connect(heater.pwh_b, P.pwh_a) annotation(
    Line(points = {{-98, 10}, {-82, 10}}, color = {46, 52, 54}));
  connect(heater.pwh_a, EV.pwh_a) annotation(
    Line(points = {{-122, 10}, {-132, 10}, {-132, -98}, {-122, -98}}, color = {46, 52, 54}));
  connect(Ph.port, heater.heatPort) annotation(
    Line(points = {{-120, 50}, {-110, 50}, {-110, 20}}, color = {191, 0, 0}));
  connect(FlowCtrl.y, P.cmd) annotation(
    Line(points = {{-41, 50}, {-70, 50}, {-70, 18}}, color = {0, 0, 127}));
  connect(PI_To.CS, Ph.Q_flow) annotation(
    Line(points = {{-154, 50}, {-140, 50}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 10000, Tolerance = 1e-06, Interval = 1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts",
    __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"),
    Diagram(coordinateSystem(extent = {{-300, -160}, {300, 160}})),
    Icon(coordinateSystem(extent = {{-300, -160}, {300, 160}})));
end Hcentral_control_case_002;