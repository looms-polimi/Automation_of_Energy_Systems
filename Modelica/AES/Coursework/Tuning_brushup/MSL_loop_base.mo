within AES.Coursework.Tuning_brushup;

model MSL_loop_base
  extends Icons.CourseworkModel;

  Modelica.Blocks.Continuous.TransferFunction Process(a = {5, 6, 1}, b = {1})  annotation(
    Placement(visible = true, transformation(origin = {70, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction Cfb(a = {5, 0}, b = 4 * {5, 1})  annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add ald annotation(
    Placement(visible = true, transformation(origin = {30, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback fb annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression SP(y = if time < 1 then 0 else 1)  annotation(
    Placement(visible = true, transformation(origin = {-90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression LD(y = if time < 30 then 0 else 0.2)  annotation(
    Placement(visible = true, transformation(origin = {-90, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Cfb.y, ald.u2) annotation(
    Line(points = {{1, 10}, {18, 10}}, color = {0, 0, 127}));
  connect(ald.y, Process.u) annotation(
    Line(points = {{41, 16}, {57, 16}}, color = {0, 0, 127}));
  connect(fb.y, Cfb.u) annotation(
    Line(points = {{-40, 10}, {-22, 10}}, color = {0, 0, 127}));
  connect(LD.y, ald.u1) annotation(
    Line(points = {{-79, 40}, {10, 40}, {10, 22}, {18, 22}}, color = {0, 0, 127}));
  connect(SP.y, fb.u1) annotation(
    Line(points = {{-79, 10}, {-58, 10}}, color = {0, 0, 127}));
  connect(Process.y, fb.u2) annotation(
    Line(points = {{82, 16}, {100, 16}, {100, -20}, {-50, -20}, {-50, 2}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-6, Interval = 0.12),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=aliasConflicts ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end MSL_loop_base;