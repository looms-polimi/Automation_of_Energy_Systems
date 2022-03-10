within AES.Coursework.ThermSys_control_problems.Flow_pressure_control_liquids;

model Valve_linearisation_case_002
  extends AES.Icons.CourseworkModel;
  parameter Real c = 0.5;  /* 0.5 */
  inner AES.ProcessComponents.Thermal.System_settings.System_liquid system annotation(
    Placement(visible = true, transformation(origin = {-170, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Node_pT_fixed src(p = 150000) annotation(
    Placement(visible = true, transformation(origin = {-130, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.TubeStream streamNL(L = 20000) annotation(
    Placement(visible = true, transformation(origin = {50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Node_pT_fixed snk(p = 1e5) annotation(
    Placement(visible = true, transformation(origin = {110, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression xv(y = max(0, min(1, 0.01 * time))) annotation(
    Placement(visible = true, transformation(origin = {-110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.TubeStream streamLIN(L = 20000) annotation(
    Placement(visible = true, transformation(origin = {50, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Valve_linear valveLIN annotation(
    Placement(visible = true, transformation(origin = {-10, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression linearising_char(y = 1 / (1 - exp(c)) + 1 / (exp(c) - 1) * exp(c * xv.y)) annotation(
    Placement(visible = true, transformation(origin = {-110, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Pump_centrifugal pumpNL annotation(
    Placement(visible = true, transformation(origin = {-72, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Pump_centrifugal pumpLIN annotation(
    Placement(visible = true, transformation(origin = {-10, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression xp(y = 1) annotation(
    Placement(visible = true, transformation(origin = {-150, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.Liquid.Valve_linear valveNL annotation(
    Placement(visible = true, transformation(origin = {-72, 28}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(streamNL.pwh_b, snk.pwh_a) annotation(
    Line(points = {{62, -10}, {98, -10}}, color = {46, 52, 54}));
  connect(streamLIN.pwh_b, snk.pwh_a) annotation(
    Line(points = {{62, -70}, {82, -70}, {82, -10}, {98, -10}}, color = {46, 52, 54}));
  connect(linearising_char.y, valveLIN.x) annotation(
    Line(points = {{-98, 70}, {-10, 70}, {-10, -20}}, color = {0, 0, 127}));
  connect(src.pwh_a, pumpNL.pwh_a) annotation(
    Line(points = {{-118, -10}, {-84, -10}}, color = {46, 52, 54}));
  connect(pumpNL.pwh_b, streamNL.pwh_a) annotation(
    Line(points = {{-60, -10}, {38, -10}}, color = {46, 52, 54}));
  connect(pumpLIN.pwh_b, streamLIN.pwh_a) annotation(
    Line(points = {{2, -70}, {38, -70}}, color = {46, 52, 54}));
  connect(valveLIN.pwh_a, pumpLIN.pwh_b) annotation(
    Line(points = {{2, -30}, {20, -30}, {20, -70}, {2, -70}}, color = {46, 52, 54}));
  connect(src.pwh_a, pumpLIN.pwh_a) annotation(
    Line(points = {{-118, -10}, {-100, -10}, {-100, -70}, {-22, -70}}, color = {46, 52, 54}));
  connect(valveLIN.pwh_b, pumpLIN.pwh_a) annotation(
    Line(points = {{-22, -30}, {-40, -30}, {-40, -70}, {-22, -70}}, color = {46, 52, 54}));
  connect(xp.y, pumpNL.cmd) annotation(
    Line(points = {{-139, 10}, {-72, 10}, {-72, -2}}, color = {0, 0, 127}));
  connect(valveNL.pwh_b, src.pwh_a) annotation(
    Line(points = {{-84, 28}, {-100, 28}, {-100, -10}, {-118, -10}}, color = {46, 52, 54}));
  connect(pumpNL.pwh_b, valveNL.pwh_a) annotation(
    Line(points = {{-60, -10}, {-40, -10}, {-40, 28}, {-60, 28}}, color = {46, 52, 54}));
  connect(xp.y, pumpLIN.cmd) annotation(
    Line(points = {{-139, 10}, {-90, 10}, {-90, -52}, {-10, -52}, {-10, -62}}, color = {0, 0, 127}));
  connect(xv.y, valveNL.x) annotation(
    Line(points = {{-98, 50}, {-72, 50}, {-72, 38}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-6, Interval = 0.2),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})));
end Valve_linearisation_case_002;
