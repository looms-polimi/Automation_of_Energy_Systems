within AES.Coursework.ThermSys_component_models;

model Controlled_AHU_case_001
  extends Icons.CourseworkModel;
  AES.ProcessComponents.Thermal.Air.Fan_controlled_q fan(qmax = 0.5) annotation(
    Placement(visible = true, transformation(origin = {-110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.Air.Node_pTphi_fixed src(T0 = 273.15 + 32, phi0 = 0.9) annotation(
    Placement(visible = true, transformation(origin = {-152, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Air.Node_pTphi_fixed snk annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Air.DPlin_NomPoint dp annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression qcmd(y = 0.5) annotation(
    Placement(visible = true, transformation(origin = {-130, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.HVAC.ControlledAHU AHU annotation(
    Placement(visible = true, transformation(origin = {-80, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression spT(y = if time < 500 then 291.15 else 295.15) annotation(
    Placement(visible = true, transformation(origin = {-130, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression spphi(y = 0.55) annotation(
    Placement(visible = true, transformation(origin = {-130, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression AHUon(y = true) annotation(
    Placement(visible = true, transformation(origin = {-112, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Air.MAvolume V(Tstart(displayUnit = "K") = 291.15, V = 75, phistart = 0.6) annotation(
    Placement(visible = true, transformation(origin = {-44, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(dp.air_flange2, snk.air_flange1) annotation(
    Line(points = {{-2, 10}, {18, 10}}, color = {0, 100, 150}));
  connect(src.air_flange1, fan.air_flange1) annotation(
    Line(points = {{-140, 10}, {-118, 10}}, color = {0, 100, 150}));
  connect(fan.air_flange2, AHU.air_flange1) annotation(
    Line(points = {{-102, 10}, {-88, 10}}, color = {0, 100, 150}));
  connect(qcmd.y, fan.qcmd01) annotation(
    Line(points = {{-119, 30}, {-110, 30}, {-110, 14}}, color = {0, 0, 127}));
  connect(spT.y, AHU.Tsp) annotation(
    Line(points = {{-118, 70}, {-94, 70}, {-94, 18}, {-88, 18}}, color = {0, 0, 127}));
  connect(spphi.y, AHU.phisp) annotation(
    Line(points = {{-118, 50}, {-100, 50}, {-100, 16}, {-88, 16}}, color = {0, 0, 127}));
  connect(AHUon.y, AHU.ON) annotation(
    Line(points = {{-100, -12}, {-94, -12}, {-94, 4}, {-88, 4}}, color = {255, 0, 255}));
  connect(V.air_flange1, AHU.air_flange2) annotation(
    Line(points = {{-52, 10}, {-72, 10}}, color = {0, 100, 150}));
  connect(V.air_flange2, dp.air_flange1) annotation(
    Line(points = {{-36, 10}, {-18, 10}}, color = {0, 100, 150}));
protected
  annotation(
    experiment(StartTime = 0, StopTime = 8000, Tolerance = 1e-6, Interval = 0.8),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-300, -200}, {300, 200}})));
end Controlled_AHU_case_001;