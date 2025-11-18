within AES.Devel_test_models;

model dz2
  parameter Real DZ=0.001;
  Modelica.Blocks.Sources.RealExpression SR_plus(y = if C.y > 0.001 then C.y - DZ else 0)  annotation(
    Placement(transformation(origin = {10, 30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression SR_minus(y = if C.y < -0.001 then -C.y - 9.001 else 0)  annotation(
    Placement(transformation(origin = {10, -10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.FirstOrder Aplus(k = 1, T = 2)  annotation(
    Placement(transformation(origin = {50, 30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.FirstOrder Aminus(k = -1, T = 2)  annotation(
    Placement(transformation(origin = {50, -10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.FirstOrder P(k = 1, T = 5)  annotation(
    Placement(transformation(origin = {148, 10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression SP(y = 0) annotation(
    Placement(transformation(origin = {-170, 12}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Add3 add annotation(
    Placement(transformation(origin = {108, 10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression LD(y = sin(time/5)) annotation(
    Placement(transformation(origin = {30, 70}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.PI C(k = 5, T = 5)  annotation(
    Placement(transformation(origin = {-50, 12}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Feedback fb annotation(
    Placement(transformation(origin = {-124, 12}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Nonlinear.DeadZone dz(uMax = DZ, uMin = -DZ)  annotation(
    Placement(transformation(origin = {-88, 12}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(Aplus.y, add.u2) annotation(
    Line(points = {{62, 30}, {78, 30}, {78, 10}, {96, 10}}, color = {0, 0, 127}));
  connect(Aminus.y, add.u3) annotation(
    Line(points = {{62, -10}, {80, -10}, {80, 2}, {96, 2}}, color = {0, 0, 127}));
  connect(add.y, P.u) annotation(
    Line(points = {{120, 10}, {136, 10}}, color = {0, 0, 127}));
  connect(LD.y, add.u1) annotation(
    Line(points = {{42, 70}, {90, 70}, {90, 18}, {96, 18}}, color = {0, 0, 127}));
  connect(SR_plus.y, Aplus.u) annotation(
    Line(points = {{22, 30}, {38, 30}}, color = {0, 0, 127}));
  connect(SR_minus.y, Aminus.u) annotation(
    Line(points = {{22, -10}, {38, -10}}, color = {0, 0, 127}));
  connect(SP.y, fb.u1) annotation(
    Line(points = {{-158, 12}, {-132, 12}}, color = {0, 0, 127}));
  connect(P.y, fb.u2) annotation(
    Line(points = {{160, 10}, {172, 10}, {172, -52}, {-124, -52}, {-124, 4}}, color = {0, 0, 127}));
  connect(fb.y, dz.u) annotation(
    Line(points = {{-114, 12}, {-100, 12}}, color = {0, 0, 127}));
  connect(dz.y, C.u) annotation(
    Line(points = {{-76, 12}, {-62, 12}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  experiment(StartTime = 0, StopTime = 200, Tolerance = 1e-06, Interval = 0.1),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
  __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"));
end dz2;