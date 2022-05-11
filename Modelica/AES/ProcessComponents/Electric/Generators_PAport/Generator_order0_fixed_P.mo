within AES.ProcessComponents.Electric.Generators_PAport;

model Generator_order0_fixed_P
  extends Icons.Generator;
  
  parameter SI.ApparentPower P=30e6 "generated (active) power";
  parameter SI.Frequency fnom=50 "nominal frequency";
  parameter Real dnom=25 "angle to yield rated power at sync speed [deg]";
  parameter SI.Time Tox=0.5 "proper ox period";
  parameter Real xi=0.9 "damping";

  AES.ProcessComponents.Electric.Interfaces.PowerAnglePort port annotation(
    Placement(visible = true, transformation(origin = {72, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
 
  Modelica.Blocks.Interfaces.RealOutput fg "local instantaneous generator frequency" annotation(
    Placement(visible = true, transformation(origin = {70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-2, -100}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  AES.ProcessComponents.Electric.Generators_PAport.Generator_order0_prescribed_P G(Prated = P, Tox = Tox, dnom = dnom, fnom = fnom, xi = xi)  annotation(
    Placement(visible = true, transformation(origin = {6, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Pg(y = P)  annotation(
    Placement(visible = true, transformation(origin = {-72, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
 connect(port, G.port) annotation(
    Line(points = {{72, 0}, {16, 0}}, color = {0, 0, 255}));
 connect(G.fg, fg) annotation(
    Line(points = {{6, -10}, {6, -30}, {70, -30}}, color = {0, 0, 127}));
 connect(G.Pcmd, Pg.y) annotation(
    Line(points = {{-4, 0}, {-60, 0}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002));
end Generator_order0_fixed_P;