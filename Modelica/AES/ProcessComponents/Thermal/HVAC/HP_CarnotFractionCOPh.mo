within AES.ProcessComponents.Thermal.HVAC;
model HP_CarnotFractionCOPh
  extends Thermal.Interfaces.PartialHeatPump;
  parameter Real eta = 0.45 "fraction of Carnot COP";
  parameter Real maxCOPheat = 6 "maximum heating COP";
  Real CarnotCOPh;
equation
  CarnotCOPh = Th / (Th - Tc);
  COPheat    = min(maxCOPheat, eta*CarnotCOPh);
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
end HP_CarnotFractionCOPh;