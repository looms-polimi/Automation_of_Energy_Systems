within AES.Coursework.Typical_actuation_schemes;

model SplitRange_standard
  extends Icons.CourseworkModel;

  Modelica.Blocks.Continuous.TransferFunction Process(a = {5, 6, 1}, b = {2})  annotation(
    Placement(visible = true, transformation(origin = {128, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction Cfb(a = {5, 0}, b = {5, 1})  annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback fb annotation(
    Placement(visible = true, transformation(origin = {-110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression SP(y = if time < 1 then 0 else sign(sin((time - 1) / 20)))  annotation(
    Placement(visible = true, transformation(origin = {-150, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.ActuationSchemes.SplitRange01 SR(DeadZone = 0.05)  annotation(
    Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add au annotation(
    Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder Act1(T = 0.2, k = 1)  annotation(
    Placement(visible = true, transformation(origin = {50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder Act2(T = 2, k = -0.8)  annotation(
    Placement(visible = true, transformation(origin = {50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(fb.y, Cfb.u) annotation(
    Line(points = {{-101, 10}, {-82, 10}}, color = {0, 0, 127}));
  connect(SP.y, fb.u1) annotation(
    Line(points = {{-139, 10}, {-118, 10}}, color = {0, 0, 127}));
  connect(Process.y, fb.u2) annotation(
    Line(points = {{139, 10}, {160, 10}, {160, -40}, {-110, -40}, {-110, 2}}, color = {0, 0, 127}));
  connect(SR.CSo01_pos, Act1.u) annotation(
    Line(points = {{-18, 16}, {-8, 16}, {-8, 30}, {38, 30}}, color = {0, 0, 127}));
  connect(SR.CSo01_neg, Act2.u) annotation(
    Line(points = {{-18, 4}, {-8, 4}, {-8, -10}, {38, -10}}, color = {0, 0, 127}));
  connect(Act1.y, au.u1) annotation(
    Line(points = {{61, 30}, {70, 30}, {70, 16}, {78, 16}}, color = {0, 0, 127}));
  connect(Act2.y, au.u2) annotation(
    Line(points = {{61, -10}, {70, -10}, {70, 4}, {78, 4}}, color = {0, 0, 127}));
  connect(au.y, Process.u) annotation(
    Line(points = {{101, 10}, {116, 10}}, color = {0, 0, 127}));
  connect(Cfb.y, SR.CSi01) annotation(
    Line(points = {{-58, 10}, {-42, 10}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 300, Tolerance = 1e-6, Interval = 0.6),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end SplitRange_standard;