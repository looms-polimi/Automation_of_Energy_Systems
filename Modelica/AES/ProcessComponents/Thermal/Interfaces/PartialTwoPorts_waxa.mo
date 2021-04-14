within AES.ProcessComponents.Thermal.Interfaces;
partial model PartialTwoPorts_waxa "Partial two port waxa"
  SI.AbsolutePressure pa1 "Pressure";
  SI.AbsolutePressure pa2 "Pressure";
  SI.MassFlowRate wa1 "Dry air mass flowrate";
  SI.MassFlowRate wa2 "Dry air mass flowrate";
  SI.SpecificEnthalpy haout1 "Specifc enthalpy";
  SI.SpecificEnthalpy haout2 "Specifc enthalpy";
  SI.MassFraction xaout1 "Absolute humidity [Kg vap/Kg dry air]";
  SI.MassFraction xaout2 "Absolute humidity [Kg vap/Kg dry air]";
  MAport_waxa air_flange1 annotation(
  Placement(transformation(extent = {{-90, -10}, {-70, 10}}), iconTransformation(extent = {{-100, -20}, {-60, 20}})));
  MAport_waxa air_flange2 annotation(
  Placement(transformation(extent = {{70, -10}, {90, 10}}), iconTransformation(extent = {{60, -20}, {100, 20}})));
equation
  pa1 = air_flange1.pa;
  wa1 = air_flange1.wa;
  haout1 = air_flange1.ha;
  xaout1 = air_flange1.xa;
  pa2 = air_flange2.pa;
  wa2 = air_flange2.wa;
  haout2 = air_flange2.ha;
  xaout2 = air_flange2.xa;
  annotation(
  Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end PartialTwoPorts_waxa;