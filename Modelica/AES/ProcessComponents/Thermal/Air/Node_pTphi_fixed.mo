within AES.ProcessComponents.Thermal.Air;

model Node_pTphi_fixed
  extends ProcessComponents.Thermal.Interfaces.PartialOnePort_waxa;
  Media.Substances.MoistAir air;
  parameter SI.Pressure p0 = 101325 "prescribed pressure";
  parameter SI.Temperature T0 = 273.15 + 20 "prescribed temperature";
  parameter Real phi0 = 0.5 "prescribed relative humidity [0,1]";
equation
  pa1 = p0;
  air.p = pa1;
  air.T = T0;
  air.phi = phi0;
  // enthalpy boundary condition
  air.h = haout1;
  air.X = xaout1;
  annotation(
  Icon(graphics = {Ellipse(lineColor = {52, 101, 164}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{-100, 100}, {100, -100}}, endAngle = 360), Text(origin = {-1, 2}, extent = {{63, -42}, {-63, 42}}, textString = "pTphi"), Text(origin = {0, -120}, extent = {{-100, 20}, {100, -20}}, textString = "%name")}));
end Node_pTphi_fixed;