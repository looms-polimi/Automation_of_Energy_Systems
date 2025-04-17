within AES.Coursework.ThermSys_control_problems.Flow_pressure_control_liquids;

model Valve_position_control_case_001
  extends Icons.CourseworkModel;
  parameter Real c = 3.5;
  /* 3.5 achieves quasi-linear inst char in 0.2-0.8*/
  Modelica.Blocks.Continuous.TransferFunction large_slow_actuator(a = {50, 1}, b = {1}) annotation(
    Placement(transformation(origin = {-10, -20}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.TransferFunction small_fast_actuator(a = {1, 1}, b = {1}) annotation(
    Placement(transformation(origin = {-10, 30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Add actuator_combination annotation(
    Placement(transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.LimPID Cfast(Ti = 1, controllerType = Modelica.Blocks.Types.SimpleController.PI, k = 0.4, yMax = 1, yMin = 0) annotation(
    Placement(transformation(origin = {-88, 30}, extent = {{-10, 10}, {10, -10}})));
  Modelica.Blocks.Continuous.LimPID Cslow(Ti = 50, k = 0.2, yMax = 1, yMin = 0) annotation(
    Placement(transformation(origin = {-48, -20}, extent = {{-10, 10}, {10, -10}})));
  Modelica.Blocks.Sources.RealExpression u_fast_set(y = 0.5) annotation(
    Placement(transformation(origin = {-146, 6}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.TransferFunction process(a = {0.5, 1}, b = {1}) annotation(
    Placement(transformation(origin = {130, 10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression process_var_set(y = if time < 100 then 2 elseif time < 200 then 20
   elseif time < 300 then 20 + 3*sin(time - 200/5)
   elseif time < 400 then 30 else 25) annotation(
    Placement(transformation(origin = {-180, 88}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Gain small_fast_gain(k = 10)  annotation(
    Placement(transformation(origin = {30, 30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Gain large_slow_gain(k = 100)  annotation(
    Placement(transformation(origin = {30, -20}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(Cfast.y, small_fast_actuator.u) annotation(
    Line(points = {{-77, 30}, {-22, 30}}, color = {0, 0, 127}));
  connect(Cslow.y, large_slow_actuator.u) annotation(
    Line(points = {{-37, -20}, {-22, -20}}, color = {0, 0, 127}));
  connect(process.y, Cfast.u_m) annotation(
    Line(points = {{141, 10}, {167, 10}, {167, 62}, {-88, 62}, {-88, 42}}, color = {0, 0, 127}));
  connect(actuator_combination.y, process.u) annotation(
    Line(points = {{101, 10}, {118, 10}}, color = {0, 0, 127}));
  connect(process_var_set.y, Cfast.u_s) annotation(
    Line(points = {{-169, 88}, {-109, 88}, {-109, 30}, {-100, 30}}, color = {0, 0, 127}));
  connect(Cfast.y, Cslow.u_s) annotation(
    Line(points = {{-77, 30}, {-71, 30}, {-71, -20}, {-60, -20}}, color = {0, 0, 127}));
  connect(u_fast_set.y, Cslow.u_m) annotation(
    Line(points = {{-135, 6}, {-48, 6}, {-48, -8}}, color = {0, 0, 127}));
  connect(small_fast_actuator.y, small_fast_gain.u) annotation(
    Line(points = {{2, 30}, {18, 30}}, color = {0, 0, 127}));
  connect(large_slow_actuator.y, large_slow_gain.u) annotation(
    Line(points = {{2, -20}, {18, -20}}, color = {0, 0, 127}));
  connect(small_fast_gain.y, actuator_combination.u1) annotation(
    Line(points = {{42, 30}, {60, 30}, {60, 16}, {78, 16}}, color = {0, 0, 127}));
  connect(large_slow_gain.y, actuator_combination.u2) annotation(
    Line(points = {{42, -20}, {60, -20}, {60, 4}, {78, 4}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 600, Tolerance = 1e-06, Interval = 0.2),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts",
    __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})));
end Valve_position_control_case_001;