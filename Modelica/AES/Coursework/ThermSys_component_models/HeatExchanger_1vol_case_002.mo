within AES.Coursework.ThermSys_component_models;

model HeatExchanger_1vol_case_002
  extends AES.Icons.CourseworkModel;
  AES.ProcessComponents.Thermal.Liquid.HE_LiquidLiquid_1vol HE annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Node_pT_fixed Hsnk annotation(
    Placement(visible = true, transformation(origin = {-10, -30}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  ProcessComponents.Thermal.Liquid.Node_wT_fixed Csrc(w = 0.1) annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.Liquid.Node_pT_fixed Csnk annotation(
    Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  AES.ProcessComponents.Thermal.Liquid.Valve_linear V(dpnom(displayUnit = "Pa") = 5000, wnom = 0.2) annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Blocks.Sources.RealExpression cmdV(y = max(0.05, min(1, 1 - (time - 100) / 50))) annotation(
    Placement(visible = true, transformation(origin = {-106, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Node_pT_fixed Hsrc(T = 343.15, p = 101325 + 5000) annotation(
    Placement(visible = true, transformation(origin = {-90, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
  inner ProcessComponents.Thermal.System_settings.System_liquid system annotation(
    Placement(visible = true, transformation(origin = {-170, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(HE.coldOut, Csnk.pwh_a) annotation(
    Line(points = {{-10, 22}, {-10, 38}}, color = {46, 52, 54}));
  connect(HE.coldIn, Csrc.pwh_a) annotation(
    Line(points = {{2, 10}, {18, 10}}, color = {46, 52, 54}));
  connect(cmdV.y, V.x) annotation(
    Line(points = {{-95, 46}, {-49.5, 46}, {-49.5, 20}, {-50, 20}}, color = {0, 0, 127}));
  connect(Hsnk.pwh_a, HE.hotOut) annotation(
    Line(points = {{-10, -18}, {-10, -2}}, color = {46, 52, 54}));
  connect(Hsrc.pwh_a, V.pwh_a) annotation(
    Line(points = {{-78, 10}, {-62, 10}}, color = {46, 52, 54}));
  connect(V.pwh_b, HE.hotIn) annotation(
    Line(points = {{-38, 10}, {-22, 10}}, color = {46, 52, 54}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 1500, Tolerance = 1e-6, Interval = 3),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end HeatExchanger_1vol_case_002;