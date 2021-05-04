within AES.Devel_test_models;

model Test_twin_pipes_002
  extends Icons.TestModel;
  inner AES.ProcessComponents.Thermal.System_settings.System_liquid system annotation(
    Placement(visible = true, transformation(origin = {-270, 148}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner ProcessComponents.Thermal.System_settings.System_terrain terrain annotation(
    Placement(visible = true, transformation(origin = {-230, 148}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.DistrictHeating.TwinPipe Tpipe1(n = 2)  annotation(
    Placement(visible = true, transformation(origin = {-70, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.DistrictHeating.TwinPipeClosure TpipeC1(n = 2)  annotation(
    Placement(visible = true, transformation(origin = {-4, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.DistrictHeating.TwinPipeClosure tipieC2(n = 2)  annotation(
    Placement(visible = true, transformation(origin = {4, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.Interfaces.pwhPortSplitter split annotation(
    Placement(visible = true, transformation(origin = {-108, 24}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.Liquid.Node_pT_fixed node_pT_fixed annotation(
    Placement(visible = true, transformation(origin = {-188, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.Liquid.Node_pT_fixed node_pT_fixed1 annotation(
    Placement(visible = true, transformation(origin = {-190, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Tpipe1.tpwh_b, TpipeC1.tpwh_a) annotation(
    Line(points = {{-58, 24}, {-44, 24}, {-44, 48}, {-16, 48}}));
  connect(Tpipe1.tpwh_b, tipieC2.tpwh_a) annotation(
    Line(points = {{-58, 24}, {-50, 24}, {-50, 12}, {-8, 12}, {-8, 4}}));
  connect(split.pwhTwin_HC, Tpipe1.tpwh_a) annotation(
    Line(points = {{-96, 24}, {-82, 24}}));
  connect(node_pT_fixed.pwh_a, split.pwh_H) annotation(
    Line(points = {{-176, 56}, {-152, 56}, {-152, 30}, {-120, 30}}, color = {46, 52, 54}));
  connect(node_pT_fixed1.pwh_a, split.pwh_C) annotation(
    Line(points = {{-178, -22}, {-142, -22}, {-142, 18}, {-120, 18}}, color = {46, 52, 54}));
protected
  annotation(
    experiment(StartTime = 0, StopTime = 1e+7, Tolerance = 1e-6, Interval = 1000),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-300, -200}, {300, 200}})));
end Test_twin_pipes_002;