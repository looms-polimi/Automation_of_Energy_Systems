within AES.Devel_test_models;

model Test_HP_002
  extends Icons.TestModel;
  Modelica.Blocks.Sources.RealExpression iTc(y = 273.15 + 20) annotation(
    Placement(visible = true, transformation(origin = {-94, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.HVAC.HP_CarnotFractionCOPh HP(Wmax = 500)  annotation(
    Placement(visible = true, transformation(origin = {-10, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature Tc annotation(
    Placement(visible = true, transformation(origin = {-28, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression cmdHP(y = 0.5) annotation(
    Placement(visible = true, transformation(origin = {-170, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Pressuriser pressuriser annotation(
    Placement(visible = true, transformation(origin = {-92, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Pump_centrifugal pump(dpn0 = 200000)  annotation(
    Placement(visible = true, transformation(origin = {-50, 70}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube tubeH(Di = 0.02, L = 1, t = 0.001)  annotation(
    Placement(visible = true, transformation(origin = {-10, 70}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube tubeC(Di = 0.02, L = 1, t = 0.001)  annotation(
    Placement(visible = true, transformation(origin = {-10, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube tubeLoad(Di = 0.02, L = 1, t = 0.001)  annotation(
    Placement(visible = true, transformation(origin = {48, -30}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression cmdP(y = 0.5) annotation(
    Placement(visible = true, transformation(origin = {-170, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.VectorHPtoHP_conductor adapLoad(Gtotal = 500)  annotation(
    Placement(visible = true, transformation(origin = {12, -70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  AES.ProcessComponents.Thermal.Liquid.VectorHPtoHP_conductor adapH(Gtotal = 100)  annotation(
    Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.VectorHPtoHP_conductor adapC annotation(
    Placement(visible = true, transformation(origin = {-48, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
equation
  connect(tubeC.pwh_b, pressuriser.pwh_a) annotation(
    Line(points = {{-22, -30}, {-116, -30}, {-116, 70}, {-104, 70}}, color = {46, 52, 54}));
  connect(pressuriser.pwh_b, pump.pwh_a) annotation(
    Line(points = {{-80, 70}, {-62, 70}}, color = {46, 52, 54}));
  connect(pump.pwh_b, tubeH.pwh_a) annotation(
    Line(points = {{-38, 70}, {-22, 70}}, color = {46, 52, 54}));
  connect(tubeH.pwh_b, tubeLoad.pwh_a) annotation(
    Line(points = {{2, 70}, {84, 70}, {84, -30}, {60, -30}}, color = {46, 52, 54}));
  connect(tubeC.pwh_a, tubeLoad.pwh_b) annotation(
    Line(points = {{2, -30}, {36, -30}}, color = {46, 52, 54}));
  connect(Tc.port, adapLoad.HP) annotation(
    Line(points = {{-18, -70}, {8, -70}}, color = {191, 0, 0}));
  connect(adapLoad.vectorHP, tubeLoad.surf) annotation(
    Line(points = {{16, -70}, {48, -70}, {48, -36}}, color = {144, 5, 5}));
  connect(Tc.T, iTc.y) annotation(
    Line(points = {{-40, -70}, {-82, -70}}, color = {0, 0, 127}));
  connect(cmdHP.y, HP.cmd01) annotation(
    Line(points = {{-158, 20}, {-18, 20}}, color = {0, 0, 127}));
  connect(cmdP.y, pump.cmd) annotation(
    Line(points = {{-158, 40}, {-50, 40}, {-50, 62}}, color = {0, 0, 127}));
  connect(HP.hotPort, adapH.HP) annotation(
    Line(points = {{-10, 30}, {-10, 46}}, color = {191, 0, 0}));
  connect(adapH.vectorHP, tubeH.surf) annotation(
    Line(points = {{-10, 54}, {-10, 64}}, color = {144, 5, 5}));
  connect(HP.coldPort, adapC.HP) annotation(
    Line(points = {{-10, 12}, {-48, 12}, {-48, 0}}, color = {191, 0, 0}));
  connect(adapC.vectorHP, tubeC.surf) annotation(
    Line(points = {{-48, -8}, {-40, -8}, {-40, -24}, {-10, -24}}, color = {144, 5, 5}));
  annotation(
    experiment(StartTime = 0, StopTime = 10000, Tolerance = 1e-6, Interval = 1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})));
end Test_HP_002;