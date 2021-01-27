within AES.ProcessBlocks;

model FOPDT
extends Icons.ProcessBlock;
  parameter Real mu=1 "gain";
  parameter Real T=1 "time constant";
  parameter Real D=0 "delay";
  parameter Real ystart=0 "initial output";
  
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-98, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(visible = true, transformation(origin = {102, -3.55271e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {98, -2}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder Pr(T = T, k = mu, y(fixed = true), y_start = ystart)  annotation(
    Placement(visible = true, transformation(origin = {-32, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.FixedDelay Pd(delayTime = D)  annotation(
    Placement(visible = true, transformation(origin = {30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Pr.y, Pd.u) annotation(
    Line(points = {{-20, 0}, {16, 0}, {16, 0}, {18, 0}}, color = {0, 0, 127}));
  connect(Pd.y, y) annotation(
    Line(points = {{42, 0}, {88, 0}, {88, 0}, {102, 0}}, color = {0, 0, 127}));
  connect(u, Pr.u) annotation(
    Line(points = {{-100, 0}, {-42, 0}, {-42, 0}, {-44, 0}}, color = {0, 0, 127}));

annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    Icon(graphics = {Text(origin = {-18, 67}, extent = {{-52, 23}, {82, -39}}, textString = "FOPDT"), Text(origin = {50, -80}, extent = {{-44, 12}, {44, -12}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)),
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002));end FOPDT;