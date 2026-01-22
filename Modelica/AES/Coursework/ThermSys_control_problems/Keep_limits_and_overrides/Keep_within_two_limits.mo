within AES.Coursework.ThermSys_control_problems.Keep_limits_and_overrides;

model Keep_within_two_limits
  extends Icons.CourseworkModel;
  ControlBlocks.AnalogueControllers.PI_awfb_basic C_hi(CSmax = 0, CSmin = -10, K = 15*4, Ti = 8) annotation(
    Placement(transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.TransferFunction P(a = {10, 11, 1}, b = {1}, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = 20) annotation(
    Placement(transformation(origin = {110, 10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression HI_limit(y = 21) annotation(
    Placement(visible = true, transformation(origin = {-110, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression LD(y = 20 + 10*sin(time/10)) annotation(
    Placement(visible = true, transformation(origin = {-110, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ControlBlocks.AnalogueControllers.PI_awfb_basic C_lo(CSmax = 10, CSmin = 0, K = 25, Ti = 6) annotation(
    Placement(transformation(origin = {-50, -10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression LO_limit(y = 19) annotation(
    Placement(visible = true, transformation(origin = {-110, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add annotation(
    Placement(transformation(origin = {70, 10}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(C_hi.CS, add.u2) annotation(
    Line(points = {{-38, 30}, {10, 30}, {10, 10}, {58, 10}}, color = {0, 0, 127}));
  connect(add.y, P.u) annotation(
    Line(points = {{81, 10}, {98, 10}}, color = {0, 0, 127}));
  connect(LD.y, add.u1) annotation(
    Line(points = {{-99, 68}, {50, 68}, {50, 18}, {58, 18}}, color = {0, 0, 127}));
  connect(C_lo.CS, add.u3) annotation(
    Line(points = {{-38, -10}, {10, -10}, {10, 2}, {58, 2}}, color = {0, 0, 127}));
  connect(P.y, C_lo.PV) annotation(
    Line(points = {{121, 10}, {140, 10}, {140, -40}, {-72, -40}, {-72, -14}, {-62, -14}}, color = {0, 0, 127}));
  connect(LO_limit.y, C_lo.SP) annotation(
    Line(points = {{-98, -4}, {-62, -4}, {-62, -4}, {-60, -4}}, color = {0, 0, 127}));
  connect(HI_limit.y, C_hi.SP) annotation(
    Line(points = {{-98, 36}, {-60, 36}}, color = {0, 0, 127}));
  connect(C_lo.PV, C_hi.PV) annotation(
    Line(points = {{-62, -14}, {-72, -14}, {-72, 26}, {-62, 26}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}}), graphics = {Text(origin = {-11, -25}, extent = {{-49, 9}, {49, -9}}, textString = "LO controller - only positive action", horizontalAlignment = TextAlignment.Left), Text(origin = {-11, 45}, extent = {{-49, 9}, {49, -9}}, textString = "HI controller - only negative action", horizontalAlignment = TextAlignment.Left)}),
    experiment(StartTime = 0, StopTime = 150, Tolerance = 1e-06, Interval = 0.3),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts",
    __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"));
end Keep_within_two_limits;