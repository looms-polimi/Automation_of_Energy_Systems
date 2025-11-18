within AES.Devel_test_models;

model Keep_within_two_limits_actuators
  extends Icons.CourseworkModel;
  ControlBlocks.AnalogueControllers.PI_awfb_basic C_hi(CSmax = 0, CSmin = -10, K = 10, Ti = 12) annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction P(a = {8, 1}, b = {1}, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = 20) annotation(
    Placement(transformation(origin = {114, 10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression HI_limit(y = 23) annotation(
    Placement(visible = true, transformation(origin = {-110, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression LD(y = 20 + 10*sin(time/60)) annotation(
    Placement(visible = true, transformation(origin = {-110, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ControlBlocks.AnalogueControllers.PI_awfb_basic C_lo(CSmax = 10, CSmin = 0, K = 15, Ti = 20) annotation(
    Placement(visible = true, transformation(origin = {-50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression LO_limit(y = 19) annotation(
    Placement(visible = true, transformation(origin = {-110, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add annotation(
    Placement(transformation(origin = {74, 10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.FirstOrder Ahi(T = 2)  annotation(
    Placement(transformation(origin = {0, 30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.FirstOrder Alo(T = 5)  annotation(
    Placement(transformation(origin = {2, -10}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(add.y, P.u) annotation(
    Line(points = {{85, 10}, {102, 10}}, color = {0, 0, 127}));
  connect(LD.y, add.u1) annotation(
    Line(points = {{-99, 68}, {46, 68}, {46, 18}, {62, 18}}, color = {0, 0, 127}));
  connect(P.y, C_lo.PV) annotation(
    Line(points = {{125, 10}, {148, 10}, {148, -40}, {-72, -40}, {-72, -14}, {-60, -14}}, color = {0, 0, 127}));
  connect(LO_limit.y, C_lo.SP) annotation(
    Line(points = {{-98, -4}, {-62, -4}, {-62, -4}, {-60, -4}}, color = {0, 0, 127}));
  connect(HI_limit.y, C_hi.SP) annotation(
    Line(points = {{-98, 36}, {-60, 36}}, color = {0, 0, 127}));
  connect(C_lo.PV, C_hi.PV) annotation(
    Line(points = {{-62, -14}, {-72, -14}, {-72, 26}, {-62, 26}}, color = {0, 0, 127}));
  connect(C_hi.CS, Ahi.u) annotation(
    Line(points = {{-38, 30}, {-12, 30}}, color = {0, 0, 127}));
  connect(C_lo.CS, Alo.u) annotation(
    Line(points = {{-38, -10}, {-10, -10}}, color = {0, 0, 127}));
  connect(Ahi.y, add.u2) annotation(
    Line(points = {{12, 30}, {28, 30}, {28, 10}, {62, 10}}, color = {0, 0, 127}));
  connect(Alo.y, add.u3) annotation(
    Line(points = {{14, -10}, {32, -10}, {32, 2}, {62, 2}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 1000, Tolerance = 1e-06, Interval = 0.3),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts",
    __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"));
end Keep_within_two_limits_actuators;