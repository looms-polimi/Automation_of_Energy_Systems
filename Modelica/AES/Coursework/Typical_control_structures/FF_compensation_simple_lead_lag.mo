within AES.Coursework.Typical_control_structures;

model FF_compensation_simple_lead_lag
  extends Icons.CourseworkModel;
  Modelica.Blocks.Continuous.TransferFunction P(a = {10, 11, 1}, b = {1}) annotation(
    Placement(visible = true, transformation(origin = {70, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction H(a = {5, 6, 1}, b = {1}) annotation(
    Placement(visible = true, transformation(origin = {110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction M(a = {0.5, 1}, b = {1}) annotation(
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction K(a = {10, 1}, b = {14, 1})  annotation(
    Placement(visible = true, transformation(origin = {-46, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction C(a = {1, 0}, b = 0.25 * {10, 1}) annotation(
    Placement(visible = true, transformation(origin = {-90, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback fb annotation(
    Placement(visible = true, transformation(origin = {-130, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add ad annotation(
    Placement(visible = true, transformation(origin = {150, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add ac(k1 = -1)  annotation(
    Placement(visible = true, transformation(origin = {-48, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression w(y = 1) annotation(
    Placement(visible = true, transformation(origin = {-170, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression d(y = if time < 30 then 0 else 1) annotation(
    Placement(visible = true, transformation(origin = {-10, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(w.y, fb.u1) annotation(
    Line(points = {{-159, -50}, {-139, -50}}, color = {0, 0, 127}));
  connect(fb.y, C.u) annotation(
    Line(points = {{-121, -50}, {-103, -50}}, color = {0, 0, 127}));
  connect(C.y, ac.u2) annotation(
    Line(points = {{-79, -50}, {-61, -50}}, color = {0, 0, 127}));
  connect(K.y, ac.u1) annotation(
    Line(points = {{-57, 10}, {-73, 10}, {-73, -38}, {-61, -38}}, color = {0, 0, 127}));
  connect(d.y, M.u) annotation(
    Line(points = {{1, 52}, {50, 52}, {50, 10}, {22, 10}}, color = {0, 0, 127}));
  connect(ac.y, P.u) annotation(
    Line(points = {{-36, -44}, {58, -44}}, color = {0, 0, 127}));
  connect(P.y, ad.u2) annotation(
    Line(points = {{82, -44}, {138, -44}}, color = {0, 0, 127}));
  connect(ad.y, fb.u2) annotation(
    Line(points = {{162, -38}, {176, -38}, {176, -80}, {-130, -80}, {-130, -58}}, color = {0, 0, 127}));
  connect(H.y, ad.u1) annotation(
    Line(points = {{122, 10}, {130, 10}, {130, -32}, {138, -32}}, color = {0, 0, 127}));
  connect(M.u, H.u) annotation(
    Line(points = {{22, 10}, {98, 10}}, color = {0, 0, 127}));
  connect(M.y, K.u) annotation(
    Line(points = {{0, 10}, {-34, 10}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 150, Tolerance = 1e-6, Interval = 0.075),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}}), graphics = {Text(origin = {-99, 27}, extent = {{-43, 15}, {43, -15}}, textString = "Just a lead/lag here"), Text(origin = {-26, -63}, extent = {{-38, 13}, {38, -13}}, textString = "zero for k1 or k2\nto exclude actions")}));
end FF_compensation_simple_lead_lag;