within AES.Coursework.Typical_actuation_schemes;

model TimeDivisionOutput
  extends Icons.CourseworkModel;
  Modelica.Blocks.Continuous.TransferFunction Process(a = {5, 6, 1}, b = {2})  annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction Cfb(a = {5, 0}, b = {5, 1})  annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback fb annotation(
    Placement(visible = true, transformation(origin = {-90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression SP(y = if time < 1 then 0 else 0.6 + 0.5 * sign(sin((time - 1) / 20)))  annotation(
    Placement(visible = true, transformation(origin = {-130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.ActuationSchemes.TimeDivisionOutput TDO annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(fb.y, Cfb.u) annotation(
    Line(points = {{-81, 10}, {-62, 10}}, color = {0, 0, 127}));
  connect(SP.y, fb.u1) annotation(
    Line(points = {{-119, 10}, {-98, 10}}, color = {0, 0, 127}));
  connect(Process.y, fb.u2) annotation(
    Line(points = {{41, 10}, {62, 10}, {62, -40}, {-90, -40}, {-90, 2}}, color = {0, 0, 127}));
  connect(Cfb.y, TDO.cmd01) annotation(
    Line(points = {{-38, 10}, {-22, 10}}, color = {0, 0, 127}));
  connect(TDO.TDO, Process.u) annotation(
    Line(points = {{2, 10}, {18, 10}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 300, Tolerance = 1e-6, Interval = 0.6),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end TimeDivisionOutput;