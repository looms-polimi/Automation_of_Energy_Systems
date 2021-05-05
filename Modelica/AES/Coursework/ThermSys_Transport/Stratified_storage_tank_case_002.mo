within AES.Coursework.ThermSys_Transport;

model Stratified_storage_tank_case_002
  extends AES.Icons.CourseworkModel;
  inner AES.ProcessComponents.Thermal.System_settings.System_liquid system annotation(
    Placement(visible = true, transformation(origin = {-170, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression PhotOn(y = if time < 5000 or time > 6000 then 0.4 else 0.01) annotation(
    Placement(visible = true, transformation(origin = {-62, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression spT(y = 273.15 + 50) annotation(
    Placement(visible = true, transformation(origin = {-122, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.HVAC.StratifiedTank_2zones stank(Abase = 4, H = 5, lcoldstart = 2) annotation(
    Placement(visible = true, transformation(origin = {38, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Pressuriser psrc annotation(
    Placement(visible = true, transformation(origin = {-44, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.HVAC.ControlledLiquidHeater_ideal H annotation(
    Placement(visible = true, transformation(origin = {-76, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression Hon(y = time < 5000 or time > 6000) annotation(
    Placement(visible = true, transformation(origin = {-122, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Pump_volumetric pump_heat annotation(
    Placement(visible = true, transformation(origin = {-40, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.TubeStream tube(dz = 2.5, n = 5) annotation(
    Placement(visible = true, transformation(origin = {110, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.surfTcond_fixed surfTcond(T = 283.15) annotation(
    Placement(visible = true, transformation(origin = {110, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Pump_volumetric pump_circ(w0 = 1.1) annotation(
    Placement(visible = true, transformation(origin = {72, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression PcoldOn(y = 0.4) annotation(
    Placement(visible = true, transformation(origin = {-2, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Pressuriser psrcNoTank annotation(
    Placement(visible = true, transformation(origin = {-24, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.TubeStream tubeNoTank(dz = 2.5, n = 5) annotation(
    Placement(visible = true, transformation(origin = {128, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Pump_volumetric pumpNoTank annotation(
    Placement(visible = true, transformation(origin = {-24, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.HVAC.ControlledLiquidHeater_ideal HnoTank annotation(
    Placement(visible = true, transformation(origin = {-76, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression spTnoTank(y = 273.15 + 40) annotation(
    Placement(visible = true, transformation(origin = {-128, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(spT.y, H.To) annotation(
    Line(points = {{-111, 36}, {-99, 36}, {-99, 35}, {-87, 35}}, color = {0, 0, 127}));
  connect(H.ON, Hon.y) annotation(
    Line(points = {{-88, 24}, {-94, 24}, {-94, 60}, {-111, 60}}, color = {255, 0, 255}));
  connect(stank.coldOut, psrc.pwh_b) annotation(
    Line(points = {{26, 18}, {20, 18}, {20, -8}, {-32, -8}}, color = {46, 52, 54}));
  connect(psrc.pwh_a, H.pwh_a) annotation(
    Line(points = {{-56, -8}, {-92, -8}, {-92, 30}, {-88, 30}}, color = {46, 52, 54}));
  connect(H.pwh_b, pump_heat.pwh_a) annotation(
    Line(points = {{-64, 30}, {-52, 30}}, color = {46, 52, 54}));
  connect(pump_heat.pwh_b, stank.hotIn) annotation(
    Line(points = {{-28, 30}, {26, 30}}, color = {46, 52, 54}));
  connect(PhotOn.y, pump_heat.cmd) annotation(
    Line(points = {{-51, 70}, {-40, 70}, {-40, 38}}, color = {0, 0, 127}));
  connect(surfTcond.surf, tube.surf) annotation(
    Line(points = {{110, 61.3333}, {110, 34.3334}}, color = {144, 5, 5}));
  connect(stank.hotOut, pump_circ.pwh_a) annotation(
    Line(points = {{50, 30}, {60, 30}}, color = {46, 52, 54}));
  connect(pump_circ.pwh_b, tube.pwh_a) annotation(
    Line(points = {{84, 30}, {98, 30}}, color = {46, 52, 54}));
  connect(tube.pwh_b, stank.coldIn) annotation(
    Line(points = {{122, 30}, {162, 30}, {162, 18}, {50, 18}}, color = {46, 52, 54}));
  connect(PcoldOn.y, pump_circ.cmd) annotation(
    Line(points = {{9, 70}, {72, 70}, {72, 38}}, color = {0, 0, 127}));
  connect(Hon.y, HnoTank.ON) annotation(
    Line(points = {{-110, 60}, {-94, 60}, {-94, -44}, {-88, -44}}, color = {255, 0, 255}));
  connect(PhotOn.y, pumpNoTank.cmd) annotation(
    Line(points = {{-50, 70}, {-24, 70}, {-24, -30}}, color = {0, 0, 127}));
  connect(HnoTank.pwh_b, pumpNoTank.pwh_a) annotation(
    Line(points = {{-64, -38}, {-36, -38}}, color = {46, 52, 54}));
  connect(pumpNoTank.pwh_b, tubeNoTank.pwh_a) annotation(
    Line(points = {{-12, -38}, {116, -38}}, color = {46, 52, 54}));
  connect(tubeNoTank.pwh_b, psrcNoTank.pwh_b) annotation(
    Line(points = {{140, -38}, {158, -38}, {158, -80}, {-12, -80}}, color = {46, 52, 54}));
  connect(psrcNoTank.pwh_a, HnoTank.pwh_a) annotation(
    Line(points = {{-36, -80}, {-100, -80}, {-100, -38}, {-88, -38}}, color = {46, 52, 54}));
  connect(surfTcond.surf, tubeNoTank.surf) annotation(
    Line(points = {{110, 62}, {110, 46}, {128, 46}, {128, -32}}, color = {144, 5, 5}));
  connect(spTnoTank.y, HnoTank.To) annotation(
    Line(points = {{-116, -32}, {-88, -32}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 20000, Tolerance = 1e-6, Interval = 2),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})));
end Stratified_storage_tank_case_002;