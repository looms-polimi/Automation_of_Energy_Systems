within AES.Devel_test_models;

model Test_liquid_circuit_001
  extends Icons.TestModel;
  inner AES.ProcessComponents.Thermal.System_settings.System_liquid system annotation(
    Placement(visible = true, transformation(origin = {-170, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.surfTcond_fixed surfTcond(T = 303.15) annotation(
    Placement(visible = true, transformation(origin = {10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Node_pT_fixed snk(p(displayUnit = "Pa")) annotation(
    Placement(visible = true, transformation(origin = {50, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.TubeStream tube(dz = 2.5)  annotation(
    Placement(visible = true, transformation(origin = {10, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Node_pT_prescribed src annotation(
    Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression pi(y = 101315 + 20000 + 10000 * sin(time / 50))  annotation(
    Placement(visible = true, transformation(origin = {-110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Ti(y = 293.15)  annotation(
    Placement(visible = true, transformation(origin = {-110, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Valve_linear valve(dpnom = 20000)  annotation(
    Placement(visible = true, transformation(origin = {-30, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression x(y = if time < 500 then 0.1 else 0.9) annotation(
    Placement(visible = true, transformation(origin = {-110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tsensor T1 annotation(
    Placement(visible = true, transformation(origin = {-18, -60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tsensor T2 annotation(
    Placement(visible = true, transformation(origin = {10, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(tube.pwh_b, snk.pwh_a) annotation(
    Line(points = {{22, -10}, {38, -10}}, color = {46, 52, 54}));
  connect(Ti.y, src.T) annotation(
    Line(points = {{-99, -30}, {-91, -30}, {-91, -16}, {-81, -16}}, color = {0, 0, 127}));
  connect(pi.y, src.p) annotation(
    Line(points = {{-99, 10}, {-91, 10}, {-91, -4}, {-81, -4}}, color = {0, 0, 127}));
  connect(surfTcond.surf, tube.surf) annotation(
    Line(points = {{10, 22}, {10, -5}}, color = {144, 5, 5}));
  connect(src.pwh_a, valve.pwh_a) annotation(
    Line(points = {{-58, -10}, {-42, -10}}, color = {46, 52, 54}));
  connect(valve.pwh_b, tube.pwh_a) annotation(
    Line(points = {{-18, -10}, {-2, -10}}, color = {46, 52, 54}));
  connect(x.y, valve.x) annotation(
    Line(points = {{-98, 50}, {-30, 50}, {-30, 0}}, color = {0, 0, 127}));
  connect(T2.pwh_a, valve.pwh_b) annotation(
    Line(points = {{-2, -40}, {-18, -40}, {-18, -10}}, color = {46, 52, 54}));
  connect(valve.pwh_a, T1.pwh_a) annotation(
    Line(points = {{-42, -10}, {-42, -60}, {-30, -60}}, color = {46, 52, 54}));
  annotation(
    experiment(StartTime = 0, StopTime = 1000, Tolerance = 1e-6, Interval = 0.1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})));
end Test_liquid_circuit_001;