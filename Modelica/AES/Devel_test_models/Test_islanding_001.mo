within AES.Devel_test_models;

model Test_islanding_001
  extends AES.Icons.TestModel;
  Modelica.Blocks.Sources.RealExpression dPe1(y = 20e6*(if time < 300 then 1 else 0.7)) annotation(
    Placement(visible = true, transformation(origin = {-46, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction g1(a = {1, 2, 1}, b = {30e6}) annotation(
    Placement(visible = true, transformation(origin = {-46, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression fo(y = 50) annotation(
    Placement(visible = true, transformation(origin = {-140, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Electric.Loads_PAport.Load_linear_droop L1(Pnom = 20e6) annotation(
    Placement(visible = true, transformation(origin = {-8, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.LimPID Cps1(Ti = 80, controllerType = .Modelica.Blocks.Types.SimpleController.PI, k = 0.1, yMax = 1, yMin = 0) annotation(
    Placement(visible = true, transformation(origin = {-84, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Electric.Generators_PAport.Generator_order0_prescribed_P G1(Tox = 0.8) annotation(
    Placement(visible = true, transformation(origin = {-8, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Electric.Generators_PAport.Generator_order0_prescribed_P G2(Tox = 0.8) annotation(
    Placement(visible = true, transformation(origin = {-12, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction g2(a = {1, 2, 1}, b = {35e6}) annotation(
    Placement(visible = true, transformation(origin = {-50, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Electric.Loads_PAport.Load_linear_droop L2(Pnom = 20e6) annotation(
    Placement(visible = true, transformation(origin = {-12, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression dPe2(y = 30e6*(if time < 600 then 0.8 else 1.1)) annotation(
    Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.LimPID Cps2(Ti = 80, controllerType = .Modelica.Blocks.Types.SimpleController.PI, k = 0.2, yMax = 1, yMin = 0) annotation(
    Placement(visible = true, transformation(origin = {-88, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Electric.Connections_PAport.IdealBreaker B annotation(
    Placement(visible = true, transformation(origin = {50, -8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.BooleanExpression c(y = sin(time/60) > 0)  annotation(
    Placement(visible = true, transformation(origin = {106, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
equation
  connect(dPe1.y, L1.Preq) annotation(
    Line(points = {{-35, 48}, {-19, 48}}, color = {0, 0, 127}));
  connect(fo.y, Cps1.u_s) annotation(
    Line(points = {{-129, 18}, {-96, 18}}, color = {0, 0, 127}));
  connect(Cps1.y, g1.u) annotation(
    Line(points = {{-73, 18}, {-58, 18}}, color = {0, 0, 127}));
  connect(g1.y, G1.Pcmd) annotation(
    Line(points = {{-35, 18}, {-19, 18}}, color = {0, 0, 127}));
  connect(G1.fg, Cps1.u_m) annotation(
    Line(points = {{-8, 8}, {-8, -12}, {-84, -12}, {-84, 6}}, color = {0, 0, 127}));
  connect(L1.port, G1.port) annotation(
    Line(points = {{2, 48}, {20, 48}, {20, 18}, {2, 18}}, color = {0, 0, 255}));
  connect(Cps2.y, g2.u) annotation(
    Line(points = {{-76, -60}, {-62, -60}}, color = {0, 0, 127}));
  connect(dPe2.y, L2.Preq) annotation(
    Line(points = {{-38, -30}, {-22, -30}}, color = {0, 0, 127}));
  connect(fo.y, Cps2.u_s) annotation(
    Line(points = {{-128, 18}, {-116, 18}, {-116, -60}, {-100, -60}}, color = {0, 0, 127}));
  connect(g2.y, G2.Pcmd) annotation(
    Line(points = {{-38, -60}, {-22, -60}}, color = {0, 0, 127}));
  connect(G2.fg, Cps2.u_m) annotation(
    Line(points = {{-12, -70}, {-12, -90}, {-88, -90}, {-88, -72}}, color = {0, 0, 127}));
  connect(L2.port, G2.port) annotation(
    Line(points = {{-2, -30}, {20, -30}, {20, -60}, {-2, -60}}, color = {0, 0, 255}));
  connect(G1.port, B.port_a) annotation(
    Line(points = {{2, 18}, {50, 18}, {50, 2}}, color = {0, 0, 255}));
  connect(L2.port, B.port_b) annotation(
    Line(points = {{-2, -30}, {50, -30}, {50, -18}}, color = {0, 0, 255}));
  connect(B.close, c.y) annotation(
    Line(points = {{60, -8}, {95, -8}}, color = {255, 0, 255}));
protected
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 1000, Tolerance = 1e-6, Interval = 0.1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end Test_islanding_001;