within AES.ControlBlocks.DigitalControllers;

model PI_irfb_bias
extends Icons.DigitalController200x200;
  Modelica.Blocks.Interfaces.RealInput SP annotation(
    Placement(visible = true, transformation(origin = {-86, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput PV annotation(
    Placement(visible = true, transformation(origin = {-94, -46}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Bias annotation(
    Placement(visible = true, transformation(origin = {-12, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {0, 100}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput CS annotation(
    Placement(visible = true, transformation(origin = {118, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealInput TR annotation(
      Placement(visible = true, transformation(origin = {-84, -36}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
Modelica.Blocks.Interfaces.BooleanInput TS annotation(
      Placement(visible = true, transformation(origin = {-116, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  parameter Real K = 1;
  parameter Real Ti = 1;
  parameter Real CSmin = -1;
  parameter Real CSmax = -1;
  parameter Real Ts = 0.05;
  discrete Real e, cs, csp, csi, csi_prev(start = 0);
equation
  CS = cs;
algorithm
  when sample(0, Ts) then
    e := SP - PV;
    csp := K * e;
    if TS then
       cs := TR;
    else
       csi := csi_prev + K * Ts / Ti * e;
       cs  := csp + csi + Bias;
    end if;
    cs := max(CSmin, min(CSmax, cs));
    csi_prev := cs - csp - Bias;
  end when;
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})));
end PI_irfb_bias;
