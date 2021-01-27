within AES.ControlBlocks.DigitalControllers;

model PI_awfb_bias
extends Icons.DigitalController200x200;
  Modelica.Blocks.Interfaces.RealInput SP annotation(
    Placement(visible = true, transformation(origin = {-86, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput PV annotation(
    Placement(visible = true, transformation(origin = {-94, -46}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -42}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput iBias annotation(
    Placement(visible = true, transformation(origin = {-12, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput CS annotation(
    Placement(visible = true, transformation(origin = {118, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  parameter Real K = 1;
  parameter Real Ti = 1;
  parameter Real CSmin = -1;
  parameter Real CSmax = -1;
  parameter Real CSstart = 0;
  parameter Real Ts = 0.05;
  discrete Real xBias, iBiaso, fBias, xfb, ulin, ulino, u;
equation
  CS = u;
algorithm
  when sample(0, Ts) then
    xBias  := Ti*(xBias+iBias-iBiaso)/(Ti+Ts);
    fBias  := iBias-xBias;
    iBiaso := iBias;
    xfb    := (Ti*xfb+Ts*u)/(Ti+Ts);
    ulin   := K * (SP - PV) + xfb + fBias;
    ulino  := ulin;
    u      := max(CSmin, min(CSmax, ulin));
  end when;
initial algorithm
  u := CSstart;
  ulin := u;
  ulino := ulin;
  xfb := 0;
  iBiaso := iBias;
  xBias := 0;
  fBias := 0;
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    Icon(graphics = {Text(origin = {-2, -5}, extent = {{-50, 59}, {50, -59}}, textString = "PI")}));
end PI_awfb_bias;