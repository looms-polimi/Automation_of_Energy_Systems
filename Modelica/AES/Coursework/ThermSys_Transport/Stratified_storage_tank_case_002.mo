within AES.Coursework.ThermSys_Transport;

model Stratified_storage_tank_case_002
  extends AES.Icons.CourseworkModel;
  inner AES.ProcessComponents.Thermal.System_settings.System_liquid system annotation(
    Placement(visible = true, transformation(origin = {-130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression PhotOn(y = if time < 5000 or time > 6000 then 0.4 else 0.01) annotation(
    Placement(visible = true, transformation(origin = {-80, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression spT(y = 273.15 + 50) annotation(
    Placement(visible = true, transformation(origin = {-130, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.HVAC.StratifiedTank_2zones stank(Abase = 4, H = 5, lcoldstart = 4.5) annotation(
    Placement(visible = true, transformation(origin = {10, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Pressuriser psrc annotation(
    Placement(visible = true, transformation(origin = {-50, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.HVAC.ControlledLiquidHeater_ideal H annotation(
    Placement(visible = true, transformation(origin = {-80, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression Hon(y = time < 5000 or time > 6000) annotation(
    Placement(visible = true, transformation(origin = {-130, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Pump_volumetric pump_heat annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.TubeStream tube(dz = 2.5, n = 5) annotation(
    Placement(visible = true, transformation(origin = {84, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.surfTcond_fixed surfTcond(T = 283.15) annotation(
    Placement(visible = true, transformation(origin = {84, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Pump_volumetric pump_circ(w0 = 1.1) annotation(
    Placement(visible = true, transformation(origin = {50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression PcoldOn(y = 0.4) annotation(
    Placement(visible = true, transformation(origin = {10, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Pressuriser psrcNoTank annotation(
    Placement(visible = true, transformation(origin = {30, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.TubeStream tubeNoTank(dz = 2.5, n = 5) annotation(
    Placement(visible = true, transformation(origin = {110, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Pump_volumetric pumpNoTank annotation(
    Placement(visible = true, transformation(origin = {-30, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.HVAC.ControlledLiquidHeater_ideal HnoTank annotation(
    Placement(visible = true, transformation(origin = {-80, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression spTnoTank(y = 273.15 + 40) annotation(
    Placement(visible = true, transformation(origin = {-130, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(spT.y, H.To) annotation(
    Line(points = {{-119, 36}, {-92, 36}}, color = {0, 0, 127}));
  connect(H.ON, Hon.y) annotation(
    Line(points = {{-92, 24}, {-108, 24}, {-108, 60}, {-119, 60}}, color = {255, 0, 255}));
  connect(stank.coldOut, psrc.pwh_b) annotation(
    Line(points = {{-2, 18}, {-14, 18}, {-14, 0}, {-38, 0}}, color = {46, 52, 54}));
  connect(psrc.pwh_a, H.pwh_a) annotation(
    Line(points = {{-62, 0}, {-100, 0}, {-100, 30}, {-92, 30}}, color = {46, 52, 54}));
  connect(H.pwh_b, pump_heat.pwh_a) annotation(
    Line(points = {{-68, 30}, {-62, 30}}, color = {46, 52, 54}));
  connect(pump_heat.pwh_b, stank.hotIn) annotation(
    Line(points = {{-38, 30}, {-2, 30}}, color = {46, 52, 54}));
  connect(PhotOn.y, pump_heat.cmd) annotation(
    Line(points = {{-69, 60}, {-50, 60}, {-50, 38}}, color = {0, 0, 127}));
  connect(surfTcond.surf, tube.surf) annotation(
    Line(points = {{84, 53}, {84, 35}}, color = {144, 5, 5}));
  connect(stank.hotOut, pump_circ.pwh_a) annotation(
    Line(points = {{22, 30}, {38, 30}}, color = {46, 52, 54}));
  connect(pump_circ.pwh_b, tube.pwh_a) annotation(
    Line(points = {{62, 30}, {72, 30}}, color = {46, 52, 54}));
  connect(tube.pwh_b, stank.coldIn) annotation(
    Line(points = {{96, 30}, {104, 30}, {104, 18}, {22, 18}}, color = {46, 52, 54}));
  connect(PcoldOn.y, pump_circ.cmd) annotation(
    Line(points = {{21, 60}, {50, 60}, {50, 38}}, color = {0, 0, 127}));
  connect(Hon.y, HnoTank.ON) annotation(
    Line(points = {{-119, 60}, {-108, 60}, {-108, -44}, {-92, -44}}, color = {255, 0, 255}));
  connect(PhotOn.y, pumpNoTank.cmd) annotation(
    Line(points = {{-69, 60}, {-30, 60}, {-30, -30}}, color = {0, 0, 127}));
  connect(HnoTank.pwh_b, pumpNoTank.pwh_a) annotation(
    Line(points = {{-68, -38}, {-42, -38}}, color = {46, 52, 54}));
  connect(pumpNoTank.pwh_b, tubeNoTank.pwh_a) annotation(
    Line(points = {{-18, -38}, {98, -38}}, color = {46, 52, 54}));
  connect(tubeNoTank.pwh_b, psrcNoTank.pwh_b) annotation(
    Line(points = {{122, -38}, {128, -38}, {128, -68}, {42, -68}}, color = {46, 52, 54}));
  connect(psrcNoTank.pwh_a, HnoTank.pwh_a) annotation(
    Line(points = {{18, -68}, {-100, -68}, {-100, -38}, {-92, -38}}, color = {46, 52, 54}));
  connect(surfTcond.surf, tubeNoTank.surf) annotation(
    Line(points = {{84, 53}, {84, 46}, {110, 46}, {110, -33}}, color = {144, 5, 5}));
  connect(spTnoTank.y, HnoTank.To) annotation(
    Line(points = {{-119, -32}, {-92, -32}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 20000, Tolerance = 1e-6, Interval = 2),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})));
end Stratified_storage_tank_case_002;