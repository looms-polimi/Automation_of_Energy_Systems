within AES.Devel_test_models;

model Test_HC_001
  extends Icons.TestModel;
  AES.ProcessComponents.Thermal.DistrictHeating.HeatingCentral HC(w0 = 10)  annotation(
    Placement(visible = true, transformation(origin = {-90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.DistrictHeating.TwinPipe line(L = 1000, kdp = 1, wnom = 5)  annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.surfTcond_prescribed Tload annotation(
    Placement(visible = true, transformation(origin = {30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube tubeload annotation(
    Placement(visible = true, transformation(origin = {30, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Interfaces.pwhPortSplitter split annotation(
    Placement(visible = true, transformation(origin = {-12, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression spT(y = 273.15 + 60)  annotation(
    Placement(visible = true, transformation(origin = {-150, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression spw01(y = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {-150, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression ON(y = true)  annotation(
    Placement(visible = true, transformation(origin = {-150, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression load(y = 298)  annotation(
    Placement(visible = true, transformation(origin = {-30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Pressuriser p annotation(
    Placement(visible = true, transformation(origin = {70, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner AES.ProcessComponents.Thermal.System_settings.System_liquid system annotation(
    Placement(visible = true, transformation(origin = {-170, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner AES.ProcessComponents.Thermal.System_settings.System_terrain terrain annotation(
    Placement(visible = true, transformation(origin = {-130, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(HC.tpwh_a, line.tpwh_a) annotation(
    Line(points = {{-78, 10}, {-62, 10}}));
  connect(line.tpwh_b, split.pwhTwin_HC) annotation(
    Line(points = {{-38, 10}, {-24, 10}}));
  connect(split.pwh_H, tubeload.pwh_a) annotation(
    Line(points = {{0, 16}, {0, 20}, {18, 20}}, color = {46, 52, 54}));
  connect(Tload.surf, tubeload.surf) annotation(
    Line(points = {{30, 42}, {30, 26}}, color = {144, 5, 5}));
  connect(ON.y, HC.ON) annotation(
    Line(points = {{-139, 4}, {-102, 4}}, color = {255, 0, 255}));
  connect(spT.y, HC.spTfo) annotation(
    Line(points = {{-138, 36}, {-120, 36}, {-120, 16}, {-102, 16}}, color = {0, 0, 127}));
  connect(spw01.y, HC.spw01) annotation(
    Line(points = {{-138, 20}, {-128, 20}, {-128, 10}, {-102, 10}}, color = {0, 0, 127}));
  connect(load.y, Tload.T) annotation(
    Line(points = {{-18, 50}, {22, 50}}, color = {0, 0, 127}));
  connect(tubeload.pwh_b, p.pwh_a) annotation(
    Line(points = {{42, 20}, {58, 20}}, color = {46, 52, 54}));
  connect(p.pwh_b, split.pwh_C) annotation(
    Line(points = {{82, 20}, {92, 20}, {92, 4}, {0, 4}}, color = {46, 52, 54}));
  annotation(
    experiment(StartTime = 0, StopTime = 100000, Tolerance = 1e-6, Interval = 1000),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})));
end Test_HC_001;