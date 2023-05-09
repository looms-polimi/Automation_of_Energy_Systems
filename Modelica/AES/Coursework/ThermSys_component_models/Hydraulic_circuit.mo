within AES.Coursework.ThermSys_component_models;

  model Hydraulic_circuit
    extends Icons.CourseworkModel;
  AES.ProcessComponents.Thermal.Liquid.Valve_linear vlin_cen(wnom = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {28, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp cmd_p(duration = 10, height = 0.8, offset = 0.1, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-130, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp cmd_v(duration = 10, height = 0.8, offset = 0.1, startTime = 30)  annotation(
    Placement(visible = true, transformation(origin = {-30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.ExpansionVessel_isoT Vessel(V = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {-112, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner ProcessComponents.Thermal.System_settings.System_liquid system annotation(
    Placement(visible = true, transformation(origin = {-190, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.Liquid.Pump_centrifugal Pcen(dpn0 = 10000, wn0 = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-72, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Node_wT_prescribed inject annotation(
    Placement(visible = true, transformation(origin = {-112, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Tin(y = 293.15)  annotation(
    Placement(visible = true, transformation(origin = {-170, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression win(y = if time > 10 and time < 12 then 0.05 else 0)  annotation(
    Placement(visible = true, transformation(origin = {-170, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.Liquid.Tube tube(fluidHeats = true, hasInertia = true)  annotation(
    Placement(visible = true, transformation(origin = {-20, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));  equation
  connect(cmd_v.y, vlin_cen.x) annotation(
    Line(points = {{-19, 50}, {28, 50}, {28, 20}}, color = {0, 0, 127}));
  connect(vlin_cen.pwh_b, Vessel.pwh_a) annotation(
    Line(points = {{40, 10}, {60, 10}, {60, -20}, {-140, -20}, {-140, 10}, {-124, 10}}, color = {46, 52, 54}));
  connect(Vessel.pwh_b, Pcen.pwh_a) annotation(
    Line(points = {{-100, 10}, {-84, 10}}, color = {46, 52, 54}));
  connect(cmd_p.y, Pcen.cmd) annotation(
    Line(points = {{-118, 50}, {-72, 50}, {-72, 18}}, color = {0, 0, 127}));
  connect(Tin.y, inject.T) annotation(
    Line(points = {{-159, -70}, {-140, -70}, {-140, -56}, {-122, -56}}, color = {0, 0, 127}));
  connect(win.y, inject.w) annotation(
    Line(points = {{-158, -44}, {-122, -44}}, color = {0, 0, 127}));
  connect(inject.pwh_a, Pcen.pwh_a) annotation(
    Line(points = {{-100, -50}, {-90, -50}, {-90, 10}, {-84, 10}}, color = {46, 52, 54}));
  connect(tube.pwh_b, vlin_cen.pwh_a) annotation(
    Line(points = {{-8, 10}, {16, 10}}, color = {46, 52, 54}));
  connect(Pcen.pwh_b, tube.pwh_a) annotation(
    Line(points = {{-60, 10}, {-32, 10}}, color = {46, 52, 54}));
  annotation(
      Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-6, Interval = 0.1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
  end Hydraulic_circuit;