within AES.Coursework.Typical_actuation_schemes;

model SplitRange_cascadeLoops
  extends Icons.CourseworkModel;

  Modelica.Blocks.Continuous.TransferFunction Process(a = {5, 6, 1}, b = {2})  annotation(
    Placement(visible = true, transformation(origin = {154, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction Cfb(a = {5, 0}, b = {5, 1})  annotation(
    Placement(visible = true, transformation(origin = {-100, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback fb annotation(
    Placement(visible = true, transformation(origin = {-130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression SP(y = if time < 1 then 0 else sign(sin((time - 1) / 20)))  annotation(
    Placement(visible = true, transformation(origin = {-170, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.ActuationSchemes.SplitRange01 SR(DeadZone = 0.05)  annotation(
    Placement(visible = true, transformation(origin = {-62, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add au annotation(
    Placement(visible = true, transformation(origin = {114, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder Act1(T = 0.2, k = 1)  annotation(
    Placement(visible = true, transformation(origin = {70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder Act2(T = 4, k = -0.8)  annotation(
    Placement(visible = true, transformation(origin = {70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction CA2(a = {1, 0}, b = -2 / 0.8 * {2, 1}) annotation(
    Placement(visible = true, transformation(origin = {32, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction CA1(a = {1, 0}, b = 2 * {0.2, 1}) annotation(
    Placement(visible = true, transformation(origin = {32, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback fbA2 annotation(
    Placement(visible = true, transformation(origin = {0, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback fbA1 annotation(
    Placement(visible = true, transformation(origin = {0, 30}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain m1(k = -1)  annotation(
    Placement(visible = true, transformation(origin = {-24, -10}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
equation
  connect(fb.y, Cfb.u) annotation(
    Line(points = {{-121, 10}, {-112, 10}}, color = {0, 0, 127}));
  connect(SP.y, fb.u1) annotation(
    Line(points = {{-159, 10}, {-138, 10}}, color = {0, 0, 127}));
  connect(Process.y, fb.u2) annotation(
    Line(points = {{165, 10}, {180, 10}, {180, -40}, {-130, -40}, {-130, 2}}, color = {0, 0, 127}));
  connect(Act1.y, au.u1) annotation(
    Line(points = {{81, 30}, {90, 30}, {90, 16}, {102, 16}}, color = {0, 0, 127}));
  connect(Act2.y, au.u2) annotation(
    Line(points = {{81, -10}, {90, -10}, {90, 4}, {102, 4}}, color = {0, 0, 127}));
  connect(au.y, Process.u) annotation(
    Line(points = {{125, 10}, {141, 10}}, color = {0, 0, 127}));
  connect(Cfb.y, SR.CSi01) annotation(
    Line(points = {{-89, 10}, {-74, 10}}, color = {0, 0, 127}));
  connect(fbA1.y, CA1.u) annotation(
    Line(points = {{10, 30}, {20, 30}}, color = {0, 0, 127}));
  connect(fbA2.y, CA2.u) annotation(
    Line(points = {{10, -10}, {20, -10}}, color = {0, 0, 127}));
  connect(CA2.y, Act2.u) annotation(
    Line(points = {{44, -10}, {58, -10}}, color = {0, 0, 127}));
  connect(Act1.y, fbA1.u2) annotation(
    Line(points = {{81, 30}, {90, 30}, {90, 50}, {0, 50}, {0, 38}}, color = {0, 0, 127}));
  connect(Act2.y, fbA2.u2) annotation(
    Line(points = {{82, -10}, {90, -10}, {90, -30}, {0, -30}, {0, -18}}, color = {0, 0, 127}));
  connect(SR.CSo01_pos, fbA1.u1) annotation(
    Line(points = {{-50, 16}, {-40, 16}, {-40, 30}, {-8, 30}}, color = {0, 0, 127}));
  connect(SR.CSo01_neg, m1.u) annotation(
    Line(points = {{-50, 4}, {-40, 4}, {-40, -10}, {-32, -10}}, color = {0, 0, 127}));
  connect(m1.y, fbA2.u1) annotation(
    Line(points = {{-18, -10}, {-8, -10}}, color = {0, 0, 127}));
  connect(CA1.y, Act1.u) annotation(
    Line(points = {{43, 30}, {58, 30}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 300, Tolerance = 1e-6, Interval = 0.6),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end SplitRange_cascadeLoops;