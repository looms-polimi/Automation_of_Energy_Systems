within AES.ProcessComponents.Thermal.Containment;
model SolidMultilayer_Homogeneous
  parameter SI.Area A = 10 "wall surface";
  parameter SI.Length s = 0.4 "wall thickness";
  parameter SI.Density ro = 2400 "wall density";
  parameter SI.SpecificHeatCapacity cw = 880 "wall spec heat";
  parameter SI.ThermalConductivity lambda = 1.91 "wall thermal cond";
  parameter Integer n = 4 "number of layers";
  parameter SI.Temperature Tstart = 273.15 + 20 "initial T, all layers";
  SI.Temperature T[n](each start = Tstart);
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a side_a annotation(
  Placement(visible = true, transformation(extent = {{-60, -80}, {-40, 80}}, rotation = 0), iconTransformation(origin = {-70, 0}, extent = {{-10, -80}, {10, 80}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b side_b annotation(
  Placement(visible = true, transformation(extent = {{40, -80}, {60, 80}}, rotation = 0), iconTransformation(extent = {{60, -80}, {80, 80}}, rotation = 0)));
protected
  final parameter SI.ThermalConductance g = lambda * A / (s / n);
  final parameter SI.HeatCapacity c = ro * A * s / n * cw;
equation
  c * der(T[1]) = side_a.Q_flow - g * (T[1] - T[2]);
  side_a.T = T[1]+side_a.Q_flow/(2*g);
  for i in 2:n - 1 loop
    c * der(T[i]) = g * (T[i - 1] - T[i]) - g * (T[i] - T[i + 1]);
  end for;
  c * der(T[n]) = g * (T[n - 1] - T[n]) + side_b.Q_flow;
  side_b.T = T[n]+side_b.Q_flow/(2*g)
  annotation( 
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
annotation(
    Icon(graphics = {Rectangle(origin = {-40, 0}, fillColor = {233, 185, 110}, fillPattern = FillPattern.Solid, extent = {{-20, 100}, {20, -100}}), Rectangle( fillColor = {233, 185, 110}, fillPattern = FillPattern.Solid, extent = {{-20, 100}, {20, -100}}), Rectangle(origin = {40, 0}, fillColor = {233, 185, 110}, fillPattern = FillPattern.Solid, extent = {{-20, 100}, {20, -100}})}));
end SolidMultilayer_Homogeneous;