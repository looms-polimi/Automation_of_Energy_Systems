within AES.Devel_test_models;

model Test_TITO_rational_zeroInit
  extends Icons.TestModel;
  Modelica.Blocks.Sources.RealExpression u2(y = if time < 10 then 0 else 1) annotation(
    Placement(visible = true, transformation(origin = {-70, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression u1(y = if time < 1 then 0 else 1) annotation(
    Placement(visible = true, transformation(origin = {-70, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessBlocks.TITO_rational_zeroInit P annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(u2.y, P.u2) annotation(
    Line(points = {{-58, -20}, {-30, -20}, {-30, -4}, {-10, -4}}, color = {0, 0, 127}));
  connect(u1.y, P.u1) annotation(
    Line(points = {{-58, 20}, {-30, 20}, {-30, 4}, {-10, 4}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 25, Tolerance = 1e-06, Interval = 0.05));
end Test_TITO_rational_zeroInit;
