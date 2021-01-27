within AES.Devel_test_models;

model Test_FOPDT
  extends Icons.TestModel;
  AES.ProcessBlocks.FOPDT P1(T = 2, mu = 1)  annotation(
    Placement(visible = true, transformation(origin = {-10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessBlocks.FOPDT P2(D = 3, T = 2, mu = 1, ystart = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {-10, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression u(y = if time < 1 then 0 else 1)  annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(u.y, P2.u) annotation(
    Line(points = {{-58, 30}, {-40, 30}, {-40, -10}, {-20, -10}}, color = {0, 0, 127}));
  connect(u.y, P1.u) annotation(
    Line(points = {{-59, 30}, {-20, 30}}, color = {0, 0, 127}));

annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 15, Tolerance = 1e-6, Interval = 0.03));end Test_FOPDT;
