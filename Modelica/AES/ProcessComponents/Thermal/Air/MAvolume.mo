within AES.ProcessComponents.Thermal.Air;

model MAvolume
  extends ProcessComponents.Thermal.Interfaces.PartialTwoPorts_waxa;
  AES.Media.Substances.MoistAir air;
  parameter SI.Volume V = 10 "volume";
  parameter SI.Pressure pstart = 101325 "Initial moist air pressure";
  parameter SI.Temperature Tstart = 273.15 + 20 "Initial moist air temperature";
  parameter Real phistart = 0.5 "Initial relative umidity [0,1]";
  SI.Mass Ma "Total dry air mass";
  SI.Mass Mv "Total vapour mass";
  SI.Energy Ea "Energy of the moist air";
  SI.Pressure p "Pressure of the air";
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort annotation(
  Placement(transformation(extent = {{-60, 40}, {60, 60}}), iconTransformation(extent = {{-80, 80}, {80, 100}})));
initial equation
  air.T = Tstart;
  air.phi = phistart;
  air.p = pstart;
equation
  // No pressure drop
  pa1 = air.p;
  pa2 = air.p;
  air.p = p;
  // Masses and energy
  Ma + Mv = V * air.d;
  Mv = Ma * air.X;
  Ea = Ma * (air.h - air.p / air.d);
  // Balances
  der(Ma) = wa1 + wa2;
  der(Mv) = wa1 * actualStream(air_flange1.xa) + wa2 * actualStream(air_flange2.xa);
  der(Ea) = wa1 * actualStream(air_flange1.ha) + wa2 * actualStream(air_flange2.ha)
            + heatPort.Q_flow;
  // Connector equations
  air.T = heatPort.T;
  xaout1 = air.X;
  xaout2 = air.X;
  haout1 = air.h;
  haout2 = air.h;
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-80, 80}, {80, -80}}, lineColor = {0, 100, 255}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Sphere), Text(extent = {{-54, 52}, {50, -46}}, lineColor = {0, 0, 0}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid, textString = "AirVolume")}),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002));
end MAvolume;