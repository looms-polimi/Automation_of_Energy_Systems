within AES.ControlBlocks.SignalRouting;

model switch_1in2out
  parameter Real unselected_output_value = 0;
  Modelica.Blocks.Interfaces.IntegerInput sel annotation(
    Placement(visible = true, transformation(origin = {10, 38}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 100}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput y1 annotation(
    Placement(visible = true, transformation(origin = {-178, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, 62}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y2 annotation(
    Placement(visible = true, transformation(origin = {-168, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(visible = true, transformation(origin = {-140, 6}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-122, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  if sel==1 then
     y1 = u;
     y2 = unselected_output_value;
  elseif sel==2 then
     y1 = unselected_output_value;
     y2 = u;
  else
     y1 = unselected_output_value;
     y2 = unselected_output_value;
  end if;
  annotation(
    Icon(graphics = {Line(origin = {-19, 20}, points = {{-61, -20}, {63, 24}}, thickness = 5), Ellipse(origin = {-80, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-20, 20}, {20, -20}}), Ellipse(origin = {-80, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-20, 20}, {20, -20}}), Ellipse(origin = {80, 62}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-20, 20}, {20, -20}}), Ellipse(origin = {80, -60}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-20, 20}, {20, -20}}), Text(origin = {80, 59}, textColor = {255, 170, 0}, extent = {{-20, 19}, {20, -19}}, textString = "1", textStyle = {TextStyle.Bold}), Text(origin = {80, -62}, textColor = {255, 170, 0}, extent = {{-20, 18}, {20, -18}}, textString = "2", textStyle = {TextStyle.Bold})}));
end switch_1in2out;