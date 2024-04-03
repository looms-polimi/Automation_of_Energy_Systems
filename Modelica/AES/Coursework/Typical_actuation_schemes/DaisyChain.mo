within AES.Coursework.Typical_actuation_schemes;

model DaisyChain
  extends Icons.CourseworkModel;
  Modelica.Blocks.Continuous.TransferFunction Process(a = {5, 6, 1}, b = {2})  annotation(
    Placement(visible = true, transformation(origin = {130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction Cfb(a = {5, 0}, b = {5, 1})  annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback fb annotation(
    Placement(visible = true, transformation(origin = {-110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression SP(y = if time < 1 then 0 else 1.5 + 0.5 * sign(sin((time - 1) / 20)))  annotation(
    Placement(visible = true, transformation(origin = {-150, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add au annotation(
    Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder Act1(T = 0.2, k = 1)  annotation(
    Placement(transformation(origin = {50, 30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.FirstOrder Act2(T = 0.7, k = 0.8)  annotation(
    Placement(visible = true, transformation(origin = {50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.ActuationSchemes.DaisyChain_uniform DC annotation(
    Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(fb.y, Cfb.u) annotation(
    Line(points = {{-101, 10}, {-82, 10}}, color = {0, 0, 127}));
  connect(SP.y, fb.u1) annotation(
    Line(points = {{-139, 10}, {-118, 10}}, color = {0, 0, 127}));
  connect(Process.y, fb.u2) annotation(
    Line(points = {{141, 10}, {160, 10}, {160, -40}, {-110, -40}, {-110, 2}}, color = {0, 0, 127}));
  connect(Act1.y, au.u1) annotation(
    Line(points = {{61, 30}, {70, 30}, {70, 16}, {78, 16}}, color = {0, 0, 127}));
  connect(Act2.y, au.u2) annotation(
    Line(points = {{61, -10}, {70, -10}, {70, 4}, {78, 4}}, color = {0, 0, 127}));
  connect(au.y, Process.u) annotation(
    Line(points = {{101, 10}, {117, 10}}, color = {0, 0, 127}));
  connect(DC.CSo01[1], Act1.u) annotation(
    Line(points = {{-18, 10}, {20, 10}, {20, 30}, {38, 30}}, color = {0, 0, 127}));
  connect(Cfb.y, DC.CSi01) annotation(
    Line(points = {{-58, 10}, {-42, 10}}, color = {0, 0, 127}));
  connect(DC.CSo01[2], Act2.u) annotation(
    Line(points = {{-18, 10}, {20, 10}, {20, -10}, {38, -10}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 300, Tolerance = 1e-6, Interval = 0.6),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end DaisyChain;