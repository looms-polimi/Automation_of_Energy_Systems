within AES.ProcessBlocks;

block NLchar
  Modelica.Blocks.Interfaces.RealOutput y = u "Write as f(block_name.u)" annotation(Dialog(group="Function of input"),
    Placement(visible = true, transformation(extent = {{100, -10}, {120, 10}}, rotation = 0), iconTransformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(visible = true, transformation(origin = {-122, -8}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  annotation(
    Icon(graphics = {Rectangle(fillColor = {211, 215, 207}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Rectangle(origin = {-1, 0}, extent = {{-81, 80}, {81, -80}}), Text(origin = {-2, 3}, extent = {{-62, 47}, {62, -47}}, textString = "f(u)")}));


end NLchar;