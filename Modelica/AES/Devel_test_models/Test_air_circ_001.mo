within AES.Devel_test_models;

model Test_air_circ_001
  extends Icons.TestModel;
  AES.ProcessComponents.Thermal.Air.MAvolume V(Tstart = 273.15 + 18, V = 10)  annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Air.Fan_controlled_q fan annotation(
    Placement(visible = true, transformation(origin = {-110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.Air.Node_pTphi_fixed src(phi0 = 0.4)  annotation(
    Placement(visible = true, transformation(origin = {-152, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Air.Node_pTphi_fixed snk annotation(
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Air.DPlin_NomPoint dp annotation(
    Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression qcmd(y = 0.5 + 0.4 * sin(time / 10))  annotation(
    Placement(visible = true, transformation(origin = {-130, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(src.air_flange1, fan.air_flange1) annotation(
    Line(points = {{-140, 10}, {-118, 10}}, color = {0, 100, 150}));
  connect(fan.air_flange2, V.air_flange1) annotation(
    Line(points = {{-102, 10}, {-78, 10}}, color = {0, 100, 150}));
  connect(V.air_flange2, dp.air_flange1) annotation(
    Line(points = {{-62, 10}, {-38, 10}}, color = {0, 100, 150}));
  connect(dp.air_flange2, snk.air_flange1) annotation(
    Line(points = {{-22, 10}, {-2, 10}}, color = {0, 100, 150}));
  connect(qcmd.y, fan.qcmd01) annotation(
    Line(points = {{-118, 50}, {-110, 50}, {-110, 14}}, color = {0, 0, 127}));
protected
  annotation(
    experiment(StartTime = 0, StopTime = 300, Tolerance = 1e-6, Interval = 0.03),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-300, -200}, {300, 200}})));
end Test_air_circ_001;