within AES.Devel_test_models;

model Test_liquid_mixing_streams
  extends Icons.TestModel;
  AES.ProcessComponents.Thermal.Liquid.Node_wT_prescribed src1 annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Node_wT_fixed src2 annotation(
    Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Node_pT_fixed snk(T = 283.15)  annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression w1(y = if sin(time) > 0 then 0.2 else -0.2)  annotation(
    Placement(visible = true, transformation(origin = {-130, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression T1(y = if sin(time / 5) > 0 then 313.15 else 273.15)  annotation(
    Placement(visible = true, transformation(origin = {-130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.Liquid.Header H(V = 0.001)  annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(w1.y, src1.w) annotation(
    Line(points = {{-118, 50}, {-102, 50}, {-102, 36}, {-80, 36}}, color = {0, 0, 127}));
  connect(T1.y, src1.T) annotation(
    Line(points = {{-118, 10}, {-100, 10}, {-100, 24}, {-80, 24}}, color = {0, 0, 127}));
  connect(src1.pwh_a, H.pwh_a) annotation(
    Line(points = {{-58, 30}, {-40, 30}, {-40, 0}, {-12, 0}}, color = {46, 52, 54}));
  connect(src2.pwh_a, H.pwh_a) annotation(
    Line(points = {{-58, -30}, {-40, -30}, {-40, 0}, {-12, 0}}, color = {46, 52, 54}));
  connect(H.pwh_b, snk.pwh_a) annotation(
    Line(points = {{12, 0}, {38, 0}}, color = {46, 52, 54}));

annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-6, Interval = 0.2),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end Test_liquid_mixing_streams;