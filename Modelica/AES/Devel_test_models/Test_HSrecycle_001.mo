within AES.Devel_test_models;

model Test_HSrecycle_001
  extends Icons.TestModel;
  parameter SI.Power Pmax=2e6 "max power";
  parameter SI.MassFlowRate wnom=10 "nominal flowrate";
  parameter SI.PressureDifference dpHCrec=2e5 "H-C dp at w=wnom with full recycle";
  
  parameter SI.Volume V=0.25 "volume";
  parameter SI.Time Tcl = 30 "CL temp ctrl TC";
  parameter SI.Temperature Tstart = 273.15 + 25 "initial fluid temp";
  Modelica.Blocks.Continuous.FirstOrder FlowCtrl(T = 2, y_start = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-30, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.HVAC.ControlledLiquidHeater_lim H(Pmax = Pmax, Tcl = Tcl, Tstart = Tstart, V = V) annotation(
    Placement(visible = true, transformation(origin = {-110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.DiffPressureSensor sdp annotation(
    Placement(visible = true, transformation(origin = {70, -28}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_basic PI_dpHC(CSmin = 0, K = 0.1, Ti = 2)  annotation(
    Placement(visible = true, transformation(origin = {30, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Pump_centrifugal P(dpn0 = 799999.9999999999, wn0 = 20)  annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube line(L = 1000, wnom = 5)  annotation(
    Placement(visible = true, transformation(origin = {112, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner AES.ProcessComponents.Thermal.System_settings.System_liquid system annotation(
    Placement(visible = true, transformation(origin = {-270, 132}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner AES.ProcessComponents.Thermal.System_settings.System_terrain terrain annotation(
    Placement(visible = true, transformation(origin = {-230, 132}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube load(L = 100, kdp = 50, wnom = 5)  annotation(
    Placement(visible = true, transformation(origin = {140, -62}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  AES.ProcessComponents.Thermal.Liquid.surfTcond_fixed Tload annotation(
    Placement(visible = true, transformation(origin = {170, -62}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.RealExpression spdpHC(y = 5e5)  annotation(
    Placement(visible = true, transformation(origin = {90, 56}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression spTo(y = 273.15 + 95)  annotation(
    Placement(visible = true, transformation(origin = {-214, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression Hon(y = true)  annotation(
    Placement(visible = true, transformation(origin = {-214, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.ExpansionVessel_isoT EV(V = 1, p0 = 399999.9999999999)  annotation(
    Placement(visible = true, transformation(origin = {-110, -92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.MassFlowrateSensor sw annotation(
    Placement(visible = true, transformation(origin = {-68, -98}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tsensor sTo annotation(
    Placement(visible = true, transformation(origin = {-172, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_basic PI_To(CSmax = 273.15 + 110,CSmin = 273.15 + 40, K = 20, Ti = 20) annotation(
    Placement(visible = true, transformation(origin = {-164, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_basic PI_wh(CSmin = 0, K = 0.2, Ti = 1) annotation(
    Placement(visible = true, transformation(origin = {-8, -48}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Valve_linear Vrec annotation(
    Placement(visible = true, transformation(origin = {-42, -48}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.RealExpression spw(y = 7) annotation(
    Placement(visible = true, transformation(origin = {34, -42}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Valve_linear Vload annotation(
    Placement(visible = true, transformation(origin = {140, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.RealExpression xload(y = if sin(time / 500) > 0 then 0.4 else 0.7) annotation(
    Placement(visible = true, transformation(origin = {170, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(PI_dpHC.CS, FlowCtrl.u) annotation(
    Line(points = {{18, 50}, {-18, 50}}, color = {0, 0, 127}));
  connect(H.pwh_b, P.pwh_a) annotation(
    Line(points = {{-98, 10}, {-82, 10}}, color = {46, 52, 54}));
  connect(FlowCtrl.y, P.cmd) annotation(
    Line(points = {{-41, 50}, {-70, 50}, {-70, 18}}, color = {0, 0, 127}));
  connect(load.pwh_b, sdp.pwh_lo) annotation(
    Line(points = {{140, -74}, {140, -98}, {58, -98}, {58, -34}}, color = {46, 52, 54}));
  connect(load.surf, Tload.surf) annotation(
    Line(points = {{145, -62}, {161.4, -62}}, color = {144, 5, 5}));
  connect(PI_dpHC.SP, spdpHC.y) annotation(
    Line(points = {{42, 56.2}, {80, 56.2}}, color = {0, 0, 127}));
  connect(EV.pwh_a, H.pwh_a) annotation(
    Line(points = {{-122, -98}, {-132, -98}, {-132, 10}, {-122, 10}}, color = {46, 52, 54}));
  connect(PI_dpHC.PV, sdp.oDp) annotation(
    Line(points = {{42, 45.6}, {80, 45.6}, {80, -28.4}, {68, -28.4}}, color = {0, 0, 127}));
  connect(Hon.y, H.ON) annotation(
    Line(points = {{-203, 4}, {-122, 4}}, color = {255, 0, 255}));
  connect(PI_To.CS, H.To) annotation(
    Line(points = {{-152, 16}, {-122, 16}}, color = {0, 0, 127}));
  connect(sTo.oT, PI_To.PV) annotation(
    Line(points = {{-170, -20}, {-192, -20}, {-192, 12}, {-176, 12}}, color = {0, 0, 127}));
  connect(spTo.y, PI_To.SP) annotation(
    Line(points = {{-203, 22}, {-176, 22}}, color = {0, 0, 127}));
  connect(P.pwh_b, line.pwh_a) annotation(
    Line(points = {{-58, 10}, {100, 10}}, color = {46, 52, 54}));
  connect(P.pwh_b, sdp.pwh_hi) annotation(
    Line(points = {{-58, 10}, {58, 10}, {58, -22}}, color = {46, 52, 54}));
  connect(P.pwh_b, Vrec.pwh_a) annotation(
    Line(points = {{-58, 10}, {-42, 10}, {-42, -36}}, color = {46, 52, 54}));
  connect(sTo.pwh_a, Vrec.pwh_a) annotation(
    Line(points = {{-160, -20}, {-42, -20}, {-42, -36}}, color = {46, 52, 54}));
  connect(PI_wh.CS, Vrec.x) annotation(
    Line(points = {{-20, -48}, {-32, -48}}, color = {0, 0, 127}));
  connect(sw.ow, PI_wh.PV) annotation(
    Line(points = {{-68, -90}, {-68, -70}, {14, -70}, {14, -52}, {4, -52}}, color = {0, 0, 127}));
  connect(spw.y, PI_wh.SP) annotation(
    Line(points = {{23, -42}, {4, -42}}, color = {0, 0, 127}));
  connect(EV.pwh_b, sw.pwh_b) annotation(
    Line(points = {{-98, -98}, {-80, -98}}, color = {46, 52, 54}));
  connect(sw.pwh_a, Vrec.pwh_b) annotation(
    Line(points = {{-56, -98}, {-42, -98}, {-42, -60}}, color = {46, 52, 54}));
  connect(sw.pwh_a, sdp.pwh_lo) annotation(
    Line(points = {{-56, -98}, {58, -98}, {58, -34}}, color = {46, 52, 54}));
  connect(line.pwh_b, Vload.pwh_a) annotation(
    Line(points = {{124, 10}, {140, 10}, {140, -8}}, color = {46, 52, 54}));
  connect(Vload.pwh_b, load.pwh_a) annotation(
    Line(points = {{140, -32}, {140, -50}}, color = {46, 52, 54}));
  connect(Vload.x, xload.y) annotation(
    Line(points = {{150, -20}, {160, -20}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 10000, Tolerance = 1e-6, Interval = 1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-300, -160}, {300, 160}})),
  Icon(coordinateSystem(extent = {{-300, -160}, {300, 160}})));
end Test_HSrecycle_001;