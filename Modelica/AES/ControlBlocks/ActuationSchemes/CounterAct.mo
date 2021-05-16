within AES.ControlBlocks.ActuationSchemes;

model CounterAct
  extends Icons.ControlBlock;
  Modelica.Blocks.Interfaces.RealInput CSi01 annotation(
  Placement(visible = true,transformation(extent = {{-100, -20}, {-60, 20}}, rotation = 0), iconTransformation(extent = {{-140, -20}, {-100, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput CSo01 annotation(
  Placement(visible = true,transformation(extent = {{60, 42}, {100, 82}}, rotation = 0), iconTransformation(extent = {{100, 40}, {140, 80}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput CSo10 annotation(
  Placement(visible = true,transformation(extent = {{60, -80}, {100, -40}}, rotation = 0), iconTransformation(extent = {{100, -80}, {140, -40}}, rotation = 0)));
equation
  CSo01 = max(0,min(1,CSi01));
  CSo10 = 1-CSo01;
annotation(
    Icon(graphics = {Text(origin = {-1, -1}, extent = {{-69, 73}, {69, -73}}, textString = "01-10")}));
end CounterAct;