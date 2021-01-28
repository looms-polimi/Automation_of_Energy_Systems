within AES.ProcessComponents.Thermal.Piping_liquid;

model VectorHPtoHP_conductor
  parameter SI.ThermalConductance Gtotal=100 "total thermal conductance";
  parameter Integer n=5 "No. of vector side elements";
  AES.ProcessComponents.Thermal.Interfaces.vectorHeatPort vectorHP(n=n) annotation(
    Placement(visible = true, transformation(origin = {-6, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {3.07532e-14, 66.6667}, extent = {{-100, -33.3333}, {100, 33.3333}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a HP annotation(
    Placement(visible = true, transformation(origin = {2, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -70}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
equation
  HP.Q_flow+sum(vectorHP.Q_flow) = 0;
  vectorHP.Q_flow=Gtotal/n*(vectorHP.T-HP.T*ones(n));
annotation(
    Icon(graphics = {Polygon(origin = {0, -4}, lineColor = {164, 0, 0}, fillColor = {245, 121, 0}, fillPattern = FillPattern.VerticalCylinder, points = {{-100, 38}, {100, 38}, {30, -36}, {-30, -36}, {-100, 38}})}));
end VectorHPtoHP_conductor;