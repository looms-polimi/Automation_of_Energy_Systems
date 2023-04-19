within AES.Devel_test_models;

model Test_expansion_vessel_isoT_001
  extends Icons.TestModel;
  inner AES.ProcessComponents.Thermal.System_settings.System_liquid system annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression cmdP(y = 1 + 0.2 * sign(sin(time / 1000))) annotation(
    Placement(visible = true, transformation(origin = {-72, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression cmdT(y = 273.15 + 20 + 10 * sin(time / 100)) annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.surfTcond_prescribed T annotation(
    Placement(visible = true, transformation(origin = {110, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Pump_volumetric pumpC(w0 = 0.001) annotation(
    Placement(visible = true, transformation(origin = {8, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube tube01(L = 1000, kdp = 1, wnom = 1)  annotation(
    Placement(visible = true, transformation(origin = {110, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Convection_VecVec conv01(A = 100)  annotation(
    Placement(visible = true, transformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner ProcessComponents.Thermal.System_settings.System_terrain terrain annotation(
    Placement(visible = true, transformation(origin = {-50, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Node_pT_fixed ssrc annotation(
    Placement(visible = true, transformation(origin = {-52, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Node_pT_fixed ssnk annotation(
    Placement(visible = true, transformation(origin = {170, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.Liquid.ExpansionVessel_isoT ev(T0(displayUnit = "K"), p0 = 2000000)  annotation(
    Placement(visible = true, transformation(origin = {58, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(cmdT.y, T.T) annotation(
    Line(points = {{1, 90}, {102, 90}}, color = {0, 0, 127}));
  connect(cmdP.y, pumpC.cmd) annotation(
    Line(points = {{-61, 50}, {8, 50}, {8, 28}}, color = {0, 0, 127}));
  connect(T.surf, conv01.surf_A) annotation(
    Line(points = {{110, 82}, {110, 66}}, color = {144, 5, 5}));
  connect(conv01.surf_B, tube01.surf) annotation(
    Line(points = {{110, 54}, {110, 25}}, color = {144, 5, 5}));
  connect(ssrc.pwh_a, pumpC.pwh_a) annotation(
    Line(points = {{-40, 20}, {-4, 20}}, color = {46, 52, 54}));
  connect(tube01.pwh_b, ssnk.pwh_a) annotation(
    Line(points = {{122, 20}, {158, 20}}, color = {46, 52, 54}));
  connect(pumpC.pwh_b, ev.pwh_a) annotation(
    Line(points = {{20, 20}, {46, 20}}, color = {46, 52, 54}));
  connect(ev.pwh_b, tube01.pwh_a) annotation(
    Line(points = {{70, 20}, {98, 20}}, color = {46, 52, 54}));
protected
  annotation(
    experiment(StartTime = 0, StopTime = 80000, Tolerance = 1e-06, Interval = 8),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-300, -200}, {300, 200}})));
end Test_expansion_vessel_isoT_001;