within AES.Devel_test_models;

model Test_cascade_01
  extends Icons.TestModel;
  inner ProcessComponents.Thermal.System_settings.System_liquid system annotation(
    Placement(visible = true, transformation(origin = {-170, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));


  Plant plant annotation(
    Placement(transformation(origin = {10, 10}, extent = {{-10, -10}, {10, 10}})));
 



model Plant

  ProcessComponents.Thermal.Liquid.Node_pT_fixed snk(p(displayUnit = "Pa") = 1e5) annotation(
    Placement(transformation(origin = {150, -56}, extent = {{10, -10}, {-10, 10}})));
  ProcessComponents.Thermal.Liquid.Node_pT_prescribed src annotation(
    Placement(transformation(origin = {-70, -56}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression pi(y = 5e5) annotation(
    Placement(transformation(origin = {-112, -36}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression Ti(y = 273.15 + 70) annotation(
    Placement(transformation(origin = {-112, -62}, extent = {{-10, -10}, {10, 10}})));
  ProcessComponents.Thermal.Liquid.Valve_linear V(dpnom = 200000, wnom = 5) annotation(
    Placement(transformation(origin = {10, -56}, extent = {{-10, -10}, {10, 10}})));
  ProcessComponents.Thermal.Liquid.Tube heating_pipe annotation(
    Placement(transformation(origin = {90, -56}, extent = {{-10, -10}, {10, 10}})));
  ProcessComponents.Thermal.Liquid.MassFlowrateSensor sw annotation(
    Placement(transformation(origin = {52, -56}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.FirstOrder valve_pos(T = 4)  annotation(
    Placement(transformation(origin = {-10, -16}, extent = {{-10, -10}, {10, 10}})));
  ProcessComponents.Thermal.Liquid.VectorHPtoHP_conductor con(Gtotal = 500)  annotation(
    Placement(transformation(origin = {90, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor cap(C = 1e4)  annotation(
    Placement(transformation(origin = {92, 48}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor loss(G = 200)  annotation(
    Placement(transformation(origin = {132, 28}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature env annotation(
    Placement(transformation(origin = {132, 70}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression Tenv(y = 273.15 + 10) annotation(
    Placement(transformation(origin = {92, 70}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor sT annotation(
    Placement(transformation(origin = {46, 26}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  Modelica.Blocks.Interfaces.RealInput uv annotation(
      Placement(transformation(origin = {-122, 8}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-122, 8}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealOutput w annotation(
      Placement(transformation(origin = {68, -28}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {118, 66}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput T annotation(
      Placement(transformation(origin = {34, 66}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {122, -54}, extent = {{-10, -10}, {10, 10}})));
  equation
    connect(Ti.y, src.T) annotation(
      Line(points = {{-101, -62}, {-80, -62}}, color = {0, 0, 127}));
    connect(pi.y, src.p) annotation(
      Line(points = {{-101, -36}, {-93, -36}, {-93, -50}, {-80, -50}}, color = {0, 0, 127}));
    connect(src.pwh_a, V.pwh_a) annotation(
      Line(points = {{-58, -56}, {-2, -56}}, color = {46, 52, 54}));
    connect(heating_pipe.pwh_b, snk.pwh_a) annotation(
      Line(points = {{102, -56}, {138, -56}}, color = {46, 52, 54}));
    connect(V.pwh_b, sw.pwh_a) annotation(
      Line(points = {{22, -56}, {40, -56}}, color = {46, 52, 54}));
    connect(sw.pwh_b, heating_pipe.pwh_a) annotation(
      Line(points = {{64, -56}, {78, -56}}, color = {46, 52, 54}));
    connect(valve_pos.y, V.x) annotation(
      Line(points = {{1, -16}, {9, -16}, {9, -46}}, color = {0, 0, 127}));
    connect(con.vectorHP, heating_pipe.surf) annotation(
      Line(points = {{90, -38}, {90, -50}}, color = {144, 5, 5}));
    connect(con.HP, cap.port) annotation(
      Line(points = {{90, -30}, {90, 17}, {92, 17}, {92, 38}}, color = {191, 0, 0}));
    connect(loss.port_a, cap.port) annotation(
      Line(points = {{122, 28}, {92, 28}, {92, 38}}, color = {191, 0, 0}));
    connect(env.port, loss.port_b) annotation(
      Line(points = {{142, 70}, {162, 70}, {162, 28}, {142, 28}}, color = {191, 0, 0}));
    connect(Tenv.y, env.T) annotation(
      Line(points = {{103, 70}, {119, 70}}, color = {0, 0, 127}));
    connect(sT.port, cap.port) annotation(
      Line(points = {{56, 26}, {92, 26}, {92, 38}}, color = {191, 0, 0}));
  connect(uv, valve_pos.u) annotation(
      Line(points = {{-122, 8}, {-68, 8}, {-68, -16}, {-22, -16}}, color = {0, 0, 127}));
  connect(sw.ow, w) annotation(
      Line(points = {{52, -48}, {50, -48}, {50, -28}, {68, -28}}, color = {0, 0, 127}));
  connect(sT.T, T) annotation(
      Line(points = {{36, 26}, {-8, 26}, {-8, 66}, {34, 66}}, color = {0, 0, 127}));
  annotation(
      experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
      __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"));
end Plant;

  ControlBlocks.AnalogueControllers.PI_awfb_basic PI_w(K = 2, Ti = 4, CSmin = 0)  annotation(
    Placement(transformation(origin = {-46, 10}, extent = {{-10, -10}, {10, 10}})));
 Modelica.Blocks.Sources.RealExpression spT(y = 275.15 + (if time < 100 then 50 elseif time < 300 then 60 else 55))  annotation(
    Placement(transformation(origin = {-164, 22}, extent = {{-10, -10}, {10, 10}})));
 AES.ControlBlocks.AnalogueControllers.PI_awfb_basic PI_w1(CSmin = 0, K = 2, Ti = 80, CSmax = 6) annotation(
    Placement(transformation(origin = {-110, 18}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(PI_w.CS, plant.uv) annotation(
    Line(points = {{-34, 10}, {-2, 10}}, color = {0, 0, 127}));
 connect(plant.w, PI_w.PV) annotation(
    Line(points = {{22, 16}, {42, 16}, {42, -28}, {-66, -28}, {-66, 6}, {-58, 6}}, color = {0, 0, 127}));
 connect(spT.y, PI_w1.SP) annotation(
    Line(points = {{-152, 22}, {-122, 22}, {-122, 24}}, color = {0, 0, 127}));
 connect(PI_w1.CS, PI_w.SP) annotation(
    Line(points = {{-98, 18}, {-58, 18}, {-58, 16}}, color = {0, 0, 127}));
 connect(plant.T, PI_w1.PV) annotation(
    Line(points = {{22, 4}, {28, 4}, {28, -44}, {-140, -44}, {-140, 14}, {-122, 14}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 500, Tolerance = 1e-06, Interval = 0.01),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts",
    __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})));
end Test_cascade_01;