within AES.Coursework.ThermSys_component_models.Heater_power_vs_wTin;

model heater_wT_sweep_Tin
  extends Icons.CourseworkModel;
  parameter SI.Temperature Ti[:] = {40, 45, 50, 55, 60, 65, 70} + 273.15 * ones(7);
  AES.Coursework.ThermSys_component_models.Heater_power_vs_wTin.heater_wT cases[size(Ti, 1)](Timin = Ti, Timax = Ti) annotation(
    Placement(visible = true, transformation(origin = {-92, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 1.5e+06, Tolerance = 1e-06, Interval = 3000),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end heater_wT_sweep_Tin;