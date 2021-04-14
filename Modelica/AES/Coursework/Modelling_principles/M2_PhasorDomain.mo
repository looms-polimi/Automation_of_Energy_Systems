within AES.Coursework.Modelling_principles;

model M2_PhasorDomain
  extends Icons.CourseworkModel;
  parameter Real w = 6.28 * 50;
  parameter Real R = 50;
  parameter Real L = 0.01;
  parameter Real VGRMS = 220;
  parameter Real Ma = 4 * 4 * 3 * 1.1;
  parameter Real ca = 1020;
  parameter Real Gaw = 4 * 3 * 10;
  parameter Real Mw = 4 * 3 * 0.3 * 2000;
  parameter Real cw = 800;
  parameter Real Gwe = 4 * 3 * 4;
  Real P, PRa, Paw, Pwe, Te;
  Real Ta(start = 10);
  Real Tw(start = 10);
equation
  P = R * VGRMS ^ 2 / (R ^ 2 + w ^ 2 * L ^ 2);
  Ma * ca * der(Ta) = PRa - Paw;
  Mw * cw * der(Tw) = Paw - Pwe;
  PRa = P;
  Paw = Gaw * (Ta - Tw);
  Pwe = Gwe * (Tw - Te);
  Te = 5;
  annotation(
    experiment(StartTime = 0, StopTime = 864000, Tolerance = 1e-6, Interval = 21.4925),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end M2_PhasorDomain;