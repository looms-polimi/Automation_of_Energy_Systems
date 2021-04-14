within AES.Devel_test_models;

model Test_air_circ_003
  extends Icons.TestModel;
  AES.ProcessComponents.Thermal.Air.MAvolume V(V = 1) annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Air.Fan_controlled_q fan1 annotation(
    Placement(visible = true, transformation(origin = {-110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Air.Node_pTphi_fixed src1(T0(displayUnit = "K") = 300, phi0 = 0.5) annotation(
    Placement(visible = true, transformation(origin = {-170, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Air.Node_pTphi_fixed snk annotation(
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Air.DPlin_NomPoint dpout annotation(
    Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression qcmd1(y = if sin(6.28 / 100 * time) > 0 then 0.1 else 0.9) annotation(
    Placement(visible = true, transformation(origin = {-130, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Air.DPlin_NomPoint dprec(qnom = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-112, -22}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(src1.air_flange1, fan1.air_flange1) annotation(
    Line(points = {{-158, 10}, {-118, 10}}, color = {0, 100, 150}));
  connect(fan1.air_flange2, V.air_flange1) annotation(
    Line(points = {{-102, 10}, {-78, 10}}, color = {0, 100, 150}));
  connect(V.air_flange2, dpout.air_flange1) annotation(
    Line(points = {{-62, 10}, {-38, 10}}, color = {0, 100, 150}));
  connect(dpout.air_flange2, snk.air_flange1) annotation(
    Line(points = {{-22, 10}, {-2, 10}}, color = {0, 100, 150}));
  connect(qcmd1.y, fan1.qcmd01) annotation(
    Line(points = {{-119, 40}, {-110, 40}, {-110, 14}}, color = {0, 0, 127}));
  connect(V.air_flange2, dprec.air_flange1) annotation(
    Line(points = {{-62, 10}, {-50, 10}, {-50, -22}, {-104, -22}}, color = {0, 100, 150}));
  connect(dprec.air_flange2, fan1.air_flange1) annotation(
    Line(points = {{-120, -22}, {-132, -22}, {-132, 10}, {-118, 10}}, color = {0, 100, 150}));
protected
  annotation(
    experiment(StartTime = 0, StopTime = 200, Tolerance = 1e-6, Interval = 0.02),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-300, -200}, {300, 200}})));
end Test_air_circ_003;