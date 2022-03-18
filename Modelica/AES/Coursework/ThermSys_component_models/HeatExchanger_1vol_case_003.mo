within AES.Coursework.ThermSys_component_models;

model HeatExchanger_1vol_case_003
  extends AES.Icons.CourseworkModel;
  AES.ProcessComponents.Thermal.Liquid.HE_LiquidLiquid_1vol HE annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Node_pT_fixed Hsnk annotation(
    Placement(visible = true, transformation(origin = {-10, -70}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  AES.ProcessComponents.Thermal.Liquid.Node_wT_fixed Hsrc(T = 343.15, w = 0.2) annotation(
    Placement(visible = true, transformation(origin = {-92, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.Liquid.Node_wT_fixed Csrc(w = 0.1) annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.Liquid.Node_pT_fixed Csnk annotation(
    Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  AES.ProcessComponents.Thermal.Liquid.dp_quadratic dpHE(dpnom = 10000, wnom = 0.2) annotation(
    Placement(visible = true, transformation(origin = {-10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  AES.ProcessComponents.Thermal.Liquid.Valve_linear V(dpnom = 10000, wnom = 5) annotation(
    Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Blocks.Sources.RealExpression cmdV(y = max(0, min(1, (time - 100) / 50))) annotation(
    Placement(visible = true, transformation(origin = {-110, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(HE.coldOut, Csnk.pwh_a) annotation(
    Line(points = {{-10, 22}, {-10, 38}}, color = {46, 52, 54}));
  connect(HE.coldIn, Csrc.pwh_a) annotation(
    Line(points = {{2, 10}, {18, 10}}, color = {46, 52, 54}));
  connect(Hsrc.pwh_a, HE.hotIn) annotation(
    Line(points = {{-80, 10}, {-22, 10}}, color = {46, 52, 54}));
  connect(HE.hotOut, dpHE.pwh_a) annotation(
    Line(points = {{-10, -2}, {-10, -18}}, color = {46, 52, 54}));
  connect(dpHE.pwh_b, Hsnk.pwh_a) annotation(
    Line(points = {{-10, -42}, {-10, -58}}, color = {46, 52, 54}));
  connect(Hsrc.pwh_a, V.pwh_a) annotation(
    Line(points = {{-80, 10}, {-50, 10}, {-50, -18}}, color = {46, 52, 54}));
  connect(V.pwh_b, Hsnk.pwh_a) annotation(
    Line(points = {{-50, -42}, {-50, -50}, {-10, -50}, {-10, -58}}, color = {46, 52, 54}));
  connect(cmdV.y, V.x) annotation(
    Line(points = {{-99, -30}, {-60, -30}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 1000, Tolerance = 1e-6, Interval = 2),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end HeatExchanger_1vol_case_003;