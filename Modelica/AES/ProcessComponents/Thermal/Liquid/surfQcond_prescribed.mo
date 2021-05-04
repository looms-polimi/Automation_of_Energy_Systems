within AES.ProcessComponents.Thermal.Liquid;

model surfQcond_prescribed
  parameter Integer n=5;
  ProcessComponents.Thermal.Interfaces.vectorHeatPort surf(n=n) annotation(
    Placement(visible = true, transformation(origin = {-4, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -86.6667}, extent = {{-40, -13.3333}, {40, 13.3333}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Q annotation(
    Placement(visible = true, transformation(origin = {-86, 24}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  surf.Q_flow = -Q/n*ones(n);
annotation(
    Icon(graphics = {Polygon(origin = {0, -46}, lineColor = {204, 0, 0}, fillColor = {245, 121, 0}, fillPattern = FillPattern.Solid, points = {{-40, 26}, {-40, 6}, {-80, 6}, {0, -26}, {80, 6}, {40, 4}, {40, 26}, {-40, 26}}), Ellipse(origin = {0, 35}, lineColor = {32, 74, 135}, fillColor = {32, 74, 135}, fillPattern = FillPattern.Solid, extent = {{-45, 45}, {45, -45}}, endAngle = 360), Ellipse(origin = {0, 35}, lineColor = {32, 74, 135}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-25, 25}, {25, -25}}, endAngle = 360), Polygon(origin = {30, 10}, lineColor = {32, 74, 135}, fillColor = {32, 74, 135}, fillPattern = FillPattern.Solid, points = {{-24, 10}, {-12, 20}, {22, -10}, {8, -24}, {-24, 10}})}));
end surfQcond_prescribed;