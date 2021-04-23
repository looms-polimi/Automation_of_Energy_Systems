within AES.ProcessComponents.Thermal.HVAC;

model HP_CarnotFractionCOPc
  extends Thermal.Interfaces.PartialHeatPump;
  parameter Real eta = 0.5 "fraction of Carnot COP";
  parameter Real maxCOPcool = 1 "maximum cooling COP";
  Real CarnotCOPc;
equation
  CarnotCOPc = Tc / (Th - Tc);
  COPcool = min(maxCOPcool, eta*CarnotCOPc);
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
end HP_CarnotFractionCOPc;