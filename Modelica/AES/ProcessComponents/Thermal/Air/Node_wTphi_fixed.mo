within AES.ProcessComponents.Thermal.Air;
model Node_wTphi_fixed
  extends ProcessComponents.Thermal.Interfaces.PartialOnePort_waxa;
  Media.Substances.MoistAir air;
  parameter SI.VolumeFlowRate q0 = 100 "Dry air volume flow rate";
  parameter SI.Temperature T0 = 273.15 + 20 "prescribed temperature";
  parameter Real phi0 = 0.5 "prescribed relative humidity [0,1]";
equation
  wa1 = -q0*Media.Constants.d_a_typ;
  air.p = pa1;
  air.T = T0;
  air.phi = phi0;
  // enthalpy boundary condition
  air.h = haout1;
  air.X = xaout1;
  annotation(
  Icon(graphics = {Ellipse(lineColor = {52, 101, 164}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{-100, 100}, {100, -100}}, endAngle = 360), Text(extent = {{80, -80}, {-80, 80}}, textString = "wTphi")}));
end Node_wTphi_fixed;