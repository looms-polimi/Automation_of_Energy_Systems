within AES.Devel_test_models;

model Test_centrifugal_pump_001
  extends Icons.TestModel;
  inner AES.ProcessComponents.Thermal.System_settings.System_liquid system annotation(
    Placement(visible = true, transformation(origin = {-170, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Node_pT_fixed snk(p(displayUnit = "Pa")) annotation(
    Placement(visible = true, transformation(origin = {50, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Node_pT_prescribed src annotation(
    Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression pi(y = 101315) annotation(
    Placement(visible = true, transformation(origin = {-112, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Ti(y = 293.15) annotation(
    Placement(visible = true, transformation(origin = {-112, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression cmdP(y = if time < 10 then 0 else min(1, 0.1*(time - 10))) annotation(
    Placement(visible = true, transformation(origin = {-112, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression cmdV(y = if time < 20 then 0.05 else min(1, 0.05+ 0.1*(time - 20))) annotation(
    Placement(visible = true, transformation(origin = {-112, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Pump_centrifugal P(noReverse = false)  annotation(
    Placement(visible = true, transformation(origin = {-30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Valve_linear V(dpnom = 200000, wnom = 5) annotation(
    Placement(visible = true, transformation(origin = {10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Ti.y, src.T) annotation(
    Line(points = {{-101, -36}, {-80, -36}}, color = {0, 0, 127}));
  connect(pi.y, src.p) annotation(
    Line(points = {{-101, -10}, {-93, -10}, {-93, -24}, {-80, -24}}, color = {0, 0, 127}));
  connect(src.pwh_a, P.pwh_a) annotation(
    Line(points = {{-58, -30}, {-42, -30}}, color = {46, 52, 54}));
  connect(P.pwh_b, V.pwh_a) annotation(
    Line(points = {{-18, -30}, {-2, -30}}, color = {46, 52, 54}));
  connect(V.pwh_b, snk.pwh_a) annotation(
    Line(points = {{22, -30}, {38, -30}}, color = {46, 52, 54}));
  connect(cmdP.y, P.cmd) annotation(
    Line(points = {{-100, 10}, {-30, 10}, {-30, -22}}, color = {0, 0, 127}));
  connect(cmdV.y, V.x) annotation(
    Line(points = {{-100, 30}, {10, 30}, {10, -20}}, color = {0, 0, 127}));
protected
  annotation(
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.01),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})));
end Test_centrifugal_pump_001;