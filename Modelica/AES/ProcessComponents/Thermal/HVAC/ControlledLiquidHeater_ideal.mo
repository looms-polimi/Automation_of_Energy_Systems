within AES.ProcessComponents.Thermal.HVAC;

model ControlledLiquidHeater_ideal
  extends Interfaces.flowTwoPorts_pwh(final pbhi=true);
  parameter SI.Time Tcl = 5 "CL temp ctrl TC";
  parameter SI.Time Thc = 20 "intrinsic cooling TC";
  parameter SI.Temperature Tstart = 273.15 + 25 "initial fluid temp";
  SI.Temperature Tfi "inlet fluid temp";
  SI.Temperature Tfo(start = Tstart) "outlet fluid temp";
  Modelica.Blocks.Interfaces.BooleanInput ON annotation(
    Placement(visible = true, transformation(extent = {{-102, 54}, {-62, 94}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput To "outlet T set point" annotation(
    Placement(visible = true,transformation(extent = {{-92, 20}, {-52, 60}}, rotation = 0), iconTransformation(origin = {-121, 61}, extent = {{-21, -21}, {21, 21}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Pc annotation(
    Placement(visible = true,transformation(extent = {{60, 50}, {100, 90}}, rotation = 0), iconTransformation(origin = {20, -120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput Ec annotation(
    Placement(visible = true,transformation(extent = {{60, 10}, {100, 50}}, rotation = 0), iconTransformation(origin = {60, -120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput oTi "inlet T meas" annotation(
    Placement(visible = true,transformation(extent = {{60, 50}, {100, 90}}, rotation = 0), iconTransformation( origin = {-60, -120},extent = {{-20, -20}, {20, 20}}, rotation = 270)));
  Modelica.Blocks.Interfaces.RealOutput oTo "outlet T meas" annotation(
    Placement(visible = true,transformation(extent = {{60, 50}, {100, 90}}, rotation = 0), iconTransformation( origin = {-20, -120},extent = {{-20, -20}, {20, 20}}, rotation = 270)));
equation
// no pressure drop
  dp = 0;
// enthalpy boundary conditions
  hao = cp*Tfo;
  hbo = cp*Tfo;
// definition of the input and output temperatures
  cp*Tfi = hai;
  if ON then
    Tfo + Tcl * der(Tfo) = To;
  else
    Tfo + Thc * der(Tfo) = Tfi;
  end if;
// Power consumption
  Pc = noEvent(max(cp*w*(Tfo-Tfi), 0.0));
  Pc = der(Ec);
// Temp meas
  oTi = Tfi;
  oTo = Tfo;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(lineColor = {85, 87, 83}, fillColor = {186, 189, 182}, fillPattern = FillPattern.VerticalCylinder, extent = {{-100, 100}, {100, -100}}), Text(origin = {-13.17, -30.15}, lineColor = {252, 233, 79}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{-58.83, 82.15}, {75.17, -23.85}}, textString = "LHid")}),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end ControlledLiquidHeater_ideal;