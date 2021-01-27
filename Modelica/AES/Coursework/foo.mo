within AES.Coursework;

model foo
  Modelica.Blocks.Sources.RealExpression w(y = if time < 1 then 0 else 1)  annotation(
    Placement(visible = true, transformation(origin = {-116, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.DigitalControllers.PI_awfb_basic PI1(CSmax = 3, CSmin = 0, K = 5, Ti = 2)  annotation(
    Placement(visible = true, transformation(origin = {-18, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.DigitalControllers.PI_irfb_basic PI2(CSmax = 3, CSmin = 0, K = 5, Ti = 2)  annotation(
    Placement(visible = true, transformation(origin = {-26, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder P1(T = 5, k = 1)  annotation(
    Placement(visible = true, transformation(origin = {36, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder P2(T = 5, k = 1)  annotation(
    Placement(visible = true, transformation(origin = {30, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression zero annotation(
    Placement(visible = true, transformation(origin = {-92, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression f annotation(
    Placement(visible = true, transformation(origin = {-90, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(PI1.CS, P1.u) annotation(
    Line(points = {{-6, 40}, {24, 40}}, color = {0, 0, 127}));
  connect(P1.y, PI1.PV) annotation(
    Line(points = {{48, 40}, {56, 40}, {56, 22}, {-38, 22}, {-38, 36}, {-30, 36}}, color = {0, 0, 127}));
  connect(PI2.CS, P2.u) annotation(
    Line(points = {{-16, -10}, {18, -10}}, color = {0, 0, 127}));
  connect(P2.y, PI2.PV) annotation(
    Line(points = {{42, -10}, {48, -10}, {48, -30}, {-42, -30}, {-42, -8}, {-36, -8}}, color = {0, 0, 127}));
  connect(f.y, PI2.TS) annotation(
    Line(points = {{-78, -40}, {-66, -40}, {-66, -12}, {-36, -12}}, color = {255, 0, 255}));
  connect(zero.y, PI2.TR) annotation(
    Line(points = {{-80, -14}, {-70, -14}, {-70, -16}, {-36, -16}}, color = {0, 0, 127}));
  connect(zero.y, PI2.Bias) annotation(
    Line(points = {{-80, -14}, {-68, -14}, {-68, 16}, {-26, 16}, {-26, 0}}, color = {0, 0, 127}));
  connect(w.y, PI1.SP) annotation(
    Line(points = {{-104, 44}, {-66, 44}, {-66, 46}, {-30, 46}}, color = {0, 0, 127}));
  connect(w.y, PI2.SP) annotation(
    Line(points = {{-104, 44}, {-80, 44}, {-80, -4}, {-36, -4}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-6, Interval = 0.0333333),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=aliasConflicts ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end foo;