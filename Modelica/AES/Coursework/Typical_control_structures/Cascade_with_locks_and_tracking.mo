within AES.Coursework.Typical_control_structures;

model Cascade_with_locks_and_tracking
  extends Icons.CourseworkModel;
  Modelica.Blocks.Continuous.FirstOrder P_I(T = 1, k = 1) annotation(
    Placement(transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.FirstOrder P_E(T = 10, k = 1) annotation(
    Placement(transformation(origin = {130, 70}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression SP(y = if time > 20 and time < 50 then 2 else 0.5) annotation(
    Placement(transformation(origin = {-110, 70}, extent = {{-10, -10}, {10, 10}})));
  ControlBlocks.AnalogueControllers.PI_awfb_full PI_E(CSmax = 100, CSmin = -100, K = 2, Ti = 10, hasLocks = true, hasTracking = true) annotation(
    Placement(transformation(origin = {-50, 56}, extent = {{-10, -20}, {10, 20}})));
  ControlBlocks.AnalogueControllers.PI_awfb_full PI_I(K = 2, CSmin = 0, hasTracking = true) annotation(
    Placement(transformation(origin = {10, 56}, extent = {{-10, -20}, {10, 20}})));
  Modelica.Blocks.Sources.RealExpression TR_I(y = if time < 150 then 0 else 0.8) annotation(
    Placement(transformation(origin = {-170, -30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression TR_E annotation(
    Placement(transformation(origin = {-170, -58}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.BooleanExpression TS_I(y = time > 100 and time < 200) annotation(
    Placement(transformation(origin = {-170, -10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.BooleanExpression TS_E(y = time > 300 and time < 350) annotation(
    Placement(transformation(origin = {-170, 10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Logical.Or tse annotation(
    Placement(transformation(origin = {-130, 10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Logical.Switch tre annotation(
    Placement(transformation(origin = {-110, -50}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(P_I.y, P_E.u) annotation(
    Line(points = {{81, 70}, {118, 70}}, color = {0, 0, 127}));
  connect(PI_I.CS, P_I.u) annotation(
    Line(points = {{20, 70}, {58, 70}}, color = {0, 0, 127}));
  connect(PI_E.CS, PI_I.SP) annotation(
    Line(points = {{-40, 70}, {0, 70}}, color = {0, 0, 127}));
  connect(P_E.y, PI_E.PV) annotation(
    Line(points = {{141, 70}, {159, 70}, {159, 0}, {-81, 0}, {-81, 66}, {-60, 66}}, color = {0, 0, 127}));
  connect(SP.y, PI_E.SP) annotation(
    Line(points = {{-99, 70}, {-60, 70}}, color = {0, 0, 127}));
  connect(PI_I.HIsat, PI_E.noInc) annotation(
    Line(points = {{20, 66}, {40, 66}, {40, 8}, {-72, 8}, {-72, 54}, {-60, 54}}, color = {255, 0, 255}));
  connect(PI_I.LOsat, PI_E.noDec) annotation(
    Line(points = {{20, 62}, {36, 62}, {36, 12}, {-68, 12}, {-68, 50}, {-60, 50}}, color = {255, 0, 255}));
  connect(TS_I.y, PI_I.TS) annotation(
    Line(points = {{-159, -10}, {-10.5, -10}, {-10.5, 62}, {0, 62}}, color = {255, 0, 255}));
  connect(PI_E.TS, tse.y) annotation(
    Line(points = {{-60.2, 62}, {-86.2, 62}, {-86.2, 10}, {-119.2, 10}}, color = {255, 0, 255}));
  connect(TS_E.y, tse.u1) annotation(
    Line(points = {{-159, 10}, {-143, 10}}, color = {255, 0, 255}));
  connect(TS_I.y, tse.u2) annotation(
    Line(points = {{-159, -10}, {-151, -10}, {-151, 2}, {-143, 2}}, color = {255, 0, 255}));
  connect(TR_I.y, PI_I.TR) annotation(
    Line(points = {{-159, -30}, {-14, -30}, {-14, 58}, {0, 58}}, color = {0, 0, 127}));
  connect(tre.u2, TS_I.y) annotation(
    Line(points = {{-122, -50}, {-150, -50}, {-150, -10}, {-158, -10}}, color = {255, 0, 255}));
  connect(TR_E.y, tre.u3) annotation(
    Line(points = {{-159, -58}, {-122, -58}}, color = {0, 0, 127}));
  connect(P_I.y, tre.u1) annotation(
    Line(points = {{82, 70}, {92, 70}, {92, -20}, {-132, -20}, {-132, -42}, {-122, -42}}, color = {0, 0, 127}));
  connect(P_I.y, PI_I.PV) annotation(
    Line(points = {{82, 70}, {92, 70}, {92, 4}, {-18, 4}, {-18, 66}, {0, 66}}, color = {0, 0, 127}));
  connect(tre.y, PI_E.TR) annotation(
    Line(points = {{-98, -50}, {-76, -50}, {-76, 58}, {-60, 58}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 400, Tolerance = 1e-06, Interval = 0.4),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts",
    __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"));
end Cascade_with_locks_and_tracking;