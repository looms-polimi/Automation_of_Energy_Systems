within AES.Devel_test_models;

model Test_liquid_circuit_005
  extends Icons.TestModel;
  inner AES.ProcessComponents.Thermal.System_settings.System_liquid system annotation(
    Placement(visible = true, transformation(origin = {-170, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression cmdP(y = if time < 500 then 0.1 else 0.9) annotation(
    Placement(visible = true, transformation(origin = {-110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression cmdQ(y = 500) annotation(
    Placement(visible = true, transformation(origin = {-110, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.Liquid.Tube tubeH annotation(
    Placement(visible = true, transformation(origin = {10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.surfQcond_prescribed Q annotation(
    Placement(visible = true, transformation(origin = {10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube tubeC annotation(
    Placement(visible = true, transformation(origin = {70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression cmdT(y = 293.15) annotation(
    Placement(visible = true, transformation(origin = {-110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.surfTcond_prescribed T annotation(
    Placement(visible = true, transformation(origin = {70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Pressuriser pressuriser annotation(
    Placement(visible = true, transformation(origin = {-72, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Pump_centrifugal pumpC annotation(
    Placement(visible = true, transformation(origin = {-30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(cmdQ.y, Q.Q) annotation(
    Line(points = {{-99, 30}, {2, 30}}, color = {0, 0, 127}));
  connect(Q.surf, tubeH.surf) annotation(
    Line(points = {{10, 22}, {10, -24}}, color = {144, 5, 5}));
  connect(cmdT.y, T.T) annotation(
    Line(points = {{-98, 50}, {62, 50}}, color = {0, 0, 127}));
  connect(T.surf, tubeC.surf) annotation(
    Line(points = {{70, 42}, {70, -24}}, color = {144, 5, 5}));
  connect(tubeH.pwh_b, tubeC.pwh_a) annotation(
    Line(points = {{22, -30}, {58, -30}}, color = {46, 52, 54}));
  connect(tubeC.pwh_b, pressuriser.pwh_a) annotation(
    Line(points = {{82, -30}, {100, -30}, {100, -60}, {-100, -60}, {-100, -30}, {-84, -30}}, color = {46, 52, 54}));
  connect(pressuriser.pwh_b, pumpC.pwh_a) annotation(
    Line(points = {{-60, -30}, {-42, -30}}, color = {46, 52, 54}));
  connect(pumpC.pwh_b, tubeH.pwh_a) annotation(
    Line(points = {{-18, -30}, {-2, -30}}, color = {46, 52, 54}));
  connect(cmdP.y, pumpC.cmd) annotation(
    Line(points = {{-98, 10}, {-30, 10}, {-30, -22}}, color = {0, 0, 127}));
protected
  annotation(
    experiment(StartTime = 0, StopTime = 1000, Tolerance = 1e-6, Interval = 0.1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})));
end Test_liquid_circuit_005;