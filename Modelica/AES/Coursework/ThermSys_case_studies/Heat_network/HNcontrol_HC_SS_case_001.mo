within AES.Coursework.ThermSys_case_studies.Heat_network;

model HNcontrol_HC_SS_case_001
  extends Icons.CourseworkModel;
  AES.ProcessComponents.Thermal.DistrictHeating.HeatingCentral HC(w0 = 10)  annotation(
    Placement(visible = true, transformation(origin = {-110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.DistrictHeating.TwinPipe line1(L = 1000, wnom = 10) annotation(
    Placement(visible = true, transformation(origin = {-28, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression spTsupply(y = 273.15 + 100) annotation(
    Placement(visible = true, transformation(origin = {-168, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression spw01(y = 1) annotation(
    Placement(visible = true, transformation(origin = {-168, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression ON(y = true) annotation(
    Placement(visible = true, transformation(origin = {-168, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner AES.ProcessComponents.Thermal.System_settings.System_liquid system annotation(
    Placement(visible = true, transformation(origin = {-170, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner AES.ProcessComponents.Thermal.System_settings.System_terrain terrain annotation(
    Placement(visible = true, transformation(origin = {-130, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.DistrictHeating.pressuriser_tp_C press_tp_C(pC = 999999.9999999999)  annotation(
    Placement(visible = true, transformation(origin = {-70, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube tubeload annotation(
    Placement(visible = true, transformation(origin = {70, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.DistrictHeating.TwinPipeSubstation_PriValve SS1(Dpn_p = 20000)  annotation(
    Placement(visible = true, transformation(origin = {14, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.ExpansionVessel_isoT vessel(V = 0.2, p0 = 300000)  annotation(
    Placement(visible = true, transformation(origin = {22, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Pump_volumetric pump(w0 = 5)  annotation(
    Placement(visible = true, transformation(origin = {-30, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Pcmd(y = 1) annotation(
    Placement(visible = true, transformation(origin = {-70, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_basic PI_TretSS1(CSmax = 1, CSmin = 0.01, K = 0.2, Ti = 10)  annotation(
    Placement(visible = true, transformation(origin = {-32, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression spTret(y = 273.15 + 60) annotation(
    Placement(visible = true, transformation(origin = {-90, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.DistrictHeating.TwinPipeClosure closure(L = 1000, wnom = 10, hasInertia = false)  annotation(
    Placement(visible = true, transformation(origin = {70, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.surfQcond_prescribed pQload annotation(
    Placement(visible = true, transformation(origin = {70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Qload(y = (-1e5) + 1e4 * sin(time / 1000)) annotation(
    Placement(visible = true, transformation(origin = {30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.TwinPipeDiffPressureSensor sDpHC annotation(
    Placement(visible = true, transformation(origin = {-110, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ON.y, HC.ON) annotation(
    Line(points = {{-157, -46}, {-122, -46}}, color = {255, 0, 255}));
  connect(spTsupply.y, HC.spTfo) annotation(
    Line(points = {{-157, -14}, {-139, -14}, {-139, -34}, {-122, -34}}, color = {0, 0, 127}));
  connect(spw01.y, HC.spw01) annotation(
    Line(points = {{-157, -30}, {-147, -30}, {-147, -40}, {-122, -40}}, color = {0, 0, 127}));
  connect(HC.tpwh_a, press_tp_C.tpwh_a) annotation(
    Line(points = {{-98, -40}, {-82.4, -40}}));
  connect(press_tp_C.tpwh_b, line1.tpwh_a) annotation(
    Line(points = {{-58.4, -40}, {-40.4, -40}}));
  connect(line1.tpwh_b, SS1.tpwh_a) annotation(
    Line(points = {{-16, -40}, {2, -40}}));
  connect(vessel.pwh_b, tubeload.pwh_a) annotation(
    Line(points = {{34, 18}, {58, 18}}, color = {46, 52, 54}));
  connect(tubeload.pwh_b, SS1.pwh_C) annotation(
    Line(points = {{82, 18}, {96, 18}, {96, -14}, {18, -14}, {18, -28}}, color = {46, 52, 54}));
  connect(pump.pwh_a, SS1.pwh_H) annotation(
    Line(points = {{-42, 18}, {-50, 18}, {-50, -14}, {10, -14}, {10, -28}}, color = {46, 52, 54}));
  connect(pump.pwh_b, vessel.pwh_a) annotation(
    Line(points = {{-18, 18}, {10, 18}}, color = {46, 52, 54}));
  connect(Pcmd.y, pump.cmd) annotation(
    Line(points = {{-58, 40}, {-30, 40}, {-30, 26}}, color = {0, 0, 127}));
  connect(PI_TretSS1.CS, SS1.cmdVpri) annotation(
    Line(points = {{-20, -70}, {10, -70}, {10, -48}}, color = {0, 0, 127}));
  connect(SS1.ToutPri, PI_TretSS1.PV) annotation(
    Line(points = {{18, -48}, {18, -92}, {-54, -92}, {-54, -74}, {-44, -74}}, color = {0, 0, 127}));
  connect(spTret.y, PI_TretSS1.SP) annotation(
    Line(points = {{-79, -64}, {-44, -64}}, color = {0, 0, 127}));
  connect(SS1.tpwh_b, closure.tpwh_a) annotation(
    Line(points = {{26, -40}, {58, -40}}));
  connect(Qload.y, pQload.Q) annotation(
    Line(points = {{42, 50}, {62, 50}}, color = {0, 0, 127}));
  connect(pQload.surf, tubeload.surf) annotation(
    Line(points = {{70, 42}, {70, 24}}, color = {144, 5, 5}));
  connect(sDpHC.tpwh_a, HC.tpwh_a) annotation(
    Line(points = {{-98, -10}, {-90, -10}, {-90, -40}, {-98, -40}}));
  annotation(
    experiment(StartTime = 0, StopTime = 100000, Tolerance = 1e-6, Interval = 1000),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})));
end HNcontrol_HC_SS_case_001;