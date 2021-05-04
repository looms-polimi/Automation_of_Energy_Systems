within AES.Devel_test_models;

model Test_HE_LiquidLiquid_001
  extends Icons.TestModel;
  AES.ProcessComponents.Thermal.Liquid.Node_wT_fixed Hsrc(T = 343.15, w = 0.2)  annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Node_pT_fixed Hsnk annotation(
    Placement(visible = true, transformation(origin = {-10, -30}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  AES.ProcessComponents.Thermal.Liquid.HE_LiquidLiquid_1vol HE annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Node_wT_fixed Csrc(w = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Node_pT_fixed Csnk annotation(
    Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(Hsrc.pwh_a, HE.hotIn) annotation(
    Line(points = {{-38, 10}, {-22, 10}}, color = {46, 52, 54}));
  connect(HE.hotOut, Hsnk.pwh_a) annotation(
    Line(points = {{-10, -2}, {-10, -18}}, color = {46, 52, 54}));
  connect(HE.coldOut, Csnk.pwh_a) annotation(
    Line(points = {{-10, 22}, {-10, 38}}, color = {46, 52, 54}));
  connect(HE.coldIn, Csrc.pwh_a) annotation(
    Line(points = {{2, 10}, {18, 10}}, color = {46, 52, 54}));
  annotation(
    experiment(StartTime = 0, StopTime = 10000, Tolerance = 1e-6, Interval = 100),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})));
end Test_HE_LiquidLiquid_001;