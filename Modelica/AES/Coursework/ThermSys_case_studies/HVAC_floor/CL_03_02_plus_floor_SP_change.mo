within AES.Coursework.ThermSys_case_studies.HVAC_floor;

model CL_03_02_plus_floor_SP_change
  extends CL_02_variable_SP_Tair(SP_Tfloor(y = if AES.Functions.hod(time) > 10 and AES.Functions.hod(time) < 18 then 23 else 21));
  annotation(
    experiment(StartTime = 0, StopTime = 864000, Tolerance = 1e-06, Interval = 1728),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"));

end CL_03_02_plus_floor_SP_change;