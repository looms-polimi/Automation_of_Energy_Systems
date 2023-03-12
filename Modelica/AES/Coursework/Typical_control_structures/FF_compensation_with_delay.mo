within AES.Coursework.Typical_control_structures;

model FF_compensation_with_delay
  extends Icons.CourseworkModel;
  Modelica.Blocks.Continuous.TransferFunction P(a = {5, 1}, b = {1}) annotation(
    Placement(visible = true, transformation(origin = {70, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction H(a = {5, 1}, b = {0.5}) annotation(
    Placement(visible = true, transformation(origin = {110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.FixedDelay Dd(delayTime = 4) annotation(
    Placement(visible = true, transformation(origin = {70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.FixedDelay Dc(delayTime = 3.5) annotation(
    Placement(visible = true, transformation(origin = {-10, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction M(a = {0.5, 1}, b = {1}) annotation(
    Placement(visible = true, transformation(origin = {30, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction K(a = {1, 1}, b = -0.5 * {0.5, 1}) annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction C(a = {1, 0}, b = {5, 1}) annotation(
    Placement(visible = true, transformation(origin = {-90, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback fb annotation(
    Placement(visible = true, transformation(origin = {-130, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add ad annotation(
    Placement(visible = true, transformation(origin = {150, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add ac annotation(
    Placement(visible = true, transformation(origin = {-48, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression w(y = 1) annotation(
    Placement(visible = true, transformation(origin = {-170, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression d(y = if time < 10 then 0 else -0.5) annotation(
    Placement(visible = true, transformation(origin = {-10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(w.y, fb.u1) annotation(
    Line(points = {{-159, -50}, {-139, -50}}, color = {0, 0, 127}));
  connect(fb.y, C.u) annotation(
    Line(points = {{-121, -50}, {-103, -50}}, color = {0, 0, 127}));
  connect(C.y, ac.u2) annotation(
    Line(points = {{-79, -50}, {-61, -50}}, color = {0, 0, 127}));
  connect(K.y, ac.u1) annotation(
    Line(points = {{-61, 30}, {-73, 30}, {-73, -38}, {-61, -38}}, color = {0, 0, 127}));
  connect(K.u, Dc.y) annotation(
    Line(points = {{-38, 30}, {-20, 30}}, color = {0, 0, 127}));
  connect(Dc.u, M.y) annotation(
    Line(points = {{2, 30}, {20, 30}}, color = {0, 0, 127}));
  connect(d.y, M.u) annotation(
    Line(points = {{2, 70}, {50, 70}, {50, 30}, {42, 30}}, color = {0, 0, 127}));
  connect(ac.y, P.u) annotation(
    Line(points = {{-36, -44}, {58, -44}}, color = {0, 0, 127}));
  connect(P.y, ad.u2) annotation(
    Line(points = {{82, -44}, {138, -44}}, color = {0, 0, 127}));
  connect(ad.y, fb.u2) annotation(
    Line(points = {{162, -38}, {176, -38}, {176, -80}, {-130, -80}, {-130, -58}}, color = {0, 0, 127}));
  connect(d.y, Dd.u) annotation(
    Line(points = {{2, 70}, {50, 70}, {50, 10}, {58, 10}}, color = {0, 0, 127}));
  connect(Dd.y, H.u) annotation(
    Line(points = {{82, 10}, {98, 10}}, color = {0, 0, 127}));
  connect(H.y, ad.u1) annotation(
    Line(points = {{122, 10}, {130, 10}, {130, -32}, {138, -32}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-6, Interval = 0.1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}}), graphics = {Text(origin = {-11, 1}, extent = {{-43, 15}, {43, -15}}, textString = "Tune this delay
for best compensation"), Text(origin = {-114, 43}, extent = {{-48, 15}, {48, -15}}, textString = "Poles added here
cannot be too HF
to avoid amplifying noise")}));
end FF_compensation_with_delay;