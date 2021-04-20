within AES.ProcessComponents.Thermal.HVAC;
model HP_CarnotFractionCOPh
  extends Thermal.Interfaces.PartialHeatPump;
  parameter SI.HeatFlowRate Wmax = 100 "W at cmd01=1";
  parameter Real eta = 0.45 "fraction of Carnot COP";
  parameter Real maxCOPheat = 6 "maximum heating COP";
  Real foo;
equation
  foo = eta * Th / (Th - Tc);
  W = Wmax * cmd01;
  COPheat = min(maxCOPheat, eta * Th / (Th - Tc));
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
end HP_CarnotFractionCOPh;