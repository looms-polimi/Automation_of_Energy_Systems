within AES.ControlBlocks.SignalRouting;

model sum_opposite
  Modelica.Blocks.Interfaces.RealInput u1 annotation(
    Placement(visible = true, transformation(origin = {-188, -8}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {0, 40}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput u2 annotation(
    Placement(visible = true, transformation(origin = {-196, -84}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {0, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(visible = true, transformation(origin = {-140, 6}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {40, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  y = u1+u2;
annotation(
    Icon(graphics = {Ellipse(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-20, 20}, {20, -20}}), Text(origin = {-31, 30}, extent = {{-29, 30}, {29, -30}}, textString = "+"), Text(origin = {-31, 30}, extent = {{-29, 30}, {29, -30}}, textString = "+"), Text(origin = {-31, -30}, extent = {{-29, 30}, {29, -30}}, textString = "+")}));
end sum_opposite;