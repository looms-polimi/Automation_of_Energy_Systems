within AES.Coursework.ThermSys_case_studies.HVAC_floor;

model Room
  parameter Real roair = 1.2;
  parameter Real rowall = 1200;
  parameter Real cair = 1020;
  parameter Real cwall = 800;
  parameter Real lambdawall = 1.8;
  parameter Real gammafloor = 10;
  parameter Real gammawall = 15;
  parameter Real Lroom = 5;
  parameter Real Wroom = 5;
  parameter Real Hroom = 3;
  parameter Real twall = 0.3;
  parameter Real tfloor = 0.2;
  parameter Real Tstart = 20;
 
  
  parameter Real Ca   = Lroom*Wroom*Hroom*roair*cair;
  parameter Real Cf   = Lroom*Wroom*tfloor*rowall*cwall;
  parameter Real Cw   = Lroom*Hroom*twall*rowall*cwall;
  parameter Real Gfa  = 1/(1/(lambdawall*Lroom*Wroom/(tfloor/2)) + 1/(gammafloor*Lroom*Wroom));
  parameter Real Gaw  = 1/(1/(gammawall*Lroom*Hroom) + 1/(lambdawall*Lroom*Hroom/(twall/2)));
  parameter Real Gwe  = Gaw;
   

  Modelica.Blocks.Interfaces.RealInput Phfloor annotation(
    Placement(transformation(origin = {-116, 56}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealInput Phair annotation(
    Placement(transformation(origin = {-126, 4}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealInput Pcair annotation(
    Placement(transformation(origin = {-164, -48}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealOutput Tfloor(start=Tstart,fixed=true) annotation(
    Placement(transformation(origin = {6, -14}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealOutput Tair(start=Tstart,fixed=true) annotation(
    Placement(transformation(origin = {6, -14}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {120, 60}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealOutput Twall(start=Tstart,fixed=true) annotation(
    Placement(transformation(origin = {24, -78}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {120, -58}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealInput Tamb annotation(
    Placement(transformation(origin = {-40, 4}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {40, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput Vphren "air renovation flow in volumes per hour" annotation(
    Placement(transformation(origin = {-30, 14}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-40, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));

  Real wren;

equation
  wren           = Vphren*Lroom*Wroom*Hroom*roair/3600;
  Cf*der(Tfloor) = Phfloor-Gfa*(Tfloor-Tair);
  Ca*der(Tair)   = Phair-Pcair+Gfa*(Tfloor-Tair)-Gaw*(Tair-Twall)+wren*cair*(Tamb-Tair);
  Cw*der(Twall)  = Gaw*(Tair-Twall)-Gwe*(Twall-Tamb);
annotation(
    Icon(graphics = {Rectangle(fillColor = {218, 218, 218}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(extent = {{100, 46}, {100, 46}}, textString = "text"), Text(origin = {-3, 1}, extent = {{-73, 31}, {73, -31}}, textString = "Room")}));
end Room;