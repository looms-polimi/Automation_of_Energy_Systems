within AES.ControlBlocks.AnalogueControllers;

model PI_awfb_basic
extends Icons.AnalogueController200x200;
  Modelica.Blocks.Interfaces.RealInput SP annotation(
    Placement(visible = true, transformation(origin = {-180, 12}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 62}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput PV annotation(
    Placement(visible = true, transformation(origin = {-180, -28}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -44}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput CS annotation(
    Placement(visible = true, transformation(origin = {180, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  parameter Real K = 1;
  parameter Real Ti = 1;
  parameter Real CSmin = -1;
  parameter Real CSmax = 1;
  Modelica.Blocks.Math.Gain gK(k = K) annotation(
    Placement(visible = true, transformation(origin = {-70, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback e annotation(
    Placement(visible = true, transformation(origin = {-120, 12}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder FO(T = Ti, initType = Modelica.Blocks.Types.Init.InitialOutput, k = 1) annotation(
    Placement(visible = true, transformation(origin = {40, -60}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter sat(uMax = CSmax, uMin = CSmin) annotation(
    Placement(visible = true, transformation(origin = {80, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {-6.21725e-15, -2.88658e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(e.y, gK.u) annotation(
    Line(points = {{-102, 12}, {-82, 12}, {-82, 12}, {-82, 12}}, color = {0, 0, 127}));
  connect(gK.y, add1.u1) annotation(
    Line(points = {{-59, 12}, {-24, 12}}, color = {0, 0, 127}));
  connect(SP, e.u1) annotation(
    Line(points = {{-180, 12}, {-138, 12}, {-138, 12}, {-136, 12}}, color = {0, 0, 127}));
  connect(PV, e.u2) annotation(
    Line(points = {{-180, -28}, {-120, -28}, {-120, -4}, {-120, -4}}, color = {0, 0, 127}));
  connect(add1.u2, FO.y) annotation(
    Line(points = {{-24, -12}, {-40, -12}, {-40, -60}, {18, -60}, {18, -60}}, color = {0, 0, 127}));
  connect(add1.y, sat.u) annotation(
    Line(points = {{22, 0}, {54, 0}, {54, 0}, {56, 0}}, color = {0, 0, 127}));
  connect(sat.y, FO.u) annotation(
    Line(points = {{102, 0}, {120, 0}, {120, -60}, {64, -60}, {64, -60}}, color = {0, 0, 127}));
  connect(sat.y, CS) annotation(
    Line(points = {{102, 0}, {162, 0}, {162, 0}, {180, 0}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    Icon(graphics = {Text(origin = {-2, -5}, extent = {{-50, 59}, {50, -59}}, textString = "PI")}, coordinateSystem(initialScale = 0.1)));
end PI_awfb_basic;