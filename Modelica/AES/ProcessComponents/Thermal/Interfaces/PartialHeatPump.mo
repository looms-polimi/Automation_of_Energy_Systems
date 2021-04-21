within AES.ProcessComponents.Thermal.Interfaces;

partial model PartialHeatPump
  parameter SI.HeatFlowRate Wmax = 100 "W at cmd01=1";
  SI.Temperature Tc, Th;
  SI.HeatFlowRate Qc, Qh, W;
  Real COPcool, COPheat;
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a hotPort "hot side thermal port" annotation(
    Placement(transformation(extent = {{-60, 60}, {-40, 80}}), iconTransformation(extent = {{-60, 80}, {60, 100}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b coldPort "cold side thermal port" annotation(
    Placement(transformation(extent = {{20, 60}, {40, 80}}), iconTransformation(extent = {{-60, -100}, {60, -80}})));
  Modelica.Blocks.Interfaces.RealInput cmd01 "command, 0-1 range" annotation(
    Placement(visible = true,transformation(extent = {{-100, -20}, {-60, 20}}, rotation = 0), iconTransformation(origin = {-81, -1}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
equation
  Tc = coldPort.T;
  Th = hotPort.T;
  Qc = coldPort.Q_flow;
  Qh = -hotPort.Q_flow;

/*
Given Wmax,COPheat,cmd01
solve([W  = Wmax*cmd01, 
       Qh = Qc + W,
       Qh = COPheat * W,  
       Qc = COPcool * W],
      [Qh,Qc,W,COPcool]);
*/

  W  = Wmax*cmd01;  
  Qh = Qc + W;
  Qh = COPheat * W;  
  Qc = COPcool*W;


  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(origin = {-0.600006, -5.69}, fillColor = {238, 238, 236}, fillPattern = FillPattern.Solid, extent = {{-61.4, 59.69}, {61.4, -59.69}}), Ellipse(lineColor = {204, 0, 0}, fillColor = {252, 175, 62}, fillPattern = FillPattern.Solid, extent = {{-80, 100}, {80, 40}}, endAngle = 360), Polygon(origin = {-2, 1}, rotation = -90, lineColor = {239, 41, 41}, fillColor = {114, 159, 207}, fillPattern = FillPattern.VerticalCylinder, lineThickness = 0.5, points = {{99, 20}, {99, -20}, {-1, -20}, {-1, -40}, {-40, 1}, {-1, 40}, {-1, 20}, {99, 20}}), Ellipse(origin = {1, 0},lineColor = {32, 74, 135}, fillColor = {114, 159, 207}, fillPattern = FillPattern.Solid, extent = {{-81, -40}, {81, -100}}, endAngle = 360)}));
end PartialHeatPump;