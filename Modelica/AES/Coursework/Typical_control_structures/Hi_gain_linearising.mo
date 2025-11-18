within AES.Coursework.Typical_control_structures;

model Hi_gain_linearising
  Modelica.Blocks.Continuous.TransferFunction Pol(b = {1}, a = {1, 1.5, 1})  annotation(
    Placement(transformation(origin = {70, 30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression NLCol(y = 0.5*w.y + 0.5*w.y^4)  annotation(
    Placement(transformation(origin = {20, 30}, extent = {{-20, -10}, {20, 10}})));
  Modelica.Blocks.Sources.RealExpression NLCcl(y = 0.5*C.y + 0.5*C.y^4) annotation(
    Placement(transformation(origin = {20, -10}, extent = {{-20, -10}, {20, 10}})));
  Modelica.Blocks.Continuous.TransferFunction Pcl(a = {1, 1.5, 1}, b = {1}) annotation(
    Placement(transformation(origin = {70, -10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.TransferFunction C(b = {1, 2, 1}, a = {0.2, 1, 0})  annotation(
    Placement(transformation(origin = {-30, -10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression w(y = if time < 1 then 0 else min(1, 0.5*(time - 1)))  annotation(
    Placement(transformation(origin = {-130, -10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Feedback fb annotation(
    Placement(transformation(origin = {-70, -10}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(NLCol.y, Pol.u) annotation(
    Line(points = {{42, 30}, {58, 30}}, color = {0, 0, 127}));
  connect(NLCcl.y, Pcl.u) annotation(
    Line(points = {{42, -10}, {58, -10}}, color = {0, 0, 127}));
  connect(w.y, fb.u1) annotation(
    Line(points = {{-118, -10}, {-78, -10}}, color = {0, 0, 127}));
  connect(Pcl.y, fb.u2) annotation(
    Line(points = {{82, -10}, {100, -10}, {100, -40}, {-70, -40}, {-70, -18}}, color = {0, 0, 127}));
  connect(fb.y, C.u) annotation(
    Line(points = {{-60, -10}, {-42, -10}}, color = {0, 0, 127}));

annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
  __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"));
end Hi_gain_linearising;