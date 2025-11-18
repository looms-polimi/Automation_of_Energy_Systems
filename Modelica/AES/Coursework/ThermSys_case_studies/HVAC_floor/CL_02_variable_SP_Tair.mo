within AES.Coursework.ThermSys_case_studies.HVAC_floor;

model CL_02_variable_SP_Tair
  extends CL_01(SP_Tair(y = if AES.Functions.hod(time) > 8 and AES.Functions.hod(time) < 20 then 20 else 14));
  annotation(
    experiment(StartTime = 0, StopTime = 864000, Tolerance = 1e-06, Interval = 1728),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"));

end CL_02_variable_SP_Tair;