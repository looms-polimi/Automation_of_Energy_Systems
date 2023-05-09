within AES.ProcessComponents.Thermal.Liquid;

model ExpansionVessel_isoT
  outer System_settings.System_liquid system;
  parameter SI.Pressure p0=1e5 "nominal p";
  parameter SI.Volume V=5 "vessel volume";
  parameter SI.Temperature T0=293.15 "operating temperature";
  parameter SI.MolarMass MM=0.029 "gas molar mass";
  parameter Real lfracstart=0.5 "initial fractional (0-1) level";
  Real lfrac(start=lfracstart);
  SI.Pressure p;
  SI.Volume Vg;
  AES.ProcessComponents.Thermal.Interfaces.pwhPort pwh_a annotation(
    Placement(visible = true, transformation(origin = {0, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Interfaces.pwhPort pwh_b annotation(
    Placement(visible = true, transformation(origin = {10, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));

//protected
  final parameter SI.Mass Mgas =  p0*V*(1-lfracstart)*MM
                                 /(Modelica.Constants.R*T0);
equation
  system.ro*V*der(lfrac) = pwh_a.w+pwh_b.w;
  Vg                     = V*(1-lfrac);
  Mgas                   = MM*p*Vg/Modelica.Constants.R*T0;
  
  pwh_a.p = p;
  pwh_b.p = p;
  pwh_a.h = inStream(pwh_b.h);
  pwh_b.h = inStream(pwh_a.h);
initial equation
  p0*V*(1-lfracstart) = Mgas/MM*Modelica.Constants.R*T0;
annotation(
    Icon(graphics = {Rectangle(origin = {0, -60}, lineColor = {46, 52, 54}, fillColor = {211, 215, 207}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, 20}, {100, -20}}), Polygon(origin = {2, -31}, lineColor = {46, 52, 54}, fillColor = {211, 215, 207}, fillPattern = FillPattern.VerticalCylinder, points = {{-20, 51}, {20, 51}, {20, -9}, {0, -29}, {-20, -9}, {-20, 51}}), Rectangle(origin = {1.06581e-13, 30}, rotation = -90, lineColor = {46, 52, 54}, fillColor = {211, 215, 207}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-50, 60}, {50, -60}}), Rectangle(origin = {-3.55271e-14, 52}, lineColor = {52, 101, 164}, fillColor = {255, 255, 255}, fillPattern = FillPattern.VerticalCylinder, extent = {{-60, 28}, {60, -28}})}),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end ExpansionVessel_isoT;