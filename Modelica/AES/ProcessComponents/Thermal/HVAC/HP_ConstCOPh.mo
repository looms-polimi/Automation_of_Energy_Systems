within AES.ProcessComponents.Thermal.HVAC;
model HP_ConstCOPh
  extends Thermal.Interfaces.PartialHeatPump;
  parameter Real COPheat0 = 3 "constant heating COP";
equation
  COPheat = COPheat0;
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
end HP_ConstCOPh;