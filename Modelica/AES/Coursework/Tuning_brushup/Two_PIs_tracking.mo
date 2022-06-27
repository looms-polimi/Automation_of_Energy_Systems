within AES.Coursework.Tuning_brushup;

model Two_PIs_tracking
  extends Icons.CourseworkModel;
  Modelica.Blocks.Sources.RealExpression SP(y = if sin(time / 60) > 0 then 0.5 else -0.5) annotation(
    Placement(visible = true, transformation(origin = {-130, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_full PI_1(K = 4, Ti = 10, hasTracking = true) annotation(
    Placement(visible = true, transformation(origin = {-30, 40}, extent = {{-10, -20}, {10, 20}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_full PI_2(K = 1, Ti = 20, hasTracking = true) annotation(
    Placement(visible = true, transformation(origin = {-30, -40}, extent = {{-10, -20}, {10, 20}}, rotation = 0)));
  Modelica.Blocks.Logical.Switch sw annotation(
    Placement(visible = true, transformation(origin = {30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction Process(a = {200, 30, 1}, b = {1}) annotation(
    Placement(visible = true, transformation(origin = {88, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder y_filter(T = 0.5, k = 1) annotation(
    Placement(visible = true, transformation(origin = {130, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.GreaterEqualThreshold geq annotation(
    Placement(visible = true, transformation(origin = {90, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Not not1 annotation(
    Placement(visible = true, transformation(origin = {-30, 80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(PI_1.CS, sw.u1) annotation(
    Line(points = {{-20, 54}, {0, 54}, {0, 8}, {18, 8}}, color = {0, 0, 127}));
  connect(PI_2.CS, sw.u3) annotation(
    Line(points = {{-20, -26}, {0, -26}, {0, -8}, {18, -8}}, color = {0, 0, 127}));
  connect(sw.y, Process.u) annotation(
    Line(points = {{42, 0}, {76, 0}}, color = {0, 0, 127}));
  connect(Process.y, PI_2.PV) annotation(
    Line(points = {{100, 0}, {160, 0}, {160, -80}, {-60, -80}, {-60, -30}, {-40, -30}}, color = {0, 0, 127}));
  connect(PI_2.PV, PI_1.PV) annotation(
    Line(points = {{-40, -30}, {-60, -30}, {-60, 50}, {-40, 50}}, color = {0, 0, 127}));
  connect(SP.y, PI_1.SP) annotation(
    Line(points = {{-119, 54}, {-40, 54}}, color = {0, 0, 127}));
  connect(SP.y, PI_2.SP) annotation(
    Line(points = {{-118, 54}, {-100, 54}, {-100, -26}, {-40, -26}}, color = {0, 0, 127}));
  connect(sw.y, PI_2.TR) annotation(
    Line(points = {{42, 0}, {60, 0}, {60, -70}, {-50, -70}, {-50, -38}, {-40, -38}}, color = {0, 0, 127}));
  connect(PI_2.TR, PI_1.TR) annotation(
    Line(points = {{-40, -38}, {-50, -38}, {-50, 42}, {-40, 42}}, color = {0, 0, 127}));
  connect(Process.y, y_filter.u) annotation(
    Line(points = {{100, 0}, {160, 0}, {160, 50}, {142, 50}}, color = {0, 0, 127}));
  connect(geq.u, y_filter.y) annotation(
    Line(points = {{102, 50}, {120, 50}}, color = {0, 0, 127}));
  connect(geq.y, sw.u2) annotation(
    Line(points = {{80, 50}, {10, 50}, {10, 0}, {18, 0}}, color = {255, 0, 255}));
  connect(sw.u2, PI_2.TS) annotation(
    Line(points = {{18, 0}, {10, 0}, {10, -68}, {-46, -68}, {-46, -34}, {-40, -34}}, color = {255, 0, 255}));
  connect(geq.y, not1.u) annotation(
    Line(points = {{80, 50}, {10, 50}, {10, 80}, {-18, 80}}, color = {255, 0, 255}));
  connect(not1.y, PI_1.TS) annotation(
    Line(points = {{-40, 80}, {-54, 80}, {-54, 46}, {-40, 46}}, color = {255, 0, 255}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 600, Tolerance = 1e-06, Interval = 1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end Two_PIs_tracking;