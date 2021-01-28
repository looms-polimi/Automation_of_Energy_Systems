within AES.ProcessComponents.Thermal.Interfaces;

partial model flowOnePort_pwh
  outer System_settings.System_liquid system;
  AES.ProcessComponents.Thermal.Interfaces.pwhPort pwh_a annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, 1.11022e-16}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
protected
  parameter SI.Density ro=system.ro;
  parameter SI.SpecificHeatCapacity cp=system.cp;
  parameter SI.ThermalConductivity lambda=system.lambda;
  parameter SI.DynamicViscosity mu=system.mu;
end flowOnePort_pwh;