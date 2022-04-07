within AES.ProcessComponents.Thermal.HVAC;
model HP_DTdependentCOPh
  extends Thermal.Interfaces.PartialHeatPump;
  parameter SI.TemperatureDifference DTmin = 5 "min DT";
  parameter SI.TemperatureDifference DTmax = 20 "max DT";
  parameter Real maxCOPheat = 6 "maximum heating COP (at DTmin)";
  parameter Real minCOPheat = 1.5 "minimum heating COP (at DTmax)";
  SI.TemperatureDifference DT;
equation
  DT      = Th-Tc;
  COPheat = if DT<=DTmin
            then maxCOPheat
            elseif Th-Tc<=DTmax
            then maxCOPheat-(DT-DTmin)*(maxCOPheat-minCOPheat)/(DTmax-DTmin)
            else minCOPheat;
  annotation(
  Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
end HP_DTdependentCOPh;