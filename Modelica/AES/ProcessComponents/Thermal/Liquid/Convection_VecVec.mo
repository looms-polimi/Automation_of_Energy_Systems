within AES.ProcessComponents.Thermal.Liquid;

model Convection_VecVec
  parameter SI.Area A=1 "length";
  parameter SI.CoefficientOfHeatTransfer gamma=15 "HTC";
  parameter Integer n=5 "No. of lumps";
  parameter Boolean countercurrent=false "reverse connetions if true";

  AES.ProcessComponents.Thermal.Interfaces.vectorHeatPort surf_A(n=n) annotation(
    Placement(visible = true, transformation(origin = {0, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 52.6667}, extent = {{-40, -13.3333}, {40, 13.3333}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Interfaces.vectorHeatPort surf_B(n=n) annotation(
    Placement(visible = true, transformation(origin = {0, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {2.22045e-16, -52.6667}, extent = {{-40, -13.3333}, {40, 13.3333}}, rotation = 0)));
  SI.Power Qabtot;
protected
  final parameter SI.ThermalConductance Glump=gamma*A/n; /* lump conductance */
equation
  Qabtot=sum(surf_A.Q_flow);
  surf_A.Q_flow+surf_B.Q_flow=zeros(n);
  for i in 1:n loop
    surf_A.Q_flow[i] = Glump*
                       (surf_A.T[i]
                        -(if countercurrent then surf_B.T[n-i+1] else surf_B.T[i])
                       ); 
  end for;
annotation(
    Icon(graphics = {Text(origin = {-74, 65}, extent = {{-26, 25}, {26, -25}}, textString = "A"), Text(origin = {-74, 65}, extent = {{-26, 25}, {26, -25}}, textString = "A"), Text(origin = {-74, -65}, extent = {{-26, 25}, {26, -25}}, textString = "B"), Rectangle(origin = {0.0400051, 0}, fillColor = {245, 121, 0}, fillPattern = FillPattern.Vertical, extent = {{-99.96, 40}, {99.96, -40}})}),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
  Diagram());
end Convection_VecVec;