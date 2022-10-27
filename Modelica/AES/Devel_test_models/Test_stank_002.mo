within AES.Devel_test_models;

model Test_stank_002
  extends Icons.TestModel;
  inner AES.ProcessComponents.Thermal.System_settings.System_liquid system annotation(
    Placement(visible = true, transformation(origin = {-170, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression pi(y = if time < 5000 then 0.5 else 0.01) annotation(
    Placement(visible = true, transformation(origin = {-110, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression x(y = 273.15 + 50) annotation(
    Placement(visible = true, transformation(origin = {-176, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.HVAC.StratifiedTank_2zones stank(Abase = 4, H = 5, lcoldstart = 2) annotation(
    Placement(visible = true, transformation(origin = {-10, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Pressuriser psrc annotation(
    Placement(visible = true, transformation(origin = {-72, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.HVAC.ControlledLiquidHeater_ideal H annotation(
    Placement(visible = true, transformation(origin = {-124, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression Hon(y = true) annotation(
    Placement(visible = true, transformation(origin = {-160, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Pump_volumetric pump_heat annotation(
    Placement(visible = true, transformation(origin = {-88, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.Liquid.TubeStream tube(dz = 2.5, n = 5) annotation(
    Placement(visible = true, transformation(origin = {62, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.Liquid.surfTcond_fixed surfTcond(T = 283.15) annotation(
    Placement(visible = true, transformation(origin = {62, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Pump_volumetric pump_circ(w0 = 1.1) annotation(
    Placement(visible = true, transformation(origin = {24, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(x.y, H.To) annotation(
    Line(points = {{-165, 6}, {-147, 6}, {-147, -5}, {-135, -5}}, color = {0, 0, 127}));
  connect(H.ON, Hon.y) annotation(
    Line(points = {{-134, -2}, {-140, -2}, {-140, 46}, {-148, 46}}, color = {255, 0, 255}));
  connect(stank.coldOut, psrc.pwh_b) annotation(
    Line(points = {{-22, -22}, {-28, -22}, {-28, -52}, {-60, -52}}, color = {46, 52, 54}));
  connect(psrc.pwh_a, H.pwh_a) annotation(
    Line(points = {{-84, -52}, {-140, -52}, {-140, -10}, {-136, -10}}, color = {46, 52, 54}));
  connect(H.pwh_b, pump_heat.pwh_a) annotation(
    Line(points = {{-112, -10}, {-100, -10}}, color = {46, 52, 54}));
  connect(pump_heat.pwh_b, stank.hotIn) annotation(
    Line(points = {{-76, -10}, {-22, -10}}, color = {46, 52, 54}));
  connect(pi.y, pump_heat.cmd) annotation(
    Line(points = {{-98, 26}, {-88, 26}, {-88, -2}}, color = {0, 0, 127}));
  connect(surfTcond.surf, tube.surf) annotation(
    Line(points = {{62, 21.3333}, {62, -5.66664}}, color = {144, 5, 5}));
  connect(stank.hotOut, pump_circ.pwh_a) annotation(
    Line(points = {{2, -10}, {12, -10}}, color = {46, 52, 54}));
  connect(pump_circ.pwh_b, tube.pwh_a) annotation(
    Line(points = {{36, -10}, {50, -10}}, color = {46, 52, 54}));
  connect(tube.pwh_b, stank.coldIn) annotation(
    Line(points = {{74, -10}, {86, -10}, {86, -22}, {2, -22}}, color = {46, 52, 54}));
  connect(pi.y, pump_circ.cmd) annotation(
    Line(points = {{-98, 26}, {24, 26}, {24, -2}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 10000, Tolerance = 1e-06, Interval = 1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})));
end Test_stank_002;