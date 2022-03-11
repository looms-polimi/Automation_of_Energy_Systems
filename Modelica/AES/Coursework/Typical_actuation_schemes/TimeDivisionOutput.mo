within AES.Coursework.Typical_actuation_schemes;

model TimeDivisionOutput
  extends Icons.CourseworkModel;
  Modelica.Blocks.Continuous.TransferFunction Process(a = {5, 6, 1}, b = {2})  annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression SP(y = if time < 1 then 0 else 0.6 + 0.5 * sign(sin((time - 1) / 20)))  annotation(
    Placement(visible = true, transformation(origin = {-130, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.ActuationSchemes.TimeDivisionOutput TDO(Ttdo = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_basic Cfb(CSmin = 0, Ti = 5)  annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(TDO.TDO, Process.u) annotation(
    Line(points = {{2, 10}, {18, 10}}, color = {0, 0, 127}));
  connect(SP.y, Cfb.SP) annotation(
    Line(points = {{-118, 16}, {-82, 16}}, color = {0, 0, 127}));
  connect(Cfb.CS, TDO.cmd01) annotation(
    Line(points = {{-58, 10}, {-22, 10}}, color = {0, 0, 127}));
  connect(Process.y, Cfb.PV) annotation(
    Line(points = {{42, 10}, {50, 10}, {50, -20}, {-90, -20}, {-90, 6}, {-82, 6}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 300, Tolerance = 1e-6, Interval = 0.6),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end TimeDivisionOutput;