within AES.ProcessComponents.Thermal.Interfaces;
partial model PartialOnePort_waxa "Partial two port waxa"
  SI.AbsolutePressure pa1 "Pressure";
  SI.MassFlowRate wa1 "Dry air mass flowrate";
  SI.SpecificEnthalpy haout1 "Specifc enthalpy";
  SI.MassFraction xaout1 "Absolute humidity [Kg vap/Kg dry air]";
  AES.ProcessComponents.Thermal.Interfaces.MAport_waxa air_flange1 annotation(
  Placement(visible = true,transformation(extent = {{-90, -10}, {-70, 10}}, rotation = 0), iconTransformation(extent = {{100, -20}, {140, 20}}, rotation = 0)));
equation
  pa1 = air_flange1.pa;
  wa1 = air_flange1.wa;
  haout1 = air_flange1.ha;
  xaout1 = air_flange1.xa;
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end PartialOnePort_waxa;