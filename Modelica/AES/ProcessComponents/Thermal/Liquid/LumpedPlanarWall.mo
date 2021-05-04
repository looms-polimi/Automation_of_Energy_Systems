within AES.ProcessComponents.Thermal.Liquid;

model LumpedPlanarWall
  parameter SI.Length L=1 "length";
  parameter SI.Length W=0.2 "width";
  parameter SI.Length t=0.002 "thickness";
  parameter SI.Density ro=7600 "density";
  parameter SI.SpecificHeatCapacity c=600 "specific heat";
  parameter SI.ThermalConductivity lambda=40 "thermal conductivity";
  parameter Integer n=5 "No. of lumps (in the length direction)";
  parameter Integer l=3 "No. of layers (in the thickness direction)";
  parameter SI.Temperature Tstart=293.15 "initial T, all elements";
  AES.ProcessComponents.Thermal.Interfaces.vectorHeatPort surfA(n=n) annotation(
    Placement(visible = true, transformation(origin = {0, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {2, 28}, extent = {{-42, -14}, {42, 14}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Interfaces.vectorHeatPort surfB(n=n) annotation(
    Placement(visible = true, transformation(origin = {0, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {2, -26}, extent = {{-42, -14}, {42, 14}}, rotation = 0)));
  SI.Temperature T[n,l](each start=Tstart, each fixed=true) "1->n in L dir, 1->l A->B";
protected
  final parameter SI.Area A=L*W;
  final parameter SI.ThermalConductance Ghalf=lambda*A/(t/l/2); /* half layer cond */
  final parameter SI.ThermalConductance Gfull=lambda*A/(t/l); /* full layer cond */
  final parameter SI.HeatCapacity Clayer=c*ro*A*t/l; /* layer cap */
equation
  for i in 1:n loop
    surfA.Q_flow[i] = Ghalf*(surfA.T[i]-T[i,1]);
    Clayer*der(T[i,1]) = surfA.Q_flow[i]-Gfull*(T[i,1]-T[i,2]);
    for j in 2:l-1 loop
       Clayer*der(T[i,j]) = Gfull*(T[i,j-1]-T[i,j])-Gfull*(T[i,j]-T[i,j+1]);
    end for;
    Clayer*der(T[i,l]) = Gfull*(T[i,l-1]-T[i,l])+surfB.Q_flow[i];
    surfB.Q_flow[i] = Ghalf*(surfB.T[i]-T[i,l]);
  end for;
annotation(
    Icon(graphics = {Rectangle(origin = {0, 1}, lineColor = {92, 53, 102}, fillColor = {238, 238, 236}, fillPattern = FillPattern.Backward, lineThickness = 0.5, extent = {{-100, 13}, {100, -13}}), Text(origin = {-70, 42}, extent = {{-30, 28}, {30, -28}}, textString = "A"), Text(origin = {-70, 42}, extent = {{-30, 28}, {30, -28}}, textString = "A"), Text(origin = {-70, -40}, extent = {{-30, 28}, {30, -28}}, textString = "B")}),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
  Diagram());
end LumpedPlanarWall;