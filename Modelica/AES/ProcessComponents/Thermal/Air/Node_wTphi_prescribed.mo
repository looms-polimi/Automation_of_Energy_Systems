within AES.ProcessComponents.Thermal.Air;
model Node_wTphi_prescribed
  extends ProcessComponents.Thermal.Interfaces.PartialOnePort_waxa;
  Media.Substances.MoistAir air;
  Modelica.Blocks.Interfaces.RealInput q annotation(
    Placement(visible = true, transformation(origin = {-118, 68}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput T annotation(
    Placement(visible = true, transformation(origin = {-138, -8}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput phi annotation(
    Placement(visible = true, transformation(origin = {-134, -72}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-96, -64}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  wa1 = -q*Media.Constants.d_a_typ;
  air.p = pa1;
  air.T = T;
  air.phi = phi;
  // enthalpy boundary condition
  air.h = haout1;
  air.X = xaout1;
  annotation(
  Icon(graphics = {Ellipse(lineColor = {52, 101, 164}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{-100, 100}, {100, -100}}, endAngle = 360), Text(extent = {{80, -80}, {-80, 80}}, textString = "wTphi")}));
end Node_wTphi_prescribed;