within AES.ProcessComponents.Thermal.HVAC;
model HP_ConstCOPc
  extends Thermal.Interfaces.PartialHeatPump;
  parameter SI.HeatFlowRate Wmax = 100 "W at cmd01=1";
  parameter Real COPcool0 = 1 "constant cooling COP";
equation
  W = Wmax * cmd01;
  COPcool = COPcool0;
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
end HP_ConstCOPc;