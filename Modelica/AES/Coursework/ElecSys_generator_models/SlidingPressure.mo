within AES.Coursework.ElecSys_generator_models;

model SlidingPressure
  extends Icons.CourseworkModel;
  Modelica.Blocks.Continuous.FirstOrder F(T = 10, k = 1)  annotation(
    Placement(visible = true, transformation(origin = {-30, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator S(k = 1 / 100)  annotation(
    Placement(visible = true, transformation(origin = {50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder T(T = 1, k = 1)  annotation(
    Placement(visible = true, transformation(origin = {-30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback ifb annotation(
    Placement(visible = true, transformation(origin = {10, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add ia annotation(
    Placement(visible = true, transformation(origin = {90, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.LimPID PIp(Ti = 100, controllerType = .Modelica.Blocks.Types.SimpleController.PI, k = 1, yMax = 1, yMin = 0)  annotation(
    Placement(visible = true, transformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression spp(y = if time < 1000 then 0.75 else 0.8)  annotation(
    Placement(visible = true, transformation(origin = {-130, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression thetat(y = 1)  annotation(
    Placement(visible = true, transformation(origin = {-130, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(F.y, ifb.u1) annotation(
    Line(points = {{-19, -10}, {2, -10}}, color = {0, 0, 127}));
  connect(ifb.y, S.u) annotation(
    Line(points = {{19, -10}, {38, -10}}, color = {0, 0, 127}));
  connect(S.y, ia.u2) annotation(
    Line(points = {{61, -10}, {78, -10}}, color = {0, 0, 127}));
  connect(T.y, ia.u1) annotation(
    Line(points = {{-19, 30}, {65, 30}, {65, 2}, {78, 2}}, color = {0, 0, 127}));
  connect(spp.y, PIp.u_s) annotation(
    Line(points = {{-119, 30}, {-102, 30}}, color = {0, 0, 127}));
  connect(PIp.y, F.u) annotation(
    Line(points = {{-79, 30}, {-61, 30}, {-61, -10}, {-42, -10}}, color = {0, 0, 127}));
  connect(thetat.y, T.u) annotation(
    Line(points = {{-118, 70}, {-50, 70}, {-50, 30}, {-42, 30}}, color = {0, 0, 127}));
  connect(ia.y, ifb.u2) annotation(
    Line(points = {{102, -4}, {120, -4}, {120, -40}, {10, -40}, {10, -18}}, color = {0, 0, 127}));
  connect(ia.y, PIp.u_m) annotation(
    Line(points = {{102, -4}, {120, -4}, {120, -60}, {-90, -60}, {-90, 18}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    version = "",
    uses(Modelica(version = "3.2.3")),
  experiment(StartTime = 0, StopTime = 2000, Tolerance = 1e-6, Interval = 4),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end SlidingPressure;
