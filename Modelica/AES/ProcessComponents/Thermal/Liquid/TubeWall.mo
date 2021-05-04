within AES.ProcessComponents.Thermal.Liquid;

model TubeWall
  parameter SI.Length L=10 "length";
  parameter SI.Length Di=0.05 "inner diameter";
  parameter SI.Length t=0.002 "thickness";
  parameter SI.Density ro=7600 "density";
  parameter SI.SpecificHeatCapacity c=600 "specific heat";
  parameter SI.ThermalConductivity lambda=40 "thermal conductivity";
  parameter Integer n=5 "No. of lumps (axial)";
  parameter Integer l=3 "No. of layers (radial)";
  parameter SI.Temperature Tstart=293.15 "initial T, all elements";
  AES.ProcessComponents.Thermal.Interfaces.vectorHeatPort innerSurf(n=n) annotation(
    Placement(visible = true, transformation(origin = {0, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {2, -2}, extent = {{-42, -14}, {42, 14}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Interfaces.vectorHeatPort outerSurf(n=n) annotation(
    Placement(visible = true, transformation(origin = {0, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {2, 54}, extent = {{-42, -14}, {42, 14}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.LumpedPlanarWall wall(L = L, Tstart = Tstart, W = Modelica.Constants.pi * Di, c = c, l = l, lambda = lambda, n = n, ro = ro, t = t)  annotation(
    Placement(visible = true, transformation(origin = {0, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation

  connect(outerSurf, wall.surfA) annotation(
    Line(points = {{0, 50}, {0, 0}}, color = {144, 5, 5}));
  connect(wall.surfB, innerSurf) annotation(
    Line(points = {{0, -4}, {0, -50}}, color = {144, 5, 5}));

annotation(
    Icon(graphics = {Rectangle(origin = {0, -3}, lineColor = {85, 87, 83}, fillColor = {238, 238, 236}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, 37}, {100, -37}}), Rectangle(origin = {0, 26}, lineColor = {92, 53, 102}, fillColor = {238, 238, 236}, fillPattern = FillPattern.Backward, lineThickness = 0.5, extent = {{-100, 14}, {100, -14}})}),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
  Diagram());
end TubeWall;