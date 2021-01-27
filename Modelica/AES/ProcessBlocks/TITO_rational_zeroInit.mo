within AES.ProcessBlocks;

model TITO_rational_zeroInit
  extends Icons.ProcessBlock;
  parameter Real[:] P11n = {1};
  parameter Real[:] P11d = {1,1};
  parameter Real[:] P12n = {0.5};
  parameter Real[:] P12d = {2,1};
  parameter Real[:] P21n = {0.3};
  parameter Real[:] P21d = {3,1};
  parameter Real[:] P22n = {1.5};
  parameter Real[:] P22d = {1.2,1};

  Modelica.Blocks.Interfaces.RealOutput y1 annotation(
    Placement(visible = true, transformation(origin = {180, 54}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {100, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u1 annotation(
    Placement(visible = true, transformation(origin = {-140, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u2 annotation(
    Placement(visible = true, transformation(origin = {-140, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y2 annotation(
    Placement(visible = true, transformation(origin = {180, -54}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {100, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));

protected
  Modelica.Blocks.Continuous.TransferFunction P11(a = P11d, b = P11n, initType =  Modelica.Blocks.Types.Init.InitialOutput, y_start = 0) annotation(
    Placement(visible = true, transformation(origin = {-10, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Blocks.Continuous.TransferFunction P12(a = P12d, b = P12n, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = 0) annotation(
    Placement(visible = true, transformation(origin = {-10, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction P21(a = P21d, b = P21n, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = 0) annotation(
    Placement(visible = true, transformation(origin = {-10, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction P22(a = P22d, b = P22n, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = 0) annotation(
    Placement(visible = true, transformation(origin = {-10, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add a1 annotation(
    Placement(visible = true, transformation(origin = {110, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add a2 annotation(
    Placement(visible = true, transformation(origin = {110, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(P21.y, a2.u1) annotation(
    Line(points = {{2, -20}, {60, -20}, {60, -48}, {98, -48}, {98, -48}}, color = {0, 0, 127}));
  connect(u1, P21.u) annotation(
    Line(points = {{-140, 60}, {-60, 60}, {-60, -20}, {-22, -20}, {-22, -20}}, color = {0, 0, 127}));
  connect(u2, P12.u) annotation(
    Line(points = {{-140, -60}, {-80, -60}, {-80, 20}, {-22, 20}, {-22, 20}}, color = {0, 0, 127}));
  connect(P12.y, a1.u2) annotation(
    Line(points = {{2, 20}, {60, 20}, {60, 48}, {98, 48}, {98, 48}}, color = {0, 0, 127}));
  connect(a2.y, y2) annotation(
    Line(points = {{122, -54}, {160, -54}, {160, -54}, {180, -54}}, color = {0, 0, 127}));
  connect(P22.y, a2.u2) annotation(
    Line(points = {{2, -60}, {98, -60}, {98, -60}, {98, -60}}, color = {0, 0, 127}));
  connect(a1.y, y1) annotation(
    Line(points = {{121, 54}, {180, 54}}, color = {0, 0, 127}));
  connect(P11.y, a1.u1) annotation(
    Line(points = {{1, 60}, {98, 60}}, color = {0, 0, 127}));
  connect(u2, P22.u) annotation(
    Line(points = {{-140, -60}, {-24, -60}, {-24, -60}, {-22, -60}}, color = {0, 0, 127}));
  connect(u1, P11.u) annotation(
    Line(points = {{-140, 60}, {-22, 60}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    Icon(graphics = {Text(origin = {-24, 7}, extent = {{-52, 23}, {96, -33}}, textString = "TITOr0"), Text(origin = {42, -80}, extent = {{-44, 12}, {44, -12}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002));
end TITO_rational_zeroInit;