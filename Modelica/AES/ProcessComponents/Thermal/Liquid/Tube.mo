within AES.ProcessComponents.Thermal.Liquid;

model Tube
  parameter SI.Length L=10 "length";
  parameter SI.Length Di=0.05 "inner diameter";
  parameter SI.Length t=0.002 "wall thickness";
  parameter SI.Length dz=0 "height of port b (out) over port a (in)";
  parameter SI.MassFlowRate wnom=0.5 "nominal flow rate";
  parameter Real kdp=0.1 "nominal dp [bar] per km at nominal flow";
  parameter SI.Density row=7600 "wall density";
  parameter SI.SpecificHeatCapacity cw=600 "wall specific heat";
  parameter SI.ThermalConductivity lambdaw=40 "wall thermal conductivity";  
  parameter Integer n(min=2)=5 "No. of lumps (axial), minimum 2";
  parameter Integer l(min=2)=3 "No. of  wall layers (radial), minimum 2"; 
  parameter SI.Temperature Tstart=293.15 "initial T, all lumps";
  parameter Boolean fluidHeats=true "T if fluid heats the outside, F otherwise";
  parameter Boolean hasInertia=false "account for fluid inertia";
  AES.ProcessComponents.Thermal.Interfaces.vectorHeatPort surf(n=n) annotation(
    Placement(visible = true, transformation(origin = {0, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 54}, extent = {{-42, -14}, {42, 14}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.TubeStream fluidStream(D = Di, L = L, Tstart = Tstart, dz = dz, fluidHeats = fluidHeats, hasInertia = hasInertia, kdp = kdp, n = n, pbhi = false, wnom = wnom)  annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.TubeWall wall(Di = Di, L = L, Tstart = Tstart, c = cw, l = l, lambda = lambdaw, n = n, ro = row, t = t)  annotation(
    Placement(visible = true, transformation(origin = {1, 43}, extent = {{-21, -21}, {21, 21}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Interfaces.pwhPort pwh_a annotation(
    Placement(visible = true, transformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Interfaces.pwhPort pwh_b annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(pwh_a, fluidStream.pwh_a) annotation(
    Line(points = {{-110, 0}, {-24, 0}}, color = {46, 52, 54}));
  connect(fluidStream.pwh_b, pwh_b) annotation(
    Line(points = {{24, 0}, {110, 0}}, color = {46, 52, 54}));
  connect(wall.innerSurf, fluidStream.surf) annotation(
    Line(points = {{2, 42}, {0, 42}, {0, 10}}, color = {144, 5, 5}));
  connect(pwh_a, fluidStream.pwh_a) annotation(
    Line(points = {{-110, 0}, {-24, 0}}, color = {46, 52, 54}));
  connect(fluidStream.pwh_b, pwh_b) annotation(
    Line(points = {{24, 0}, {110, 0}}, color = {46, 52, 54}));
  connect(wall.outerSurf, surf) annotation(
    Line(points = {{2, 54}, {0, 54}, {0, 90}}, color = {144, 5, 5}));

annotation(
    Icon(graphics = {Rectangle(lineColor = {46, 52, 54}, fillColor = {211, 215, 207}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, 40}, {100, -40}}), Text(origin = {-76, 3}, lineColor = {204, 0, 0}, extent = {{-44, 29}, {44, -29}}, textString = "a"), Text(origin = {70, 3}, lineColor = {204, 0, 0}, extent = {{-44, 29}, {44, -29}}, textString = "b")}),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end Tube;