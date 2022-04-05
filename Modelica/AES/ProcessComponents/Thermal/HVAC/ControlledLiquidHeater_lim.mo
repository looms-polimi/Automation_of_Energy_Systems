within AES.ProcessComponents.Thermal.HVAC;

model ControlledLiquidHeater_lim
  extends Interfaces.flowTwoPorts_pwh(final pbhi=true);
  parameter SI.Power Pmax=2e4 "max power";
  parameter SI.Volume V=0.25 "volume";
  parameter SI.Time Tcl = 30 "CL temp ctrl TC";
  parameter SI.Temperature Tstart = 273.15 + 25 "initial fluid temp";
  SI.Temperature Tfi "inlet fluid temp";
  SI.Temperature Tfo(start = Tstart) "outlet fluid temp";
  Modelica.Blocks.Interfaces.BooleanInput ON annotation(
    Placement(visible = true, transformation(extent = {{-102, 54}, {-62, 94}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput To annotation(
    Placement(visible = true,transformation(extent = {{-92, 20}, {-52, 60}}, rotation = 0), iconTransformation(origin = {-121, 61}, extent = {{-21, -21}, {21, 21}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Pc annotation(
    Placement(visible = true,transformation(extent = {{60, 50}, {100, 90}}, rotation = 0), iconTransformation(origin = {20, -120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput Ec annotation(
    Placement(visible = true,transformation(extent = {{60, 10}, {100, 50}}, rotation = 0), iconTransformation(origin = {60, -120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput oTi "inlet T meas" annotation(
    Placement(visible = true,transformation(extent = {{60, 50}, {100, 90}}, rotation = 0), iconTransformation( origin = {-60, -120},extent = {{-20, -20}, {20, 20}}, rotation = 270)));
  Modelica.Blocks.Interfaces.RealOutput oTo "outlet T meas" annotation(
    Placement(visible = true,transformation(extent = {{60, 50}, {100, 90}}, rotation = 0), iconTransformation( origin = {-20, -120},extent = {{-20, -20}, {20, 20}}, rotation = 270)));
protected
  final parameter Real K=ro*V*cp/Tcl annotation(Evaluate = true);
  Real Ti,xpi(start=0);
equation
// no pressure drop
  dp = 0;
// enthalpy boundary conditions
  hao              = cp*Tfo;
  hbo              = cp*Tfo;
  cp*Tfi           = hai;
  ro*V*cp*der(Tfo) = Pc+w*cp*(Tfi-Tfo); /* energy balance */
  Ti               = if w>0 then ro*V/w else Tcl;
  if ON then
    xpi+Ti*der(xpi) = Pc;
    Pc              = max(0,min(Pmax,xpi+K*(To-Tfo)));
  else
    der(xpi)        = 0;
    Pc              = 0;
  end if;
// Power consumption
  Pc = der(Ec);
// Temp meas
  oTi = Tfi;
  oTo = Tfo;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(lineColor = {85, 87, 83}, fillColor = {186, 189, 182}, fillPattern = FillPattern.VerticalCylinder, extent = {{-100, 100}, {100, -100}}), Text(origin = {-13.17, -30.15}, lineColor = {252, 233, 79}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{-58.83, 82.15}, {75.17, -23.85}}, textString = "LHlim")}),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end ControlledLiquidHeater_lim;