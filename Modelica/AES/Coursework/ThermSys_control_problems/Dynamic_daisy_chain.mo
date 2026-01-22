within AES.Coursework.ThermSys_control_problems;

package Dynamic_daisy_chain
  model Two_actuators_large_slow_and_small_fast
    extends Icons.CourseworkModel;
    parameter Real c = 3.5;
    /* 3.5 achieves quasi-linear inst char in 0.2-0.8*/
    Modelica.Blocks.Continuous.TransferFunction large_slow_actuator(a = {50, 1}, b = {1}) annotation(
      Placement(transformation(origin = {50, -10}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Continuous.TransferFunction small_fast_actuator(a = {1, 1}, b = {1}) annotation(
      Placement(transformation(origin = {50, 30}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Math.Add actuator_combination annotation(
      Placement(transformation(origin = {130, 10}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Continuous.LimPID Cfast(Ti = 1, controllerType = Modelica.Blocks.Types.SimpleController.PI, k = 0.4*0.1, yMax = 1, yMin = 0) annotation(
      Placement(transformation(origin = {-28, 30}, extent = {{-10, 10}, {10, -10}})));
    Modelica.Blocks.Continuous.LimPID Cslow(Ti = 50, k = 0.2, yMax = 1, yMin = 0) annotation(
      Placement(transformation(origin = {16, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -0)));
    Modelica.Blocks.Sources.RealExpression u_fast_set(y = 0.5) annotation(
      Placement(transformation(origin = {-80, -30}, extent = {{-20, -20}, {20, 20}})));
    Modelica.Blocks.Continuous.TransferFunction process(a = {0.5, 1}, b = {1}) annotation(
      Placement(transformation(origin = {170, 10}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Sources.RealExpression process_var_set(y = if time < 100 then 2 elseif time < 200 then 20
     elseif time < 300 then 20 + 3*sin(time - 200/5)
     elseif time < 400 then 30 else 25) annotation(
      Placement(transformation(origin = {-129, 30}, extent = {{-67, -38}, {67, 38}})));
    Modelica.Blocks.Math.Gain small_fast_gain(k = 10) annotation(
      Placement(transformation(origin = {90, 30}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Math.Gain large_slow_gain(k = 100) annotation(
      Placement(transformation(origin = {90, -10}, extent = {{-10, -10}, {10, 10}})));
  equation
    connect(Cfast.y, small_fast_actuator.u) annotation(
      Line(points = {{-17, 30}, {38, 30}}, color = {0, 0, 127}));
    connect(Cslow.y, large_slow_actuator.u) annotation(
      Line(points = {{27, -10}, {38, -10}}, color = {0, 0, 127}));
    connect(process.y, Cfast.u_m) annotation(
      Line(points = {{181, 10}, {191, 10}, {191, 62}, {-28, 62}, {-28, 42}}, color = {0, 0, 127}));
    connect(actuator_combination.y, process.u) annotation(
      Line(points = {{141, 10}, {158, 10}}, color = {0, 0, 127}));
    connect(process_var_set.y, Cfast.u_s) annotation(
      Line(points = {{-55.3, 30}, {-40.3, 30}}, color = {0, 0, 127}));
    connect(Cfast.y, Cslow.u_s) annotation(
      Line(points = {{-17, 30}, {-11, 30}, {-11, -10}, {4, -10}}, color = {0, 0, 127}));
    connect(small_fast_actuator.y, small_fast_gain.u) annotation(
      Line(points = {{61, 30}, {78, 30}}, color = {0, 0, 127}));
    connect(large_slow_actuator.y, large_slow_gain.u) annotation(
      Line(points = {{61, -10}, {78, -10}}, color = {0, 0, 127}));
    connect(small_fast_gain.y, actuator_combination.u1) annotation(
      Line(points = {{101, 30}, {110, 30}, {110, 16}, {118, 16}}, color = {0, 0, 127}));
    connect(large_slow_gain.y, actuator_combination.u2) annotation(
      Line(points = {{101, -10}, {110, -10}, {110, 4}, {118, 4}}, color = {0, 0, 127}));
  connect(u_fast_set.y, Cslow.u_m) annotation(
      Line(points = {{-58, -30}, {16, -30}, {16, -22}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 600, Tolerance = 1e-06, Interval = 0.2),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts",
      __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"),
      Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}}), graphics = {Text(origin = {28, -50}, extent = {{-128, 32}, {128, -32}}, textString = "Desired position for slow & fast actuator
(e.g., range midpoint for max action space in both directions)", horizontalAlignment = TextAlignment.Left), Text(origin = {-141, 1}, extent = {{-55, 13}, {55, -13}}, textString = "SP for the main
controlled variable", horizontalAlignment = TextAlignment.Left)}));
  end Two_actuators_large_slow_and_small_fast;
  extends Modelica.Icons.Package;
  extends Icons.CourseworkModel;
end Dynamic_daisy_chain;