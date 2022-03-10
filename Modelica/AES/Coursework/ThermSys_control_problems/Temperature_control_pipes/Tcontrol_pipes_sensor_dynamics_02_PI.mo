within AES.Coursework.ThermSys_control_problems.Temperature_control_pipes;

model Tcontrol_pipes_sensor_dynamics_02_PI
  extends Icons.CourseworkModel;
  Modelica.Blocks.Sources.RealExpression SP(y = if time < 10 then 0 else 0.5) annotation(
    Placement(visible = true, transformation(origin = {-110, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction P_tforP(a = {5, 1}, b = {1}) annotation(
    Placement(visible = true, transformation(origin = {30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction sens_tforP(a = {20, 1}, b = {1}) annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction P_tforS(a = {5, 1}, b = {1}) annotation(
    Placement(visible = true, transformation(origin = {30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction sens_tforS(a = {20, 1}, b = {1}) annotation(
    Placement(visible = true, transformation(origin = {-10, -70}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_basic PI_tuned_for_process(K = 10, Ti = 10) annotation(
    Placement(visible = true, transformation(origin = {-30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_basic PI_tuned_for_sensor(K = 0.8, Ti = 20) annotation(
    Placement(visible = true, transformation(origin = {-30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(P_tforP.y, sens_tforP.u) annotation(
    Line(points = {{41, 50}, {61, 50}, {61, 10}, {2, 10}}, color = {0, 0, 127}));
  connect(P_tforS.y, sens_tforS.u) annotation(
    Line(points = {{41, -30}, {59, -30}, {59, -70}, {2, -70}}, color = {0, 0, 127}));
  connect(PI_tuned_for_process.CS, P_tforP.u) annotation(
    Line(points = {{-18, 50}, {18, 50}}, color = {0, 0, 127}));
  connect(PI_tuned_for_sensor.CS, P_tforS.u) annotation(
    Line(points = {{-18, -30}, {18, -30}}, color = {0, 0, 127}));
  connect(sens_tforP.y, PI_tuned_for_process.PV) annotation(
    Line(points = {{-20, 10}, {-60, 10}, {-60, 46}, {-42, 46}}, color = {0, 0, 127}));
  connect(sens_tforS.y, PI_tuned_for_sensor.PV) annotation(
    Line(points = {{-20, -70}, {-60, -70}, {-60, -34}, {-42, -34}}, color = {0, 0, 127}));
  connect(SP.y, PI_tuned_for_process.SP) annotation(
    Line(points = {{-98, 56}, {-42, 56}}, color = {0, 0, 127}));
  connect(SP.y, PI_tuned_for_sensor.SP) annotation(
    Line(points = {{-98, 56}, {-80, 56}, {-80, -24}, {-42, -24}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-6, Interval = 0.2),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end Tcontrol_pipes_sensor_dynamics_02_PI;