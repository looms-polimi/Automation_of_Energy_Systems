within AES.ControlBlocks.DigitalControllers;

model PI_awfb_basic
extends Icons.DigitalController200x200;
  Modelica.Blocks.Interfaces.RealInput SP annotation(
    Placement(visible = true, transformation(origin = {-86, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput PV annotation(
    Placement(visible = true, transformation(origin = {-94, -46}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -46}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput CS annotation(
    Placement(visible = true, transformation(origin = {118, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  parameter Real K = 1;
  parameter Real Ti = 1;
  parameter Real CSmin = -1;
  parameter Real CSmax = -1;
  parameter Real CSstart = 0;
  parameter Real Ts = 0.05;
  discrete Real xfb, ulin, ulino, u;
equation
  CS - u = 0;
algorithm
  when sample(0, Ts) then
    xfb    := (Ti*xfb+Ts*u)/(Ti+Ts);
    ulin   := K * (SP - PV) + xfb;
    ulino  := ulin;
    u      := max(CSmin, min(CSmax, ulin));
  end when;
initial algorithm
  u := CSstart;
  ulin := u;
  ulino := ulin;
  xfb := 0;
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    Icon(graphics = {Text(origin = {-2, -5}, extent = {{-50, 59}, {50, -59}}, textString = "PI")}));
end PI_awfb_basic;