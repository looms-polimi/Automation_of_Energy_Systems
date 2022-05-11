within AES.ProcessComponents.Electric.Generators_PAport;

model Generator_1stOrder_prescribed_P
  extends Icons.Generator;
  
  parameter SI.ApparentPower Prated=30e6 "rated (active) power";
  parameter SI.Frequency fnom=50 "nominal frequency";
  parameter Real dnom=25 "angle to yield rated power at sync speed [deg]";
  parameter SI.Time Tac=1 "actuation time constant";
  parameter SI.Time Tox=0.5 "proper ox period";
  parameter Real xi=0.9 "damping";

  AES.ProcessComponents.Electric.Interfaces.PowerAnglePort port annotation(
    Placement(visible = true, transformation(origin = {72, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
 
  Modelica.Blocks.Interfaces.RealOutput fg "local instantaneous generator frequency" annotation(
    Placement(visible = true, transformation(origin = {70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-2, -100}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  AES.ProcessComponents.Electric.Generators_PAport.Generator_order0_prescribed_P G(Prated = Prated, Tox = Tox, dnom = dnom, fnom = fnom, xi = xi)  annotation(
    Placement(visible = true, transformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 Modelica.Blocks.Continuous.FirstOrder Gact(T = Tac, k = 1)  annotation(
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 Modelica.Blocks.Interfaces.RealInput Pcmd annotation(
    Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(port, G.port) annotation(
    Line(points = {{72, 0}, {20, 0}}, color = {0, 0, 255}));
  connect(G.fg, fg) annotation(
    Line(points = {{10, -10}, {10, -30}, {70, -30}}, color = {0, 0, 127}));
  connect(Gact.y, G.Pcmd) annotation(
    Line(points = {{-18, 0}, {0, 0}}, color = {0, 0, 127}));
 connect(Pcmd, Gact.u) annotation(
    Line(points = {{-80, 0}, {-42, 0}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002));
end Generator_1stOrder_prescribed_P;