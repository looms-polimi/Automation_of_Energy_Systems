within AES.ProcessComponents.Thermal.Air;

model DPlin_NomPoint
  extends ProcessComponents.Thermal.Interfaces.PartialTwoPorts_waxa;
  parameter SI.Pressure dpnom = 1000 "Nominal pressure drop";
  parameter SI.VolumeFlowRate qnom = 0.3 "Nominal volume flowrate";
protected
  parameter Real G = qnom*Media.Constants.d_a_typ / dpnom "Equiv conductance, typ ro";
equation
  // No mass storage
  wa1 + wa2 = 0;
  // Linear pressure drop
  (pa1 - pa2) * G = wa1;
  // other equations
  haout1 = inStream(air_flange2.ha);
  haout2 = inStream(air_flange1.ha);
  xaout1 = inStream(air_flange2.xa);
  xaout2 = inStream(air_flange1.xa);
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(lineColor = {52, 101, 164}, fillColor = {114, 159, 207}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-60, 30}, {60, -30}}), Text(origin = {0, -60}, extent = {{-100, 20}, {100, -20}}, textString = "%name")}));
end DPlin_NomPoint;