within AES.Coursework.Tuning_brushup;

model MSL_loop_SPtimeTable
  extends Icons.CourseworkModel;

  Modelica.Blocks.Continuous.TransferFunction Process(a = {0.1, 1.1, 1}, b = {1})  annotation(
    Placement(visible = true, transformation(origin = {70, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction C(a = {1, 0}, b = 4 * {1, 1})  annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add ald annotation(
    Placement(visible = true, transformation(origin = {30, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback fb annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression LD(y = if time < 10 then 0 else 0.2)  annotation(
    Placement(visible = true, transformation(origin = {-30, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.TimeTable SP(table = [0, 0; 1, 0; 1, 1; 5, 1; 6, 2; 8, 2; 9, 1; 10, 1])  annotation(
    Placement(visible = true, transformation(origin = {-132, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(C.y, ald.u2) annotation(
    Line(points = {{1, 10}, {18, 10}}, color = {0, 0, 127}));
  connect(ald.y, Process.u) annotation(
    Line(points = {{41, 16}, {57, 16}}, color = {0, 0, 127}));
  connect(fb.y, C.u) annotation(
    Line(points = {{-40, 10}, {-22, 10}}, color = {0, 0, 127}));
  connect(LD.y, ald.u1) annotation(
    Line(points = {{-19, 70}, {10, 70}, {10, 22}, {18, 22}}, color = {0, 0, 127}));
  connect(Process.y, fb.u2) annotation(
    Line(points = {{82, 16}, {100, 16}, {100, -20}, {-50, -20}, {-50, 2}}, color = {0, 0, 127}));
  connect(SP.y, fb.u1) annotation(
    Line(points = {{-120, 10}, {-58, 10}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 15, Tolerance = 1e-6, Interval = 0.03),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end MSL_loop_SPtimeTable;