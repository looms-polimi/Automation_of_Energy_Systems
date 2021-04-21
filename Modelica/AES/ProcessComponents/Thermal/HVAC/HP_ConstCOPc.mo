within AES.ProcessComponents.Thermal.HVAC;
model HP_ConstCOPc
  extends Thermal.Interfaces.PartialHeatPump;
  parameter Real COPcool0 = 1 "constant cooling COP";
equation
  COPcool = COPcool0;
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
end HP_ConstCOPc;