within AES.Coursework.Typical_control_structures;

model Keep_below_limit
  extends Icons.CourseworkModel;
  AES.ControlBlocks.AnalogueControllers.PI_awfb_basic C(CSmax = 0, CSmin = -2, K = 30, Ti = 5) annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction P(a = {10, 11, 1}, b = {1}, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(
    Placement(visible = true, transformation(origin = {50, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add aLD annotation(
    Placement(visible = true, transformation(origin = {12, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression SP(y = 0.8) annotation(
    Placement(visible = true, transformation(origin = {-110, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression LD(y = 1 + 0.6*sin(time/10)) annotation(
    Placement(visible = true, transformation(origin = {-110, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(SP.y, C.SP) annotation(
    Line(points = {{-99, 36}, {-60, 36}}, color = {0, 0, 127}));
  connect(P.y, C.PV) annotation(
    Line(points = {{62, 36}, {80, 36}, {80, -10}, {-80, -10}, {-80, 26}, {-60, 26}}, color = {0, 0, 127}));
  connect(LD.y, aLD.u1) annotation(
    Line(points = {{-99, 70}, {-20, 70}, {-20, 42}, {0, 42}}, color = {0, 0, 127}));
  connect(aLD.y, P.u) annotation(
    Line(points = {{24, 36}, {38, 36}, {38, 36}, {38, 36}}, color = {0, 0, 127}));
  connect(C.CS, aLD.u2) annotation(
    Line(points = {{-38, 30}, {0, 30}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 150, Tolerance = 1e-06, Interval = 0.3),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"));
end Keep_below_limit;