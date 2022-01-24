within AES.ControlBlocks.ActuationSchemes;

model u01_yMinMax
  extends Icons.ControlBlock;
  parameter Real y0=1 "y for u=0";
  parameter Real y1=5 "y for u=1";
  Modelica.Blocks.Interfaces.RealInput CSi01 annotation(
  Placement(visible = true,transformation(extent = {{-100, -20}, {-60, 20}}, rotation = 0), iconTransformation(extent = {{-140, -20}, {-100, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput CSoMInMax annotation(
  Placement(visible = true,transformation(extent = {{60, 42}, {100, 82}}, rotation = 0), iconTransformation(extent = {{98, -20}, {138, 20}}, rotation = 0)));
equation
  CSoMInMax = y0+(y1-y0)*max(0,min(1,CSi01));
annotation(
    Icon(graphics = {Text(origin = {-1, -1}, extent = {{-69, 73}, {69, -73}}, textString = "01-mM")}));
end u01_yMinMax;