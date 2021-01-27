within AES.Coursework.Tuning_brushup;

model IMC_scheme_1dof
  extends Icons.CourseworkModel;

  Modelica.Blocks.Continuous.TransferFunction P(a = {10, 11, 1}, b = {1})  annotation(
    Placement(visible = true, transformation(origin = {90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add ald annotation(
    Placement(visible = true, transformation(origin = {50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression SP(y = if time < 0 then 0 else 1)  annotation(
    Placement(visible = true, transformation(origin = {-110, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression LD(y = if time < 30 then 0 else 5)  annotation(
    Placement(visible = true, transformation(origin = {-110, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction HF(a = {2.5, 5.5, 1}, b = {10, 11, 1})  annotation(
    Placement(visible = true, transformation(origin = {-10, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction M(a = {10, 11, 1}, b = {1})  annotation(
    Placement(visible = true, transformation(origin = {50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback fb annotation(
    Placement(visible = true, transformation(origin = {-50, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback ydiff annotation(
    Placement(visible = true, transformation(origin = {120, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(ald.y, P.u) annotation(
    Line(points = {{61, 30}, {77, 30}}, color = {0, 0, 127}));
  connect(LD.y, ald.u1) annotation(
    Line(points = {{-99, 70}, {22, 70}, {22, 36}, {38, 36}}, color = {0, 0, 127}));
  connect(HF.y, ald.u2) annotation(
    Line(points = {{2, 24}, {38, 24}}, color = {0, 0, 127}));
  connect(P.y, ydiff.u1) annotation(
    Line(points = {{102, 30}, {120, 30}, {120, -2}}, color = {0, 0, 127}));
  connect(ydiff.y, fb.u2) annotation(
    Line(points = {{120, -18}, {120, -40}, {-50, -40}, {-50, 16}}, color = {0, 0, 127}));
  connect(HF.y, M.u) annotation(
    Line(points = {{2, 24}, {20, 24}, {20, -10}, {38, -10}}, color = {0, 0, 127}));
  connect(M.y, ydiff.u2) annotation(
    Line(points = {{62, -10}, {112, -10}}, color = {0, 0, 127}));
  connect(SP.y, fb.u1) annotation(
    Line(points = {{-98, 24}, {-58, 24}}, color = {0, 0, 127}));
  connect(fb.y, HF.u) annotation(
    Line(points = {{-40, 24}, {-22, 24}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-6, Interval = 0.12),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end IMC_scheme_1dof;