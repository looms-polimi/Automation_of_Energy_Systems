within AES.Devel_test_models;

model Test_air_circ_002
  extends Icons.TestModel;
  AES.ProcessComponents.Thermal.Air.MAvolume V(V = 1)  annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Air.Fan_controlled_q fan1 annotation(
    Placement(visible = true, transformation(origin = {-110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Air.Node_pTphi_fixed src1(T0(displayUnit = "K") = 300, phi0 = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {-150, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Air.Node_pTphi_fixed snk annotation(
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Air.DPlin_NomPoint dp annotation(
    Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression qcmd1(y = if sin(6.28 / 100 * time) > 0 then 0.01 else 0.99)  annotation(
    Placement(visible = true, transformation(origin = {-130, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Air.Node_pTphi_fixed src2(T0(displayUnit = "K") = 290, phi0 = 0.3) annotation(
    Placement(visible = true, transformation(origin = {-150, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Air.Fan_controlled_q fan2 annotation(
    Placement(visible = true, transformation(origin = {-110, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression qcmd2(y = 1 - qcmd1.y) annotation(
    Placement(visible = true, transformation(origin = {-130, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(src1.air_flange1, fan1.air_flange1) annotation(
    Line(points = {{-138, 10}, {-118, 10}}, color = {0, 100, 150}));
  connect(fan1.air_flange2, V.air_flange1) annotation(
    Line(points = {{-102, 10}, {-78, 10}}, color = {0, 100, 150}));
  connect(V.air_flange2, dp.air_flange1) annotation(
    Line(points = {{-62, 10}, {-38, 10}}, color = {0, 100, 150}));
  connect(dp.air_flange2, snk.air_flange1) annotation(
    Line(points = {{-22, 10}, {-2, 10}}, color = {0, 100, 150}));
  connect(qcmd1.y, fan1.qcmd01) annotation(
    Line(points = {{-119, 40}, {-110, 40}, {-110, 14}}, color = {0, 0, 127}));
  connect(qcmd2.y, fan2.qcmd01) annotation(
    Line(points = {{-119, -20}, {-110, -20}, {-110, -46}}, color = {0, 0, 127}));
  connect(src2.air_flange1, fan2.air_flange1) annotation(
    Line(points = {{-138, -50}, {-118, -50}}, color = {0, 100, 150}));
  connect(fan2.air_flange2, V.air_flange1) annotation(
    Line(points = {{-102, -50}, {-90, -50}, {-90, 10}, {-78, 10}}, color = {0, 100, 150}));
protected
  annotation(
    experiment(StartTime = 0, StopTime = 200, Tolerance = 1e-6, Interval = 0.02),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-300, -200}, {300, 200}})));
end Test_air_circ_002;