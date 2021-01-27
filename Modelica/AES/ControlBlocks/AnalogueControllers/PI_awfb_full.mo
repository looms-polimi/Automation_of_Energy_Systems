within AES.ControlBlocks.AnalogueControllers;

model PI_awfb_full
  extends Icons.AnalogueController200x400;
  parameter Real K = 1;
  parameter Real Ti = 1;
  parameter Real CSmin = -1;
  parameter Real CSmax = 1;
  parameter Real CSstart = 0;
  parameter Boolean hasBias = false;
  parameter Boolean hasTracking = false;
  parameter Boolean hasLocks = false;
  parameter Boolean hasOvrMax = false;
  parameter Boolean hasOvrMin = false;
  Modelica.Blocks.Interfaces.RealInput SP annotation(
    Placement(visible = true, transformation(origin = {-180, 10}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-102, 140}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput PV annotation(
    Placement(visible = true, transformation(origin = {-180, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-102, 100}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Bias if hasBias annotation(
    Placement(visible = true, transformation(origin = {-180, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {0, 202}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput CS annotation(
    Placement(visible = true, transformation(origin = {180, 8}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {100, 140}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput TR if hasTracking annotation(
    Placement(visible = true, transformation(origin = {-80, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-102, 22}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.BooleanInput TS if hasTracking annotation(
    Placement(visible = true, transformation(origin = {-36, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-102, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.BooleanInput noInc if hasLocks annotation(
    Placement(visible = true, transformation(origin = {-160, -50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-102, -18}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.BooleanInput noDec if hasLocks annotation(
    Placement(visible = true, transformation(origin = {-124, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-102, -56}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput ovrMax if hasOvrMax annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-102, -96}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput ovrMin if hasOvrMin annotation(
    Placement(visible = true, transformation(origin = {-60, 100}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-102, -136}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.BooleanOutput HIsat annotation(
    Placement(visible = true, transformation(origin = {146, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 100}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.BooleanOutput LOsat annotation(
    Placement(visible = true, transformation(origin = {156, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
//protected
  Modelica.Blocks.Interfaces.RealInput iBias;
  Modelica.Blocks.Interfaces.BooleanInput iTS;
  Modelica.Blocks.Interfaces.RealInput iTR;
  Modelica.Blocks.Interfaces.BooleanInput iNoInc;
  Modelica.Blocks.Interfaces.BooleanInput iNoDec;
  Modelica.Blocks.Interfaces.RealInput iOvrMax;
  Modelica.Blocks.Interfaces.RealInput iOvrMin;
  Real umax, umin, xfb, xBias, fBias, ulin, du, u, csfil;
equation
  connect(iBias, Bias);
  connect(iTS, TS);
  connect(iTR, TR);
  connect(iNoInc, noInc);
  connect(iNoDec, noDec);
  connect(iOvrMax, ovrMax);
  connect(iOvrMin, ovrMin);
  if not hasBias then
    iBias = 0;
  end if;
  if not hasTracking then
    iTS = false;
    iTR = 0;
  end if;
  if not hasLocks then
    iNoInc = false;
    iNoDec = false;
  end if;
  if not hasOvrMax then
    iOvrMax = 0;
    umin = CSmin;
  else
    umin = max(CSmin, ovrMax);
  end if;
  if not hasOvrMin then
    iOvrMin = 0;
    umax = CSmax;
  else
    umax = min(CSmax, ovrMin);
  end if;
  xfb + Ti * der(xfb) = CS;
  xBias + Ti * der(xBias) = iBias;
  fBias = iBias - xBias;
  ulin = if not iTS then K * (SP - PV) + xfb + fBias else iTR;
  du = (ulin - u) / (0.01 * Ti);
  der(u) = if du > 0 and iNoInc or du < 0 and iNoDec then 0 else du;
  CS = max(umin, min(umax, u));
  csfil + Ti / 1e3 * der(csfil) = CS;
  HIsat = (csfil >= CSmax-1e-9);
  LOsat = (csfil <= CSmin+1e-9);
initial equation
  u = CSstart;
  ulin = u;
  csfil = u;
  xBias = 0;
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    Icon(coordinateSystem(initialScale = 0.1), graphics = {Text(origin = {-24, 125}, extent = {{-34, 27}, {80, -55}}, textString = "PI"), Text(origin = {50, -170}, extent = {{-42, 30}, {42, -30}}, textString = "%name", horizontalAlignment = TextAlignment.Right)}),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002));
end PI_awfb_full;