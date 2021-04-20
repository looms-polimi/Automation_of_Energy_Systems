within AES.ProcessComponents.Thermal.HVAC;

model HP_CarnotFractionCOPc
  extends Thermal.Interfaces.PartialHeatPump;
  parameter SI.HeatFlowRate Wmax = 100 "W at cmd01=1";
  parameter Real eta = 0.5 "fraction of Carnot COP";
  parameter Real maxCOPcool = 1 "maximum cooling COP";
  SI.Temperature DTmin;
equation
  eta * Tc = maxCOPcool * DTmin;
  W = Wmax * cmd01;
  if Th - Tc > DTmin then
    COPcool = eta * Tc / (Th - Tc);
  else
    COPcool = maxCOPcool;
  end if;
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
end HP_CarnotFractionCOPc;