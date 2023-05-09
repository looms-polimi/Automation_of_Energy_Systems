within AES.Coursework.ThermSys_control_problems.Flow_pressure_control_liquids;

model Valve_linearisation_case_004_LTI
  extends AES.Icons.CourseworkModel;
  parameter Real c = 3.5;
  /* 3.5 achieves quasi-linear inst char in 0.2-0.8*/
  Modelica.Blocks.Sources.RealExpression w(y = 0.5 + 0.2 * sin(0.18* time)) annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessBlocks.NLchar f_c(y = max(0, min(1, (f_c.u + f_c.u ^ 2) / 2))) annotation(
    Placement(visible = true, transformation(origin = {48, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessBlocks.NLchar f_ic(y = max(0, min(1, (sqrt(8 * f_ic.u + 1) - 1) / 2))) annotation(
    Placement(visible = true, transformation(origin = {130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction A(a = {10, 1}) annotation(
    Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction C(a = {1, 0}, b = 5 * {10, 1}) annotation(
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback fb annotation(
    Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(f_c.y, A.u) annotation(
    Line(points = {{60, 10}, {78, 10}}, color = {0, 0, 127}));
  connect(A.y, f_ic.u) annotation(
    Line(points = {{101, 10}, {118, 10}}, color = {0, 0, 127}));
  connect(w.y, fb.u1) annotation(
    Line(points = {{-59, 10}, {-38, 10}}, color = {0, 0, 127}));
  connect(fb.y, C.u) annotation(
    Line(points = {{-21, 10}, {-3, 10}}, color = {0, 0, 127}));
  connect(f_ic.y, fb.u2) annotation(
    Line(points = {{142, 10}, {160, 10}, {160, -20}, {-30, -20}, {-30, 2}}, color = {0, 0, 127}));
  connect(C.y, f_c.u) annotation(
    Line(points = {{21, 10}, {36, 10}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 200, Tolerance = 1e-9, Interval = 0.04),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}}), graphics = {Text(origin = {-110, 30}, extent = {{-70, 10}, {70, -10}}, textString = "try sin of 0.1*time,0.15*time,0.2*time")}));
end Valve_linearisation_case_004_LTI;