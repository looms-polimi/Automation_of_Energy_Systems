within AES.ControlBlocks.AnalogueControllers;

model PI_awfb_bias
extends Icons.AnalogueController200x200;
  Modelica.Blocks.Interfaces.RealInput SP annotation(
    Placement(visible = true, transformation(origin = {-180, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput PV annotation(
    Placement(visible = true, transformation(origin = {-180, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -42}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput CS annotation(
    Placement(visible = true, transformation(origin = {180, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  parameter Real K = 1;
  parameter Real Ti = 1;
  parameter Real CSmin = -1;
  parameter Real CSmax = 1;
  Modelica.Blocks.Math.Gain gK(k = K) annotation(
    Placement(visible = true, transformation(origin = {-60, -1.11022e-16}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback e annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder FO(T = Ti, initType = Modelica.Blocks.Types.Init.InitialOutput, k = 1) annotation(
    Placement(visible = true, transformation(origin = {58, -60}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter sat(uMax = CSmax, uMin = CSmin) annotation(
    Placement(visible = true, transformation(origin = {98, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Bias annotation(
    Placement(visible = true, transformation(origin = {-180, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Math.Add3 add1 annotation(
    Placement(visible = true, transformation(origin = {18, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Continuous.Derivative dBias(T = Ti, initType = Modelica.Blocks.Types.Init.InitialOutput, k = Ti)  annotation(
    Placement(visible = true, transformation(origin = {-98, 62}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(e.y, gK.u) annotation(
    Line(points = {{-102, 0}, {-84, 0}}, color = {0, 0, 127}));
  connect(SP, e.u1) annotation(
    Line(points = {{-180, 0}, {-138, 0}, {-138, 0}, {-136, 0}}, color = {0, 0, 127}));
  connect(PV, e.u2) annotation(
    Line(points = {{-180, -40}, {-120, -40}, {-120, -16}, {-120, -16}}, color = {0, 0, 127}));
  connect(sat.y, FO.u) annotation(
    Line(points = {{120, 0}, {138, 0}, {138, -60}, {82, -60}, {82, -60}}, color = {0, 0, 127}));
  connect(sat.y, CS) annotation(
    Line(points = {{120, 0}, {180, 0}}, color = {0, 0, 127}));
  connect(gK.y, add1.u2) annotation(
    Line(points = {{-38, 0}, {-6, 0}}, color = {0, 0, 127}));
  connect(add1.y, sat.u) annotation(
    Line(points = {{40, 0}, {74, 0}}, color = {0, 0, 127}));
  connect(FO.y, add1.u3) annotation(
    Line(points = {{36, -60}, {-20, -60}, {-20, -16}, {-6, -16}}, color = {0, 0, 127}));
  connect(Bias, dBias.u) annotation(
    Line(points = {{-180, 60}, {-151, 60}, {-151, 62}, {-122, 62}}, color = {0, 0, 127}));
  connect(dBias.y, add1.u1) annotation(
    Line(points = {{-76, 62}, {-20, 62}, {-20, 16}, {-6, 16}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    Icon(graphics = {Text(origin = {-2, -5}, extent = {{-50, 59}, {50, -59}}, textString = "PI")}, coordinateSystem(initialScale = 0.1)));
end PI_awfb_bias;