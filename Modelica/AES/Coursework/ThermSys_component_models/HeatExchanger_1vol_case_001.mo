within AES.Coursework.ThermSys_component_models;

model HeatExchanger_1vol_case_001
  extends Icons.CourseworkModel;
  AES.ProcessComponents.Thermal.Liquid.Node_wT_prescribed Hsrc annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Node_pT_fixed Hsnk annotation(
    Placement(visible = true, transformation(origin = {-10, -30}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  AES.ProcessComponents.Thermal.Liquid.HE_LiquidLiquid_1vol HE annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Node_wT_prescribed Csrc annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Node_pT_fixed Csnk annotation(
    Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.RealExpression wh(y = if time < 1000 then 0.2 else 0.3) annotation(
    Placement(visible = true, transformation(origin = {-110, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Thi(y = if time < 3000 then 343.15 else 363.15) annotation(
    Placement(visible = true, transformation(origin = {-110, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression wc(y = if time < 2000 then 0.1 else 0.15) annotation(
    Placement(visible = true, transformation(origin = {90, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Tci(y = if time < 4000 then 293.15 else 313.25) annotation(
    Placement(visible = true, transformation(origin = {90, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(Hsrc.pwh_a, HE.hotIn) annotation(
    Line(points = {{-38, 10}, {-22, 10}}, color = {46, 52, 54}));
  connect(HE.hotOut, Hsnk.pwh_a) annotation(
    Line(points = {{-10, -2}, {-10, -18}}, color = {46, 52, 54}));
  connect(HE.coldOut, Csnk.pwh_a) annotation(
    Line(points = {{-10, 22}, {-10, 38}}, color = {46, 52, 54}));
  connect(HE.coldIn, Csrc.pwh_a) annotation(
    Line(points = {{2, 10}, {18, 10}}, color = {46, 52, 54}));
  connect(wh.y, Hsrc.w) annotation(
    Line(points = {{-98, 30}, {-80, 30}, {-80, 16}, {-60, 16}}, color = {0, 0, 127}));
  connect(Thi.y, Hsrc.T) annotation(
    Line(points = {{-98, -10}, {-80, -10}, {-80, 4}, {-60, 4}}, color = {0, 0, 127}));
  connect(wc.y, Csrc.w) annotation(
    Line(points = {{80, 30}, {60, 30}, {60, 16}, {40, 16}}, color = {0, 0, 127}));
  connect(Tci.y, Csrc.T) annotation(
    Line(points = {{80, -10}, {60, -10}, {60, 4}, {40, 4}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 5000, Tolerance = 1e-6, Interval = 50),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})));
end HeatExchanger_1vol_case_001;