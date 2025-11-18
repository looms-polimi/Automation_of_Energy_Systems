within AES.Coursework.ThermSys_case_studies.HVAC_floor;

model OL_steps
  extends OL(Phair(y = if time < 86400 then 0 else 1000),
             Phfloor(y = if time < 2*86400 then 0 else 1000),
             Vphren(y=0),
             Tamb(y=20));
  annotation(
    experiment(StartTime = 0, StopTime = 864000, Tolerance = 1e-06, Interval = 1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"));

end OL_steps;