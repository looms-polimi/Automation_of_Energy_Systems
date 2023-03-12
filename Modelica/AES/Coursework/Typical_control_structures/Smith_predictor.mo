within AES.Coursework.Typical_control_structures;

model Smith_predictor
  extends Icons.CourseworkModel;
  Modelica.Blocks.Sources.RealExpression SP(y = if time < 1 then 0 else 1) annotation(
    Placement(visible = true, transformation(origin = {-160, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction Pr(a = {1, 2, 1}) annotation(
    Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.FixedDelay Pdelay(delayTime = 20) annotation(
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.FixedDelay Mdelay(delayTime = 22) annotation(
    Placement(visible = true, transformation(origin = {10, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction Mr(a = {1, 2, 1}) annotation(
    Placement(visible = true, transformation(origin = {-30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction K(a = {0.1, 1, 0}, b = {1, 2, 1}) annotation(
    Placement(visible = true, transformation(origin = {-82, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback sub annotation(
    Placement(visible = true, transformation(origin = {30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add yhat annotation(
    Placement(visible = true, transformation(origin = {68, -54}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Math.Feedback fb annotation(
    Placement(visible = true, transformation(origin = {-122, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Mr.y, sub.u1) annotation(
    Line(points = {{-19, -30}, {22, -30}}, color = {0, 0, 127}));
  connect(Mr.y, Mdelay.u) annotation(
    Line(points = {{-19, -30}, {-10, -30}, {-10, -60}, {-2, -60}}, color = {0, 0, 127}));
  connect(Mdelay.y, sub.u2) annotation(
    Line(points = {{22, -60}, {30, -60}, {30, -38}}, color = {0, 0, 127}));
  connect(Pr.y, Pdelay.u) annotation(
    Line(points = {{-18, 10}, {-2, 10}}, color = {0, 0, 127}));
  connect(Pdelay.y, yhat.u1) annotation(
    Line(points = {{22, 10}, {74, 10}, {74, -42}}, color = {0, 0, 127}));
  connect(sub.y, yhat.u2) annotation(
    Line(points = {{40, -30}, {62, -30}, {62, -42}}, color = {0, 0, 127}));
  connect(fb.y, K.u) annotation(
    Line(points = {{-112, 10}, {-94, 10}}, color = {0, 0, 127}));
  connect(K.y, Pr.u) annotation(
    Line(points = {{-70, 10}, {-42, 10}}, color = {0, 0, 127}));
  connect(K.y, Mr.u) annotation(
    Line(points = {{-70, 10}, {-60, 10}, {-60, -30}, {-42, -30}}, color = {0, 0, 127}));
  connect(yhat.y, fb.u2) annotation(
    Line(points = {{68, -64}, {68, -80}, {-122, -80}, {-122, 2}}, color = {0, 0, 127}));
  connect(SP.y, fb.u1) annotation(
    Line(points = {{-148, 10}, {-130, 10}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 500, Tolerance = 1e-06, Interval = 1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end Smith_predictor;