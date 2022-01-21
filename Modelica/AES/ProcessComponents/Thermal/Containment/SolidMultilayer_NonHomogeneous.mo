within AES.ProcessComponents.Thermal.Containment;
model SolidMultilayer_NonHomogeneous
  parameter SI.Area A = 10 "wall surface";
  parameter SI.Length s[:] = {0.1,0.2,0.1} "layer thicknesses";
  parameter SI.Density ro[:] = {2400,20,2000} "layer densities";
  parameter SI.SpecificHeatCapacity cw[:] = {880,400,800} "layer spec heast";
  parameter SI.ThermalConductivity lambda[:] = {2,0.1,1.5} "layer thermal conds";
  parameter SI.Temperature Tstart = 273.15 + 20 "initial T, all layers";
  SI.Temperature T[n](each start = Tstart);
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a side_a annotation(
  Placement(visible = true, transformation(extent = {{-60, -80}, {-40, 80}}, rotation = 0), iconTransformation(origin = {-70, 0}, extent = {{-10, -80}, {10, 80}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b side_b annotation(
  Placement(visible = true, transformation(extent = {{40, -80}, {60, 80}}, rotation = 0), iconTransformation(extent = {{60, -80}, {80, 80}}, rotation = 0)));
protected
  final parameter Integer n = size(s,1);
  final parameter SI.HeatCapacity c[n]
        = A/n*(ro.*s.*cw);
  final parameter SI.ThermalConductance g[n+1]
        = A*Functions.layer_fcf_conductivities(s, lambda)
          ./Functions.layer_fcf_distances(s);
equation
  c[1] * der(T[1]) = side_a.Q_flow - g[2] * (T[1] - T[2]);
  side_a.T = T[1]+side_a.Q_flow/g[1];
  for i in 2:n - 1 loop
    c[i] * der(T[i]) = g[i] * (T[i - 1] - T[i]) - g[i+1] * (T[i] - T[i + 1]);
  end for;
  c[n] * der(T[n]) = g[n] * (T[n - 1] - T[n]) + side_b.Q_flow;
  side_b.T = T[n]+side_b.Q_flow/g[n+1];
  annotation(
  Icon(graphics={Rectangle(origin = {96, 0},fillColor = {238, 238, 236}, fillPattern = FillPattern.Backward, extent = {{-136, 100}, {-68, -100}}), Rectangle(origin = {52, 0}, fillColor = {252, 233, 79}, fillPattern = FillPattern.Solid, extent = {{-24, 100}, {-12, -100}}), Rectangle(origin = {-20, 0}, fillColor = {233, 185, 110}, fillPattern = FillPattern.Solid, extent = {{-40, 100}, {-20, -100}}), Rectangle(origin = {80, 0}, fillColor = {78, 154, 6}, fillPattern = FillPattern.Solid, extent = {{-40, 100}, {-20, -100}})}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end SolidMultilayer_NonHomogeneous;