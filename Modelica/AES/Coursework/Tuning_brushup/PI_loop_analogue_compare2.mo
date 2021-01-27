within AES.Coursework.Tuning_brushup;

model PI_loop_analogue_compare2
  extends Icons.CourseworkModel;

  Modelica.Blocks.Continuous.TransferFunction Process_1(a = {100, 101, 1}, b = {10, 1})  annotation(
    Placement(visible = true, transformation(origin = {30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add ald_1 annotation(
    Placement(visible = true, transformation(origin = {-10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression SP(y = if time < 1 then 0 else 1)  annotation(
    Placement(visible = true, transformation(origin = {-130, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression LD(y = if time < 60 then 0 else 5)  annotation(
    Placement(visible = true, transformation(origin = {-130, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_basic PI_1(CSmax = 5, CSmin = -5, K = 100, Ti = 100)  annotation(
    Placement(visible = true, transformation(origin = {-52, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add ald_2 annotation(
    Placement(visible = true, transformation(origin = {-10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction Process_2(a = {100, 101, 1}, b = {10, 1}) annotation(
    Placement(visible = true, transformation(origin = {30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_basic PI_2(CSmax = 5, CSmin = -5, K = 10, Ti = 1) annotation(
    Placement(visible = true, transformation(origin = {-52, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ald_1.y, Process_1.u) annotation(
    Line(points = {{1, 30}, {17, 30}}, color = {0, 0, 127}));
  connect(LD.y, ald_1.u1) annotation(
    Line(points = {{-119, 54}, {-30, 54}, {-30, 36}, {-22, 36}}, color = {0, 0, 127}));
  connect(PI_1.CS, ald_1.u2) annotation(
    Line(points = {{-40, 24}, {-22, 24}}, color = {0, 0, 127}));
  connect(SP.y, PI_1.SP) annotation(
    Line(points = {{-119, 30}, {-64, 30}}, color = {0, 0, 127}));
  connect(Process_1.y, PI_1.PV) annotation(
    Line(points = {{42, 30}, {60, 30}, {60, 0}, {-80, 0}, {-80, 20}, {-64, 20}}, color = {0, 0, 127}));
  connect(LD.y, ald_2.u1) annotation(
    Line(points = {{-118, 54}, {-30, 54}, {-30, -24}, {-22, -24}}, color = {0, 0, 127}));
  connect(ald_2.y, Process_2.u) annotation(
    Line(points = {{2, -30}, {18, -30}}, color = {0, 0, 127}));
  connect(SP.y, PI_2.SP) annotation(
    Line(points = {{-118, 30}, {-90, 30}, {-90, -30}, {-64, -30}}, color = {0, 0, 127}));
  connect(PI_2.CS, ald_2.u2) annotation(
    Line(points = {{-40, -36}, {-22, -36}}, color = {0, 0, 127}));
  connect(Process_2.y, PI_2.PV) annotation(
    Line(points = {{42, -30}, {60, -30}, {60, -60}, {-80, -60}, {-80, -40}, {-64, -40}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-6, Interval = 0.2),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end PI_loop_analogue_compare2;