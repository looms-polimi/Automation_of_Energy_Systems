within AES.Devel_test_models;

model Test_substation_001
  extends Icons.TestModel;
  inner AES.ProcessComponents.Thermal.System_settings.System_liquid system annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression cmdP(y = 1) annotation(
    Placement(visible = true, transformation(origin = {-70, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression cmdT(y = 273.15 + 20 + 10 * sin(time / 100)) annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.surfTcond_prescribed T annotation(
    Placement(visible = true, transformation(origin = {110, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Pump_volumetric pumpC(w0 = 0.6) annotation(
    Placement(visible = true, transformation(origin = {10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube tube01 annotation(
    Placement(visible = true, transformation(origin = {110, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.DistrictHeating.HeatingCentral HC(Pmax = 1.2e5, V = 2, w0 = 0.6) annotation(
    Placement(visible = true, transformation(origin = {-110, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.DistrictHeating.TwinPipe tp01(kdp = 0.5) annotation(
    Placement(visible = true, transformation(origin = {30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.DistrictHeating.TwinPipeSubstation ss1 annotation(
    Placement(visible = true, transformation(origin = {70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Convection_VecVec conv01(A = 100) annotation(
    Placement(visible = true, transformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression HCon(y = true) annotation(
    Placement(visible = true, transformation(origin = {-170, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression HCspT(y = 273.15 + 100) annotation(
    Placement(visible = true, transformation(origin = {-170, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression HCspw(y = 1) annotation(
    Placement(visible = true, transformation(origin = {-170, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner ProcessComponents.Thermal.System_settings.System_terrain terrain annotation(
    Placement(visible = true, transformation(origin = {-50, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Node_pT_fixed ssrc annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Node_pT_fixed ssnk annotation(
    Placement(visible = true, transformation(origin = {170, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.DistrictHeating.pressuriser_tp_C ptpC(pC = 799999.9999999999) annotation(
    Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.DistrictHeating.TwinPipeClosure clo annotation(
    Placement(visible = true, transformation(origin = {130, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(cmdT.y, T.T) annotation(
    Line(points = {{1, 90}, {102, 90}}, color = {0, 0, 127}));
  connect(cmdP.y, pumpC.cmd) annotation(
    Line(points = {{-59, 60}, {10, 60}, {10, 38}}, color = {0, 0, 127}));
  connect(tp01.tpwh_b, ss1.tpwh_a) annotation(
    Line(points = {{42, -30}, {58, -30}}));
  connect(T.surf, conv01.surf_A) annotation(
    Line(points = {{110, 82}, {110, 66}}, color = {144, 5, 5}));
  connect(conv01.surf_B, tube01.surf) annotation(
    Line(points = {{110, 54}, {110, 25}}, color = {144, 5, 5}));
  connect(HC.spTfo, HCspT.y) annotation(
    Line(points = {{-122, -24}, {-140, -24}, {-140, -10}, {-158, -10}}, color = {0, 0, 127}));
  connect(HCspw.y, HC.spw01) annotation(
    Line(points = {{-158, -30}, {-122, -30}}, color = {0, 0, 127}));
  connect(HCon.y, HC.ON) annotation(
    Line(points = {{-158, -50}, {-140, -50}, {-140, -36}, {-122, -36}}, color = {255, 0, 255}));
  connect(ssrc.pwh_a, pumpC.pwh_a) annotation(
    Line(points = {{-38, 30}, {-2, 30}}, color = {46, 52, 54}));
  connect(HC.tpwh_a, ptpC.tpwh_a) annotation(
    Line(points = {{-98, -30}, {-82, -30}}));
  connect(ptpC.tpwh_b, tp01.tpwh_a) annotation(
    Line(points = {{-58, -30}, {18, -30}}));
  connect(pumpC.pwh_b, ss1.pwh_C) annotation(
    Line(points = {{22, 30}, {74, 30}, {74, -18}}, color = {46, 52, 54}));
  connect(ss1.pwh_H, tube01.pwh_a) annotation(
    Line(points = {{66, -18}, {66, 20}, {98, 20}}, color = {46, 52, 54}));
  connect(tube01.pwh_b, ssnk.pwh_a) annotation(
    Line(points = {{122, 20}, {158, 20}}, color = {46, 52, 54}));
  connect(ss1.tpwh_b, clo.tpwh_a) annotation(
    Line(points = {{82, -30}, {118, -30}}));
protected
  annotation(
    experiment(StartTime = 0, StopTime = 80000, Tolerance = 1e-6, Interval = 8),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-300, -200}, {300, 200}})));
end Test_substation_001;