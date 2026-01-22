within AES.Coursework.ThermSys_control_problems.Keep_limits_and_overrides;

model Override_control
  extends Icons.CourseworkModel;
  Modelica.Blocks.Sources.RealExpression Psup(y = 5e5) annotation(
    Placement(transformation(origin = {-70, -30}, extent = {{-10, -10}, {10, 10}})));
  ControlBlocks.AnalogueControllers.PI_awfb_full PI_w_control(hasOvrMin = true, K = 4, Ti = 1, CSmin = 0) annotation(
    Placement(transformation(origin = {-10, 40}, extent = {{-10, -20}, {10, 20}})));
  ControlBlocks.AnalogueControllers.PI_awfb_basic PI_enforce_p_limit(K = 0.5, Ti = 2, CSmin = 0, CSmax = 1) annotation(
    Placement(transformation(origin = {-60, 26}, extent = {{-10, -10}, {10, 10}})));
  ProcessComponents.Thermal.Liquid.Valve_linear valve_reg(dpnom = 3e5) annotation(
    Placement(transformation(origin = {20, -36}, extent = {{-10, -10}, {10, 10}})));
  ProcessComponents.Thermal.Liquid.dp_quadratic dp_supply annotation(
    Placement(transformation(origin = {100, -36}, extent = {{-10, -10}, {10, 10}})));
  AES.ProcessComponents.Thermal.Liquid.Valve_linear valve_load(dpnom = 5e4) annotation(
    Placement(transformation(origin = {140, -36}, extent = {{-10, 10}, {10, -10}})));
  ProcessComponents.Thermal.Liquid.Node_pT_prescribed supply annotation(
    Placement(transformation(origin = {-18, -36}, extent = {{-10, -10}, {10, 10}})));
  ProcessComponents.Thermal.Liquid.Node_pT_fixed sink(p = 1e5) annotation(
    Placement(transformation(origin = {180, -36}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Sources.RealExpression SP_w(y = if time < 10 then 0.5 else 0.8) annotation(
    Placement(transformation(origin = {-110, 54}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression Tsup(y = 300) annotation(
    Placement(transformation(origin = {-70, -50}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression p_limit(y = 1.6e5) annotation(
    Placement(transformation(origin = {-110, 32}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression load_opening(y = if time < 20 or time > 40 then 1 else 0.6) annotation(
    Placement(transformation(origin = {36, -70}, extent = {{-16, -10}, {16, 10}})));
  ProcessComponents.Thermal.Liquid.MassFlowrateSensor sw annotation(
    Placement(transformation(origin = {60, -36}, extent = {{-10, -10}, {10, 10}})));
  ProcessComponents.Thermal.Liquid.psensor sp annotation(
    Placement(transformation(origin = {98, -10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.FirstOrder v_pos(initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = 0.5, T = 0.5) annotation(
    Placement(transformation(origin = {20, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.FirstOrder load_pos(T = 0.5, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = 0.5) annotation(
    Placement(transformation(origin = {110, -70}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(supply.pwh_a, valve_reg.pwh_a) annotation(
    Line(points = {{-6, -36}, {8, -36}}, color = {46, 52, 54}));
  connect(dp_supply.pwh_b, valve_load.pwh_a) annotation(
    Line(points = {{112, -36}, {128, -36}}, color = {46, 52, 54}));
  connect(valve_load.pwh_b, sink.pwh_a) annotation(
    Line(points = {{152, -36}, {168, -36}}, color = {46, 52, 54}));
  connect(Psup.y, supply.p) annotation(
    Line(points = {{-59, -30}, {-28, -30}}, color = {0, 0, 127}));
  connect(Tsup.y, supply.T) annotation(
    Line(points = {{-59, -50}, {-40, -50}, {-40, -42}, {-28, -42}}, color = {0, 0, 127}));
  connect(valve_reg.pwh_b, sw.pwh_a) annotation(
    Line(points = {{32, -36}, {48, -36}}, color = {46, 52, 54}));
  connect(sw.pwh_b, dp_supply.pwh_a) annotation(
    Line(points = {{72, -36}, {88, -36}}, color = {46, 52, 54}));
  connect(sp.pwh_a, dp_supply.pwh_b) annotation(
    Line(points = {{110, -10}, {120, -10}, {120, -36}, {112, -36}}, color = {46, 52, 54}));
  connect(sp.op, PI_enforce_p_limit.PV) annotation(
    Line(points = {{94, -10}, {-80, -10}, {-80, 22}, {-72, 22}}, color = {0, 0, 127}));
  connect(p_limit.y, PI_enforce_p_limit.SP) annotation(
    Line(points = {{-99, 32}, {-72, 32}}, color = {0, 0, 127}));
  connect(v_pos.y, valve_reg.x) annotation(
    Line(points = {{20, -1}, {20, -27}}, color = {0, 0, 127}));
  connect(sw.ow, PI_w_control.PV) annotation(
    Line(points = {{60, -28}, {60, -16}, {-30, -16}, {-30, 50}, {-20, 50}}, color = {0, 0, 127}));
  connect(SP_w.y, PI_w_control.SP) annotation(
    Line(points = {{-99, 54}, {-20, 54}}, color = {0, 0, 127}));
  connect(PI_w_control.CS, v_pos.u) annotation(
    Line(points = {{0, 54}, {20, 54}, {20, 22}}, color = {0, 0, 127}));
  connect(PI_enforce_p_limit.CS, PI_w_control.ovrMin) annotation(
    Line(points = {{-48, 26}, {-20, 26}}, color = {0, 0, 127}));
  connect(load_opening.y, load_pos.u) annotation(
    Line(points = {{54, -70}, {98, -70}}, color = {0, 0, 127}));
  connect(load_pos.y, valve_load.x) annotation(
    Line(points = {{122, -70}, {140, -70}, {140, -46}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}}), graphics = {Text(origin = {34, 67}, extent = {{-58, 21}, {58, -21}}, textString = "Flow controller with min-override", horizontalAlignment = TextAlignment.Left), Text(origin = {-52, 6}, extent = {{-22, 10}, {22, -10}}, textString = "Pressure
controller", horizontalAlignment = TextAlignment.Left)}),
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.01),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts",
    __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*", noEquidistantTimeGrid = "()"));
end Override_control;