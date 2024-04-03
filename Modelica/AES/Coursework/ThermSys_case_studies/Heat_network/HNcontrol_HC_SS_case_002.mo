within AES.Coursework.ThermSys_case_studies.Heat_network;

model HNcontrol_HC_SS_case_002
  extends Icons.CourseworkModel;
  AES.ProcessComponents.Thermal.DistrictHeating.HeatingCentral HC(w0 = 40)  annotation(
    Placement(visible = true, transformation(origin = {-90, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.DistrictHeating.TwinPipe line1(L = 1000, wnom = 10) annotation(
    Placement(visible = true, transformation(origin = {-2, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression spTsupply(y = 273.15 + 100) annotation(
    Placement(visible = true, transformation(origin = {-168, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression spDp(y = min(1e5*time/60, 3e4)) annotation(
    Placement(visible = true, transformation(origin = {-168, -64}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression ON(y = true) annotation(
    Placement(visible = true, transformation(origin = {-168, -46}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  inner AES.ProcessComponents.Thermal.System_settings.System_liquid system annotation(
    Placement(visible = true, transformation(origin = {-170, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner AES.ProcessComponents.Thermal.System_settings.System_terrain terrain annotation(
    Placement(visible = true, transformation(origin = {-130, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.DistrictHeating.pressuriser_tp_C press_tp_C(pC = 999999.9999999999)  annotation(
    Placement(visible = true, transformation(origin = {-42, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube tubeload annotation(
    Placement(visible = true, transformation(origin = {78, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.DistrictHeating.TwinPipeSubstation_PriValve SS1(Dpn_p = 10000, Pn = 5e4)  annotation(
    Placement(visible = true, transformation(origin = {42, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.ExpansionVessel_isoT vessel(V = 0.2, p0 = 300000)  annotation(
    Placement(visible = true, transformation(origin = {38, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Pump_volumetric pump(w0 = 5)  annotation(
    Placement(visible = true, transformation(origin = {-2, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Pcmd(y = 1) annotation(
    Placement(visible = true, transformation(origin = {-42, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_basic PI_TretSS1(CSmax = 1, CSmin = 0.01, K = 0.2, Ti = 10)  annotation(
    Placement(visible = true, transformation(origin = {18, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression spTret(y = 273.15 + 60) annotation(
    Placement(visible = true, transformation(origin = {-42, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.surfQcond_prescribed pQload annotation(
    Placement(visible = true, transformation(origin = {78, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Qload(y = (-1e5) + 1e4 * sin(time / 1000)) annotation(
    Placement(visible = true, transformation(origin = {38, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.TwinPipeDiffPressureSensor sDp annotation(
    Placement(visible = true, transformation(origin = {-90, -86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_basic PI_Dp(CSmax = 1, CSmin = 0.01, K = 20, Ti = 10) annotation(
    Placement(transformation(origin = {-130, -70}, extent = {{-10, -10}, {10, 10}})));
  AES.ProcessComponents.Thermal.DistrictHeating.TwinPipeClosure closure(wnom = 10, hasInertia = false) annotation(
    Placement(visible = true, transformation(origin = {90, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ON.y, HC.ON) annotation(
    Line(points = {{-157, -46}, {-102, -46}}, color = {255, 0, 255}));
  connect(spTsupply.y, HC.spTfo) annotation(
    Line(points = {{-157, -34}, {-103, -34}}, color = {0, 0, 127}));
  connect(HC.tpwh_a, press_tp_C.tpwh_a) annotation(
    Line(points = {{-78, -40}, {-54, -40}}));
  connect(press_tp_C.tpwh_b, line1.tpwh_a) annotation(
    Line(points = {{-30.4, -40}, {-14.4, -40}}));
  connect(line1.tpwh_b, SS1.tpwh_a) annotation(
    Line(points = {{9.6, -40}, {29.2, -40}}));
  connect(vessel.pwh_b, tubeload.pwh_a) annotation(
    Line(points = {{50, 18}, {66, 18}}, color = {46, 52, 54}));
  connect(tubeload.pwh_b, SS1.pwh_C) annotation(
    Line(points = {{90, 18}, {100, 18}, {100, -14}, {46, -14}, {46, -28}}, color = {46, 52, 54}));
  connect(pump.pwh_a, SS1.pwh_H) annotation(
    Line(points = {{-14, 18}, {-22, 18}, {-22, -14}, {38, -14}, {38, -28}}, color = {46, 52, 54}));
  connect(pump.pwh_b, vessel.pwh_a) annotation(
    Line(points = {{10, 18}, {26, 18}}, color = {46, 52, 54}));
  connect(Pcmd.y, pump.cmd) annotation(
    Line(points = {{-31, 50}, {-2, 50}, {-2, 26}}, color = {0, 0, 127}));
  connect(PI_TretSS1.CS, SS1.cmdVpri) annotation(
    Line(points = {{30, -70}, {38, -70}, {38, -48}}, color = {0, 0, 127}));
  connect(SS1.ToutPri, PI_TretSS1.PV) annotation(
    Line(points = {{46, -48}, {46, -86}, {-2, -86}, {-2, -74}, {6, -74}}, color = {0, 0, 127}));
  connect(spTret.y, PI_TretSS1.SP) annotation(
    Line(points = {{-31, -64}, {6, -64}}, color = {0, 0, 127}));
  connect(Qload.y, pQload.Q) annotation(
    Line(points = {{49, 50}, {70, 50}}, color = {0, 0, 127}));
  connect(pQload.surf, tubeload.surf) annotation(
    Line(points = {{78, 41.3333}, {78, 23.3333}}, color = {144, 5, 5}));
  connect(spDp.y, PI_Dp.SP) annotation(
    Line(points = {{-157, -64}, {-142, -64}}, color = {0, 0, 127}));
  connect(HC.tpwh_a, sDp.tpwh_a) annotation(
    Line(points = {{-78, -40}, {-70, -40}, {-70, -86}, {-78, -86}}));
  connect(sDp.oDpHC, PI_Dp.PV) annotation(
    Line(points = {{-88, -86}, {-150, -86}, {-150, -74}, {-142, -74}}, color = {0, 0, 127}));
  connect(SS1.tpwh_b, closure.tpwh_a) annotation(
    Line(points = {{53.6, -40}, {77.6, -40}}));
  connect(HC.spw01, PI_Dp.CS) annotation(
    Line(points = {{-102, -40}, {-112, -40}, {-112, -70}, {-118, -70}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 100000, Tolerance = 1e-6, Interval = 1000),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})));
end HNcontrol_HC_SS_case_002;