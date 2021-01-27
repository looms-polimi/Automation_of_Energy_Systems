within AES.Coursework.Tuning_brushup;

model MSL_loop_2dof_noise
  extends Icons.CourseworkModel;

  Modelica.Blocks.Continuous.TransferFunction Process(a = {5, 6, 1}, b = {1})  annotation(
    Placement(visible = true, transformation(origin = {70, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction Cfb(a = {5, 0}, b = 4 * {5, 1})  annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add ald annotation(
    Placement(visible = true, transformation(origin = {30, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback fb annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression SP(y = if time < 1 then 0 else 1)  annotation(
    Placement(visible = true, transformation(origin = {-130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression LD(y = if time < 30 then 0 else 0.2)  annotation(
    Placement(visible = true, transformation(origin = {-130, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction Fn(a = {0.2, 1}, b = {1}) annotation(
    Placement(visible = true, transformation(origin = {-10, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Noise.TruncatedNormalNoise noise(samplePeriod = 0.1, useAutomaticLocalSeed = true, useGlobalSeed = true, y_max = 0.05, y_min = -0.05) annotation(
    Placement(visible = true, transformation(origin = {90, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add an annotation(
    Placement(visible = true, transformation(origin = {50, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction Cff annotation(
    Placement(visible = true, transformation(origin = {-90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Cfb.y, ald.u2) annotation(
    Line(points = {{1, 10}, {18, 10}}, color = {0, 0, 127}));
  connect(ald.y, Process.u) annotation(
    Line(points = {{41, 16}, {57, 16}}, color = {0, 0, 127}));
  connect(fb.y, Cfb.u) annotation(
    Line(points = {{-40, 10}, {-22, 10}}, color = {0, 0, 127}));
  connect(LD.y, ald.u1) annotation(
    Line(points = {{-119, 40}, {10, 40}, {10, 22}, {18, 22}}, color = {0, 0, 127}));
  connect(Fn.y, fb.u2) annotation(
    Line(points = {{-20, -30}, {-50, -30}, {-50, 2}}, color = {0, 0, 127}));
  connect(an.u2, noise.y) annotation(
    Line(points = {{62, -36}, {72, -36}, {72, -50}, {79, -50}}, color = {0, 0, 127}));
  connect(an.y, Fn.u) annotation(
    Line(points = {{40, -30}, {2, -30}}, color = {0, 0, 127}));
  connect(Process.y, an.u1) annotation(
    Line(points = {{82, 16}, {100, 16}, {100, -24}, {62, -24}}, color = {0, 0, 127}));
  connect(Cff.y, fb.u1) annotation(
    Line(points = {{-78, 10}, {-58, 10}}, color = {0, 0, 127}));
  connect(SP.y, Cff.u) annotation(
    Line(points = {{-118, 10}, {-102, 10}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-6, Interval = 0.12),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=aliasConflicts ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end MSL_loop_2dof_noise;