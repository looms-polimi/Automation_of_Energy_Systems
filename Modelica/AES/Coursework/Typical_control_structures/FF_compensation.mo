within AES.Coursework.Typical_control_structures;

model FF_compensation
  extends Icons.CourseworkModel;
  Modelica.Blocks.Continuous.FirstOrder M(T = 0.2, k = 1) annotation(
    Placement(visible = true, transformation(origin = {20, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression SP(y = if time < 10 then 0 else 0.5) annotation(
    Placement(visible = true, transformation(origin = {-112, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression D(y = if time < 60 then 0 else 0.2) annotation(
    Placement(visible = true, transformation(origin = {-50, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction C(a = {0.1, 1}, b = {-1}) annotation(
    Placement(visible = true, transformation(origin = {-20, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction P(a = {10, 1}, b = {1}) annotation(
    Placement(visible = true, transformation(origin = {110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add ad annotation(
    Placement(visible = true, transformation(origin = {70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_full PI(K = 4, Ti = 6, hasBias = true)  annotation(
    Placement(visible = true, transformation(origin = {-50, -10}, extent = {{-10, -20}, {10, 20}}, rotation = 0)));
equation
  connect(C.u, M.y) annotation(
    Line(points = {{-8, 50}, {9, 50}}, color = {0, 0, 127}));
  connect(D.y, M.u) annotation(
    Line(points = {{-38, 80}, {50, 80}, {50, 50}, {32, 50}}, color = {0, 0, 127}));
  connect(D.y, ad.u1) annotation(
    Line(points = {{-38, 80}, {50, 80}, {50, 16}, {58, 16}, {58, 16}}, color = {0, 0, 127}));
  connect(ad.y, P.u) annotation(
    Line(points = {{81, 10}, {98, 10}}, color = {0, 0, 127}));
  connect(PI.CS, ad.u2) annotation(
    Line(points = {{-40, 4}, {58, 4}}, color = {0, 0, 127}));
  connect(C.y, PI.Bias) annotation(
    Line(points = {{-30, 50}, {-50, 50}, {-50, 10}}, color = {0, 0, 127}));
  connect(SP.y, PI.SP) annotation(
    Line(points = {{-100, 4}, {-60, 4}}, color = {0, 0, 127}));
  connect(P.y, PI.PV) annotation(
    Line(points = {{122, 10}, {140, 10}, {140, -60}, {-80, -60}, {-80, 0}, {-60, 0}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-6, Interval = 0.2),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end FF_compensation;