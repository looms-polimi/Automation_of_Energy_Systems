within AES.ProcessComponents.Thermal.Liquid;

model TubeStream
  extends Interfaces.flowTwoPorts_pwh;
  parameter SI.Length L=10 "length";
  parameter SI.Length D=0.05 "diameter";
  parameter SI.Length dz=0 "height of port b (out) over port a (in)";
  parameter SI.MassFlowRate wnom=0.5 "nominal flow rate";
  parameter Real kdp=0.1 "nominal dp [bar] per km at nominal flow";
  parameter Integer n=5 "No. of lumps";
  parameter SI.Temperature Tstart=293.15 "initial T, all lumps";
  parameter SI.CoefficientOfHeatTransfer gamma0=2 "min gamma (still fluid)";
  parameter Boolean fluidHeats=true "T if fluid heats the outside, F otherwise";
  parameter Boolean hasInertia=false "account for fluid inertia";
  AES.ProcessComponents.Thermal.Interfaces.vectorHeatPort surf(n=n) annotation(
    Placement(visible = true, transformation(origin = {0, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 54}, extent = {{-42, -14}, {42, 14}}, rotation = 0)));
  SI.Velocity u "fluid velocity";
  Real Re,Nu,Pr;
  SI.Temperature Ta,Tb;
  SI.CoefficientOfHeatTransfer gamma;
  SI.Temperature T[n](each start=Tstart, each fixed=true) "fluid T, 1->n is a->b side";
  SI.Power Q_surf_tot;
protected
  final parameter Real kf(fixed=false) annotation(Evaluate = true);
  final parameter SI.Area Across=Modelica.Constants.pi*D^2/4;
  final parameter SI.Area Alat_lump=Modelica.Constants.pi*D*L/n;
  final parameter SI.Volume Vlump=Across*L/n;
  final parameter SI.HeatCapacity Clump=cp*ro*Vlump;
equation
 
  // CHECK THIS
  //w               = Functions.sqrtReg((dp/ro-Modelica.Constants.g_n*dz)/kf);
  if hasInertia then
     Across*dp-ro*Across*Modelica.Constants.g_n*dz-kf*w*abs(w)
                  = homotopy(actual=L*der(w),simplified = 0);
  else
     Across*dp-ro*Across*Modelica.Constants.g_n*dz-kf*w*abs(w) = 0;
  end if;
  w               = ro*Across*u;
  Re              = ro*abs(u)*D/mu;
  Nu              = gamma*D/lambda;
  Pr              = mu*cp/lambda;
  Nu              = 0.023*Re^0.8*Pr^(if fluidHeats then 0.3 else 0.4); /* Dittus-Boelter */
  surf.Q_flow     = max(gamma,gamma0)*Alat_lump*(surf.T-T);
  Clump*der(T[1]) = pwh_a.w*actualStream(pwh_a.h)
                    +w*cp*(if w>0 then -T[1] else -T[2])
                    +surf.Q_flow[1];
  for i in 2:n-1 loop
      Clump*der(T[i]) = w*cp*(if w>0 then T[i-1]-T[i] else T[i]-T[i+1])
                        +surf.Q_flow[i];
  end for;
  Clump*der(T[n]) = pwh_b.w*actualStream(pwh_b.h)
                    +w*cp*(if w>0 then T[n-1] else T[n])
                    +surf.Q_flow[n];
  hao             = cp*T[1];
  hbo             = cp*T[n];
  Ta              = T[1];
  Tb              = T[n];
  Q_surf_tot      = sum(surf.Q_flow);
initial equation
  // Across*dp - kf*w*abs(w) = 0;
  kdp*1e5*L/1000*Across = kf*wnom^2;
annotation(
    Icon(graphics = {Rectangle(lineColor = {46, 52, 54}, fillColor = {211, 215, 207}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, 40}, {100, -40}}), Text(origin = {-76, 3}, lineColor = {204, 0, 0}, extent = {{-44, 29}, {44, -29}}, textString = "a"), Text(origin = {70, 3}, lineColor = {204, 0, 0}, extent = {{-44, 29}, {44, -29}}, textString = "b")}),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end TubeStream;