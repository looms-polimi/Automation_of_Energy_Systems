within AES.Coursework.ThermSys_control_problems.Temperature_control_pipes;

model Tcontrol_pipes_sensor_dynamics_01_gen
  extends Icons.CourseworkModel;
  
  parameter Real mu=1;
  parameter Real taup=1;
  parameter Real taus=5;
  parameter Real wc=0.5;

  Modelica.Blocks.Sources.RealExpression SP(y = if time < 1 then 0 else 1) annotation(
    Placement(visible = true, transformation(origin = {-150, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction P1(a = {taup, 1}, b = {mu}) annotation(
    Placement(visible = true, transformation(origin = {-8, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction S1(a = {taus, 1}, b = {1}) annotation(
    Placement(visible = true, transformation(origin = {-30, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction C1(a = {1, 0}, b = wc / mu * {taup, 1}) annotation(
    Placement(visible = true, transformation(origin = {-50, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback fb1 annotation(
    Placement(visible = true, transformation(origin = {-90, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction S2(a = {taus, 1}, b = {1}) annotation(
    Placement(visible = true, transformation(origin = {92, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction C2(a = {1, 0}, b = wc / mu * {taus, 1}) annotation(
    Placement(visible = true, transformation(origin = {70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction P2(a = {taup, 1}, b = {mu}) annotation(
    Placement(visible = true, transformation(origin = {114, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback fb2 annotation(
    Placement(visible = true, transformation(origin = {34, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction S3(a = {taus, 1}, b = {1}) annotation(
    Placement(visible = true, transformation(origin = {-30, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction P3(a = {taup, 1}, b = {mu}) annotation(
    Placement(visible = true, transformation(origin = {-8, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction C3(a = {0.1 / wc, 1, 0}, b = wc / mu * {taus * taup, taus + taup, 1}) annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback fb3 annotation(
    Placement(visible = true, transformation(origin = {-88, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction C4(a = {0.1 / wc, 1, 0}, b = wc / mu * {taus * taup, taus + taup, 1}) annotation(
    Placement(visible = true, transformation(origin = {78, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction P4(a = {taup, 1}, b = {mu}) annotation(
    Placement(visible = true, transformation(origin = {120, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction S4(a = {taus, 1}, b = {1}) annotation(
    Placement(visible = true, transformation(origin = {98, -70}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback fb4 annotation(
    Placement(visible = true, transformation(origin = {40, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction Sf4(a = {taus, 1}, b = {1}) annotation(
    Placement(visible = true, transformation(origin = {10, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(P1.y, S1.u) annotation(
    Line(points = {{3, 80}, {19, 80}, {19, 50}, {-18, 50}}, color = {0, 0, 127}));
  connect(fb1.y, C1.u) annotation(
    Line(points = {{-81, 80}, {-63, 80}}, color = {0, 0, 127}));
  connect(SP.y, fb1.u1) annotation(
    Line(points = {{-139, 80}, {-99, 80}}, color = {0, 0, 127}));
  connect(S1.y, fb1.u2) annotation(
    Line(points = {{-41, 50}, {-91, 50}, {-91, 72}}, color = {0, 0, 127}));
  connect(C1.y, P1.u) annotation(
    Line(points = {{-39, 80}, {-21, 80}}, color = {0, 0, 127}));
  connect(P2.y, S2.u) annotation(
    Line(points = {{125, 30}, {141, 30}, {141, 0}, {103, 0}}, color = {0, 0, 127}));
  connect(S2.y, fb2.u2) annotation(
    Line(points = {{81, 0}, {34, 0}, {34, 22}}, color = {0, 0, 127}));
  connect(fb2.y, C2.u) annotation(
    Line(points = {{43, 30}, {58, 30}}, color = {0, 0, 127}));
  connect(C2.y, P2.u) annotation(
    Line(points = {{81, 30}, {101, 30}}, color = {0, 0, 127}));
  connect(SP.y, fb2.u1) annotation(
    Line(points = {{-139, 80}, {-120, 80}, {-120, 30}, {26, 30}}, color = {0, 0, 127}));
  connect(SP.y, fb3.u1) annotation(
    Line(points = {{-138, 80}, {-120, 80}, {-120, 10}, {-96, 10}}, color = {0, 0, 127}));
  connect(fb3.y, C3.u) annotation(
    Line(points = {{-79, 10}, {-62, 10}}, color = {0, 0, 127}));
  connect(C3.y, P3.u) annotation(
    Line(points = {{-39, 10}, {-20, 10}}, color = {0, 0, 127}));
  connect(P3.y, S3.u) annotation(
    Line(points = {{3, 10}, {21, 10}, {21, -20}, {-18, -20}}, color = {0, 0, 127}));
  connect(S3.y, fb3.u2) annotation(
    Line(points = {{-41, -20}, {-89, -20}, {-89, 2}}, color = {0, 0, 127}));
  connect(fb4.y, C4.u) annotation(
    Line(points = {{50, -40}, {66, -40}}, color = {0, 0, 127}));
  connect(C4.y, P4.u) annotation(
    Line(points = {{90, -40}, {108, -40}}, color = {0, 0, 127}));
  connect(P4.y, S4.u) annotation(
    Line(points = {{132, -40}, {140, -40}, {140, -70}, {110, -70}}, color = {0, 0, 127}));
  connect(S4.y, fb4.u2) annotation(
    Line(points = {{88, -70}, {40, -70}, {40, -48}}, color = {0, 0, 127}));
  connect(Sf4.y, fb4.u1) annotation(
    Line(points = {{22, -40}, {32, -40}}, color = {0, 0, 127}));
  connect(Sf4.u, SP.y) annotation(
    Line(points = {{-2, -40}, {-120, -40}, {-120, 80}, {-138, 80}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-6, Interval = 0.1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end Tcontrol_pipes_sensor_dynamics_01_gen;