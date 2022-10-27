within AES.Devel_test_models;

model Test_digital_PI_awfb_full
  extends Icons.TestModel;
  AES.ControlBlocks.DigitalControllers.PI_awfb_full C(K = 5, hasBias = true, hasLocks = true, hasOvrMax = true, hasOvrMin = true, hasTracking = true) annotation(
    Placement(visible = true, transformation(origin = {-29, 17}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression w(y = if time < 1 then 0 else 0.5 + 0.1 * sin(time / 4)) annotation(
    Placement(visible = true, transformation(origin = {-150, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder P(T = 4, y(fixed = true)) annotation(
    Placement(visible = true, transformation(origin = {14, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression b(y = if time < 29 then 0 else -0.4) annotation(
    Placement(visible = true, transformation(origin = {-130, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression tr(y = 0.2) annotation(
    Placement(visible = true, transformation(origin = {-150, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression ts(y = time > 35 and time < 40) annotation(
    Placement(visible = true, transformation(origin = {-130, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression noinc(y = time > 45 and time < 50) annotation(
    Placement(visible = true, transformation(origin = {-130, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression nodec(y = time > 60 and time < 65) annotation(
    Placement(visible = true, transformation(origin = {-150, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression ovrmax(y = if time > 70 and time < 75 then 0.9 else -1) annotation(
    Placement(visible = true, transformation(origin = {-130, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression ovrmin(y = if time > 90 and time < 95 then 0.1 else 1) annotation(
    Placement(visible = true, transformation(origin = {-150, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(C.CS, P.u) annotation(
    Line(points = {{-12, 29}, {-7, 29}, {-7, 28}, {2, 28}}, color = {0, 0, 127}));
  connect(P.y, C.PV) annotation(
    Line(points = {{25, 28}, {40, 28}, {40, -20}, {-56, -20}, {-56, 25.5}, {-46, 25.5}}, color = {0, 0, 127}));
  connect(ts.y, C.TS) annotation(
    Line(points = {{-119, 20}, {-82.5, 20}, {-82.5, 22}, {-46, 22}}, color = {255, 0, 255}));
  connect(w.y, C.SP) annotation(
    Line(points = {{-139, 30}, {-89.5, 30}, {-89.5, 29}, {-46, 29}}, color = {0, 0, 127}));
  connect(b.y, C.Bias) annotation(
    Line(points = {{-119, 42}, {-29, 42}, {-29, 34}}, color = {0, 0, 127}));
  connect(tr.y, C.TR) annotation(
    Line(points = {{-139, 10}, {-93.5, 10}, {-93.5, 19}, {-46, 19}}, color = {0, 0, 127}));
  connect(C.noInc, noinc.y) annotation(
    Line(points = {{-46, 15}, {-88, 15}, {-88, 0}, {-119, 0}}, color = {255, 0, 255}));
  connect(C.noDec, nodec.y) annotation(
    Line(points = {{-46, 12}, {-82, 12}, {-82, -10}, {-139, -10}}, color = {255, 0, 255}));
  connect(C.ovrMax, ovrmax.y) annotation(
    Line(points = {{-46, 9}, {-76, 9}, {-76, -20}, {-119, -20}}, color = {0, 0, 127}));
  connect(ovrmin.y, C.ovrMin) annotation(
    Line(points = {{-139, -30}, {-70, -30}, {-70, 5}, {-46, 5}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 120, Tolerance = 1e-06, Interval = 0.2));
end Test_digital_PI_awfb_full;