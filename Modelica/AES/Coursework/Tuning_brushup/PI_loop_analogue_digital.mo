within AES.Coursework.Tuning_brushup;

model PI_loop_analogue_digital
  extends Icons.CourseworkModel;

  Modelica.Blocks.Continuous.TransferFunction Process_a(a = {5, 6, 1}, b = {1})  annotation(
    Placement(visible = true, transformation(origin = {30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add ald_a annotation(
    Placement(visible = true, transformation(origin = {-10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression SP(y = if time < 1 then 0 else 1)  annotation(
    Placement(visible = true, transformation(origin = {-130, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression LD(y = if time < 30 then 0 else 0.2)  annotation(
    Placement(visible = true, transformation(origin = {-130, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_basic PI_a(CSmax = 3, CSmin = 0, K = 2, Ti = 5)  annotation(
    Placement(visible = true, transformation(origin = {-52, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add ald_d annotation(
    Placement(visible = true, transformation(origin = {-10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction Process_d(a = {5, 6, 1}, b = {1}) annotation(
    Placement(visible = true, transformation(origin = {30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.DigitalControllers.PI_awfb_basic PI_d(CSmax = 3, CSmin = 0, K = 2, Ti = 5, Ts = 0.25)  annotation(
    Placement(visible = true, transformation(origin = {-52, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ald_a.y, Process_a.u) annotation(
    Line(points = {{1, 30}, {17, 30}}, color = {0, 0, 127}));
  connect(LD.y, ald_a.u1) annotation(
    Line(points = {{-119, 54}, {-30, 54}, {-30, 36}, {-22, 36}}, color = {0, 0, 127}));
  connect(PI_a.CS, ald_a.u2) annotation(
    Line(points = {{-40, 24}, {-22, 24}}, color = {0, 0, 127}));
  connect(SP.y, PI_a.SP) annotation(
    Line(points = {{-119, 30}, {-64, 30}}, color = {0, 0, 127}));
  connect(Process_a.y, PI_a.PV) annotation(
    Line(points = {{42, 30}, {60, 30}, {60, 0}, {-80, 0}, {-80, 20}, {-64, 20}}, color = {0, 0, 127}));
  connect(LD.y, ald_d.u1) annotation(
    Line(points = {{-118, 54}, {-30, 54}, {-30, -24}, {-22, -24}}, color = {0, 0, 127}));
  connect(SP.y, PI_d.SP) annotation(
    Line(points = {{-118, 30}, {-88, 30}, {-88, -30}, {-64, -30}}, color = {0, 0, 127}));
  connect(PI_d.CS, ald_d.u2) annotation(
    Line(points = {{-40, -36}, {-22, -36}}, color = {0, 0, 127}));
  connect(ald_d.y, Process_d.u) annotation(
    Line(points = {{2, -30}, {18, -30}}, color = {0, 0, 127}));
  connect(Process_d.y, PI_d.PV) annotation(
    Line(points = {{42, -30}, {60, -30}, {60, -60}, {-80, -60}, {-80, -40}, {-64, -40}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-6, Interval = 0.12),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=aliasConflicts -d=aliasConflicts ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end PI_loop_analogue_digital;