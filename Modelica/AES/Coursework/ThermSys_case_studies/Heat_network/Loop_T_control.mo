within AES.Coursework.ThermSys_case_studies.Heat_network;

model Loop_T_control
  extends Icons.CourseworkModel;
  ProcessComponents.Thermal.DistrictHeating.HeatingCentral HC annotation(
    Placement(visible = true, transformation(origin = {-108, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression spT(y = 273.15 + (if time < 30*3600 then 60 else 90)) annotation(
    Placement(visible = true, transformation(origin = {-168, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression spw01(y = 10) annotation(
    Placement(transformation(origin = {-168, -30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.BooleanExpression ON(y = true) annotation(
    Placement(visible = true, transformation(origin = {-168, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner ProcessComponents.Thermal.System_settings.System_liquid system annotation(
    Placement(visible = true, transformation(origin = {-170, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner ProcessComponents.Thermal.System_settings.System_terrain terrain annotation(
    Placement(visible = true, transformation(origin = {-130, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.DistrictHeating.pressuriser_tp_C press_tp_C(pC = 999999.9999999999) annotation(
    Placement(visible = true, transformation(origin = {-70, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.DistrictHeating.TwinPipeClosure closure(hasInertia = false, wnom = 10, L = 10000, n = 10) annotation(
    Placement(transformation(origin = {-16, -40}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(ON.y, HC.ON) annotation(
    Line(points = {{-157, -46}, {-120, -46}}, color = {255, 0, 255}));
  connect(spT.y, HC.spTfo) annotation(
    Line(points = {{-157, -14}, {-139, -14}, {-139, -34}, {-121, -34}}, color = {0, 0, 127}));
  connect(spw01.y, HC.spw01) annotation(
    Line(points = {{-157, -30}, {-147, -30}, {-147, -40}, {-121, -40}}, color = {0, 0, 127}));
  connect(HC.tpwh_a, press_tp_C.tpwh_a) annotation(
    Line(points = {{-96.4, -40}, {-82.4, -40}}));
  connect(press_tp_C.tpwh_b, closure.tpwh_a) annotation(
    Line(points = {{-58, -40}, {-28, -40}}));
  annotation(
    experiment(StartTime = 0, StopTime = 200000, Tolerance = 1e-06, Interval = 100),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts",
    __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})));
end Loop_T_control;