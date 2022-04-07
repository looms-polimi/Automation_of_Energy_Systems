within AES.Coursework.ElecSys_power_frequency_control;

model BO_rigid_Islanded_generator
  extends AES.Icons.CourseworkModel;
  Modelica.Blocks.Sources.RealExpression dPe(y = if time < 10 then 0 else 0.05)  annotation(
    Placement(visible = true, transformation(origin = {-10, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback Pbal annotation(
    Placement(visible = true, transformation(origin = {30, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator N(k = 1 / 10)  annotation(
    Placement(visible = true, transformation(origin = {70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction Cps(a = {50, 0}, b = 0.5 * {50, 1})  annotation(
    Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain fb(k = -1)  annotation(
    Placement(visible = true, transformation(origin = {-10, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction g(a = {5, 1}, b = {1})  annotation(
    Placement(visible = true, transformation(origin = {-10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Pbal.y, N.u) annotation(
    Line(points = {{40, 0}, {58, 0}}, color = {0, 0, 127}));
  connect(N.y, fb.u) annotation(
    Line(points = {{82, 0}, {100, 0}, {100, -30}, {2, -30}}, color = {0, 0, 127}));
  connect(fb.y, Cps.u) annotation(
    Line(points = {{-20, -30}, {-100, -30}, {-100, 0}, {-82, 0}}, color = {0, 0, 127}));
  connect(dPe.y, Pbal.u2) annotation(
    Line(points = {{1, 40}, {30, 40}, {30, 8}}, color = {0, 0, 127}));
  connect(Cps.y, g.u) annotation(
    Line(points = {{-58, 0}, {-22, 0}}, color = {0, 0, 127}));
  connect(g.y, Pbal.u1) annotation(
    Line(points = {{2, 0}, {22, 0}}, color = {0, 0, 127}));

  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 300, Tolerance = 1e-6, Interval = 0.6),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end BO_rigid_Islanded_generator;
