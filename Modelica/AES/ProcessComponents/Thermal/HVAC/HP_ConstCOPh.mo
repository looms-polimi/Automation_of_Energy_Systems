within AES.ProcessComponents.Thermal.HVAC;
model HP_ConstCOPh
  extends Thermal.Interfaces.PartialHeatPump;
  parameter SI.HeatFlowRate Wmax = 100 "W at cmd01=1";
  parameter Real COPheat0 = 3 "conatant heating COP";
equation
  W = Wmax * cmd01;
  COPheat = COPheat0;
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
end HP_ConstCOPh;