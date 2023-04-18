within AES.Coursework.ThermSys_control_problems.Flow_pressure_control_liquids;

model Valve_linearisation_case_001
  extends AES.Icons.CourseworkModel;
  parameter Real c = 3;  /* 3 achieves quasi-linear inst char in 0.2-0.8 */
  inner AES.ProcessComponents.Thermal.System_settings.System_liquid system annotation(
    Placement(visible = true, transformation(origin = {-170, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Node_pT_fixed src(p = 150000) annotation(
    Placement(visible = true, transformation(origin = {-130, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.TubeStream streamNL(L = 20000) annotation(
    Placement(visible = true, transformation(origin = {30, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Node_pT_fixed snk(p = 1e5) annotation(
    Placement(visible = true, transformation(origin = {90, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Valve_linear valveNL annotation(
    Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression xv(y = max(1e-9, min(1, 0.01 * time))) annotation(
    Placement(visible = true, transformation(origin = {-110, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.Liquid.TubeStream streamLIN(L = 20000) annotation(
    Placement(visible = true, transformation(origin = {30, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.Liquid.Valve_linear valveLIN annotation(
    Placement(visible = true, transformation(origin = {-10, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression linearising_char(y = 1 / (1 - exp(c)) + 1 / (exp(c) - 1) * exp(c * xv.y)) annotation(
    Placement(visible = true, transformation(origin = {-110, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(src.pwh_a, valveNL.pwh_a) annotation(
    Line(points = {{-118, -10}, {-82, -10}}, color = {46, 52, 54}));
  connect(valveNL.pwh_b, streamNL.pwh_a) annotation(
    Line(points = {{-58, -10}, {18, -10}}, color = {46, 52, 54}));
  connect(streamNL.pwh_b, snk.pwh_a) annotation(
    Line(points = {{42, -10}, {78, -10}}, color = {46, 52, 54}));
  connect(xv.y, valveNL.x) annotation(
    Line(points = {{-99, 30}, {-70, 30}, {-70, 0}}, color = {0, 0, 127}));
  connect(valveLIN.pwh_b, streamLIN.pwh_a) annotation(
    Line(points = {{2, -50}, {18, -50}}, color = {46, 52, 54}));
  connect(src.pwh_a, valveLIN.pwh_a) annotation(
    Line(points = {{-118, -10}, {-100, -10}, {-100, -50}, {-22, -50}}, color = {46, 52, 54}));
  connect(streamLIN.pwh_b, snk.pwh_a) annotation(
    Line(points = {{42, -50}, {60, -50}, {60, -10}, {78, -10}}, color = {46, 52, 54}));
  connect(linearising_char.y, valveLIN.x) annotation(
    Line(points = {{-98, 70}, {-10, 70}, {-10, -40}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-6, Interval = 0.2),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})));
end Valve_linearisation_case_001;