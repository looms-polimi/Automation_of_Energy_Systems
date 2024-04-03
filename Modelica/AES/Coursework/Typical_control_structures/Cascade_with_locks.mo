within AES.Coursework.Typical_control_structures;

model Cascade_with_locks
  extends Icons.CourseworkModel;
  Modelica.Blocks.Continuous.FirstOrder P_I(T = 1, k = 1) annotation(
    Placement(visible = true, transformation(origin = {50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder P_E(T = 10, k = 1) annotation(
    Placement(visible = true, transformation(origin = {110, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression SP(y = if time > 20 and time < 50 then 2 else 0.5) annotation(
    Placement(visible = true, transformation(origin = {-130, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_full PI_E(CSmax = 100, CSmin = -100, K = 2, Ti = 10, hasLocks = true)  annotation(
    Placement(transformation(origin = {-68, 16}, extent = {{-10, -20}, {10, 20}})));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_full PI_I(K = 2)  annotation(
    Placement(visible = true, transformation(origin = {-10, 16}, extent = {{-10, -20}, {10, 20}}, rotation = 0)));
equation
  connect(P_I.y, P_E.u) annotation(
    Line(points = {{61, 30}, {98, 30}}, color = {0, 0, 127}));
  connect(PI_I.CS, P_I.u) annotation(
    Line(points = {{0, 30}, {38, 30}}, color = {0, 0, 127}));
  connect(PI_E.CS, PI_I.SP) annotation(
    Line(points = {{-58, 30}, {-20, 30}}, color = {0, 0, 127}));
  connect(P_I.y, PI_I.PV) annotation(
    Line(points = {{62, 30}, {80, 30}, {80, -20}, {-40, -20}, {-40, 26}, {-20, 26}}, color = {0, 0, 127}));
  connect(P_E.y, PI_E.PV) annotation(
    Line(points = {{122, 30}, {140, 30}, {140, -40}, {-100, -40}, {-100, 26}, {-78, 26}}, color = {0, 0, 127}));
  connect(SP.y, PI_E.SP) annotation(
    Line(points = {{-119, 30}, {-78, 30}}, color = {0, 0, 127}));
  connect(PI_I.HIsat, PI_E.noInc) annotation(
    Line(points = {{0, 26}, {20, 26}, {20, -32}, {-92, -32}, {-92, 14}, {-78, 14}}, color = {255, 0, 255}));
  connect(PI_I.LOsat, PI_E.noDec) annotation(
    Line(points = {{0, 22}, {16, 22}, {16, -28}, {-88, -28}, {-88, 10}, {-78, 10}}, color = {255, 0, 255}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 200, Tolerance = 1e-6, Interval = 0.4),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end Cascade_with_locks;