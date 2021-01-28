within AES.ProcessComponents.Thermal.Piping_liquid;

model TubeWall
  parameter SI.Length L=10 "length";
  parameter SI.Length Di=0.05 "inner diameter";
  parameter SI.Length t=0.002 "thickness";
  parameter SI.Density ro=7600 "density";
  parameter SI.SpecificHeatCapacity c=600 "specific heat";
  parameter SI.ThermalConductivity lambda=40 "thermal conductivity";
  parameter Integer n=10 "No. of lumps (axial)";
  parameter Integer l=3 "No. of layers (radial)";
  parameter SI.Temperature Tstart=293.15 "initial T, all elements";
  AES.ProcessComponents.Thermal.Interfaces.vectorHeatPort innerSurf(n=n) annotation(
    Placement(visible = true, transformation(origin = {0, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {2, -2}, extent = {{-42, -14}, {42, 14}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Interfaces.vectorHeatPort outerSurf(n=n) annotation(
    Placement(visible = true, transformation(origin = {0, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {2, 54}, extent = {{-42, -14}, {42, 14}}, rotation = 0)));
  SI.Temperature T[n,l](each start=Tstart, each fixed=true) "1->n is a->b, 1->l is i->o";
protected
  final parameter SI.Area A=Modelica.Constants.pi*Di*L; /* we fake wall planar for simplicity*/
  final parameter SI.ThermalConductance Ghalf=lambda*A/(t/l/2); /* half layer conductance */
  final parameter SI.ThermalConductance Gfull=lambda*A/(t/l); /* full layer conductance */
  final parameter SI.HeatCapacity Clayer=c*ro*A*t/l; /* layer capacity */
equation
  for i in 1:n loop
    innerSurf.Q_flow[i] = Ghalf*(innerSurf.T[i]-T[i,1]);
    Clayer*der(T[i,1]) = innerSurf.Q_flow[i]-Gfull*(T[i,1]-T[i,2]);
    for j in 2:l-1 loop
       Clayer*der(T[i,j]) = Gfull*(T[i,j-1]-T[i,j])-Gfull*(T[i,j]-T[i,j+1]);
    end for;
    Clayer*der(T[i,l]) = Gfull*(T[i,l-1]-T[i,l])+outerSurf.Q_flow[i];
    outerSurf.Q_flow[i] = Ghalf*(outerSurf.T[i]-T[i,l]);
  end for;
annotation(
    Icon(graphics = {Rectangle(origin = {0, -3}, lineColor = {85, 87, 83}, fillColor = {238, 238, 236}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, 37}, {100, -37}}), Rectangle(origin = {0, 26}, lineColor = {92, 53, 102}, fillColor = {238, 238, 236}, fillPattern = FillPattern.Backward, lineThickness = 0.5, extent = {{-100, 14}, {100, -14}})}),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
  Diagram());
end TubeWall;