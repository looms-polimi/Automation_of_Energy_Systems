within AES.Coursework.ThermSys_case_studies.Heat_network;

model HC_SS_case_001
  extends Icons.CourseworkModel;
  AES.ProcessComponents.Thermal.DistrictHeating.HeatingCentral HC annotation(
    Placement(visible = true, transformation(origin = {-108, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.DistrictHeating.TwinPipe line(L = 1000, kdp = 1, wnom = 5) annotation(
    Placement(visible = true, transformation(origin = {-28, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression spT(y = 273.15 + 60) annotation(
    Placement(visible = true, transformation(origin = {-168, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression spw01(y = 0.5) annotation(
    Placement(visible = true, transformation(origin = {-168, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression ON(y = true) annotation(
    Placement(visible = true, transformation(origin = {-168, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression load(y = 298) annotation(
    Placement(visible = true, transformation(origin = {10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner AES.ProcessComponents.Thermal.System_settings.System_liquid system annotation(
    Placement(visible = true, transformation(origin = {-170, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner AES.ProcessComponents.Thermal.System_settings.System_terrain terrain annotation(
    Placement(visible = true, transformation(origin = {-130, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.DistrictHeating.pressuriser_tp_C press_tp_C(pC = 999999.9999999999)  annotation(
    Placement(visible = true, transformation(origin = {-70, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.Liquid.surfTcond_prescribed Tload annotation(
    Placement(visible = true, transformation(origin = {70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.Liquid.Tube tubeload annotation(
    Placement(visible = true, transformation(origin = {70, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.DistrictHeating.TwinPipeSubstation SS annotation(
    Placement(visible = true, transformation(origin = {14, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.ExpansionVessel_isoT vessel(V = 0.2, p0 = 300000)  annotation(
    Placement(visible = true, transformation(origin = {22, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Pump_volumetric pump annotation(
    Placement(visible = true, transformation(origin = {-28, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Pcmd(y = 1) annotation(
    Placement(visible = true, transformation(origin = {-70, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ON.y, HC.ON) annotation(
    Line(points = {{-157, -46}, {-120, -46}}, color = {255, 0, 255}));
  connect(spT.y, HC.spTfo) annotation(
    Line(points = {{-157, -14}, {-139, -14}, {-139, -34}, {-121, -34}}, color = {0, 0, 127}));
  connect(spw01.y, HC.spw01) annotation(
    Line(points = {{-157, -30}, {-147, -30}, {-147, -40}, {-121, -40}}, color = {0, 0, 127}));
  connect(HC.tpwh_a, press_tp_C.tpwh_a) annotation(
    Line(points = {{-96.4, -40}, {-82.4, -40}}));
  connect(press_tp_C.tpwh_b, line.tpwh_a) annotation(
    Line(points = {{-58.4, -40}, {-40.4, -40}}));
  connect(Tload.surf, tubeload.surf) annotation(
    Line(points = {{70, 41.3333}, {70, 25.3333}}, color = {144, 5, 5}));
  connect(load.y, Tload.T) annotation(
    Line(points = {{21, 50}, {61, 50}}, color = {0, 0, 127}));
  connect(line.tpwh_b, SS.tpwh_a) annotation(
    Line(points = {{-16, -40}, {2, -40}}));
  connect(vessel.pwh_b, tubeload.pwh_a) annotation(
    Line(points = {{34, 18}, {58, 18}, {58, 20}}, color = {46, 52, 54}));
  connect(tubeload.pwh_b, SS.pwh_C) annotation(
    Line(points = {{82, 20}, {96, 20}, {96, -14}, {18, -14}, {18, -28}}, color = {46, 52, 54}));
  connect(pump.pwh_a, SS.pwh_H) annotation(
    Line(points = {{-40, 18}, {-50, 18}, {-50, -10}, {10, -10}, {10, -28}}, color = {46, 52, 54}));
  connect(pump.pwh_b, vessel.pwh_a) annotation(
    Line(points = {{-16, 18}, {10, 18}}, color = {46, 52, 54}));
  connect(Pcmd.y, pump.cmd) annotation(
    Line(points = {{-58, 40}, {-28, 40}, {-28, 26}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 100000, Tolerance = 1e-6, Interval = 1000),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})));
end HC_SS_case_001;
