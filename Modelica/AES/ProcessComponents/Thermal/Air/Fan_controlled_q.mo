within AES.ProcessComponents.Thermal.Air;

model Fan_controlled_q "fan with ideal volume flowrate control"
  extends AES.ProcessComponents.Thermal.Interfaces.PartialTwoPorts_waxa;
  parameter SI.VolumeFlowRate qmax=0.3 "max vol flow rate";
  Media.Substances.MoistAir air;
  Modelica.Blocks.Interfaces.RealInput qcmd01 annotation(
  Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = -90, origin = {0, 72}), iconTransformation(extent = {{-11, -11}, {11, 11}}, rotation = -90, origin = {-1, 43})));
equation
  // mass balance
  wa1 + wa2 = 0;
  wa1 = qcmd01*qmax * air.d;
  // pressure drop
  air.p = 0.5 * (pa1 + pa2);
  // air humidity ratio boundary conditions
  xaout1 = inStream(air_flange2.xa);
  xaout2 = inStream(air_flange1.xa);
  air.X = xaout1;
  // enthalpies boundary conditions
  haout1 = inStream(air_flange2.ha);
  haout2 = inStream(air_flange1.ha);
  air.h = haout1;
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(lineColor = {52, 101, 164},fillColor = {114, 159, 207}, fillPattern = FillPattern.HorizontalCylinder, points = {{-60, 60}, {-60, -60}, {60, -20}, {60, 20}, {-60, 60}}), Rectangle(fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-72, 6}, {-60, -6}}), Rectangle(fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid, extent = {{60, 6}, {72, -6}}), Text(fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid, extent = {{24, 74}, {50, 44}}, textString = "q")}));
end Fan_controlled_q;