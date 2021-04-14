within AES.Coursework.Typical_control_structures;

model Decoupling
  extends Icons.CourseworkModel;
  AES.ProcessBlocks.TITO_rational_zeroInit P annotation(
    Placement(visible = true, transformation(origin = {72, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.TITOdecoupler_zeroInit D(Fcs1d = {1}, Fcs2d = {1})  annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression SP1(y = if time < 1 then 0 else 0.5)  annotation(
    Placement(visible = true, transformation(origin = {-110, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression SP2(y = if time < 10 then 0 else 0.5)  annotation(
    Placement(visible = true, transformation(origin = {-110, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_full C1(K = 4, hasBias = true)  annotation(
    Placement(visible = true, transformation(origin = {-30, 50}, extent = {{-10, 20}, {10, -20}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_full C2(K = 4, Ti = 1.2, hasBias = true)  annotation(
    Placement(visible = true, transformation(origin = {-30, -30}, extent = {{-10, -20}, {10, 20}}, rotation = 0)));
equation
  connect(D.CS2, P.u2) annotation(
    Line(points = {{40, 6}, {62, 6}}, color = {0, 0, 127}));
  connect(D.CS1, P.u1) annotation(
    Line(points = {{40, 14}, {62, 14}}, color = {0, 0, 127}));
  connect(C2.CS, D.CSfromC2) annotation(
    Line(points = {{-20, -16}, {0, -16}, {0, 2}, {20, 2}}, color = {0, 0, 127}));
  connect(C1.CS, D.CSfromC1) annotation(
    Line(points = {{-20, 36}, {0, 36}, {0, 18}, {20, 18}}, color = {0, 0, 127}));
  connect(D.BiasToC1, C1.Bias) annotation(
    Line(points = {{20, 14}, {-30, 14}, {-30, 30}}, color = {0, 0, 127}));
  connect(D.BiasToC2, C2.Bias) annotation(
    Line(points = {{20, 6}, {-30, 6}, {-30, -10}}, color = {0, 0, 127}));
  connect(P.y1, C1.PV) annotation(
    Line(points = {{82, 14}, {100, 14}, {100, 90}, {-60, 90}, {-60, 40}, {-40, 40}}, color = {0, 0, 127}));
  connect(P.y2, C2.PV) annotation(
    Line(points = {{82, 6}, {100, 6}, {100, -70}, {-60, -70}, {-60, -20}, {-40, -20}}, color = {0, 0, 127}));
  connect(SP1.y, C1.SP) annotation(
    Line(points = {{-99, 36}, {-40, 36}}, color = {0, 0, 127}));
  connect(SP2.y, C2.SP) annotation(
    Line(points = {{-99, -16}, {-40, -16}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-6, Interval = 0.04),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end Decoupling;