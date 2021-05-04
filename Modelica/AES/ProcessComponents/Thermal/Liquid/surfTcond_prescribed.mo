within AES.ProcessComponents.Thermal.Liquid;

model surfTcond_prescribed
  parameter Integer n=5;
  ProcessComponents.Thermal.Interfaces.vectorHeatPort surf(n=n) annotation(
    Placement(visible = true, transformation(origin = {-4, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -86.6667}, extent = {{-40, -13.3333}, {40, 13.3333}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput T annotation(
    Placement(visible = true, transformation(origin = {-74, 46}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  surf.T = T*ones(n);
annotation(
    Icon(graphics = {Polygon(origin = {0, -46}, lineColor = {204, 0, 0}, fillColor = {245, 121, 0}, fillPattern = FillPattern.Solid, points = {{-40, 26}, {-40, 6}, {-80, 6}, {0, -26}, {80, 6}, {40, 4}, {40, 26}, {-40, 26}}), Polygon(origin = {0, 40}, lineColor = {32, 74, 135}, fillColor = {32, 74, 135}, fillPattern = FillPattern.Solid, points = {{-40, 40}, {-40, 20}, {-10, 20}, {-10, -40}, {12, -40}, {12, 20}, {40, 20}, {40, 40}, {-40, 40}})}));
end surfTcond_prescribed;