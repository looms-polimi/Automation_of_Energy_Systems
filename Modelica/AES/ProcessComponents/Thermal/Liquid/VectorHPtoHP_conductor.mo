within AES.ProcessComponents.Thermal.Liquid;

model VectorHPtoHP_conductor
  parameter SI.ThermalConductance Gtotal=100 "total thermal conductance";
  parameter Integer n=5 "No. of vector side elements";
  AES.ProcessComponents.Thermal.Interfaces.vectorHeatPort vectorHP(n=n) annotation(
    Placement(visible = true, transformation(origin = {-6, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-8.58308e-6, 40}, extent = {{-60, -20}, {60, 20}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a HP annotation(
    Placement(visible = true, transformation(origin = {2, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {7.10543e-15, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  HP.Q_flow+sum(vectorHP.Q_flow) = 0;
  vectorHP.Q_flow=Gtotal/n*(vectorHP.T-HP.T*ones(n));
annotation(
    Icon(graphics = {Polygon(origin = {40, -18}, lineColor = {164, 0, 0}, fillColor = {245, 121, 0}, fillPattern = FillPattern.VerticalCylinder, points = {{-100, 38}, {20, 38}, {-20, -2}, {-60, -2}, {-100, 38}})}));
end VectorHPtoHP_conductor;