within AES.ControlBlocks.ActuationSchemes;

model SplitRange01
  extends Icons.ControlBlock;
  parameter Real DeadZone(final min = 1e-6, final max = 1 - 1e-6) = 0.1;
  Modelica.Blocks.Interfaces.RealInput CSi01 annotation(
  Placement(visible = true,transformation(extent = {{-100, -20}, {-60, 20}}, rotation = 0), iconTransformation(extent = {{-140, -20}, {-100, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput CSo01_pos annotation(
  Placement(visible = true,transformation(extent = {{60, 42}, {100, 82}}, rotation = 0), iconTransformation(extent = {{100, 40}, {140, 80}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput CSo01_neg annotation(
  Placement(visible = true,transformation(extent = {{60, -80}, {100, -40}}, rotation = 0), iconTransformation(extent = {{100, -80}, {140, -40}}, rotation = 0)));
protected
  parameter Real a = 1 / (DeadZone - 1);
  parameter Real b = DeadZone / (DeadZone - 1);
equation
  CSo01_pos = max(0, min(1, (-a * CSi01) + b));
  CSo01_neg = max(0, min(1, a * CSi01 + b));
annotation(
    Icon(graphics = {Text(origin = {-1, -1}, extent = {{-69, 73}, {69, -73}}, textString = "Split\nRange\n01")}));
end SplitRange01;