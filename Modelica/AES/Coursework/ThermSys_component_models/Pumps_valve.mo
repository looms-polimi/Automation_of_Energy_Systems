within AES.Coursework.ThermSys_component_models;

  model Pumps_valve
    extends Icons.CourseworkModel;
  AES.ProcessComponents.Thermal.Liquid.Pump_volumetric Pvol(w0 = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {-90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Pump_centrifugal Pcen(dpn0 = 49999.99999999999, wn0 = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Node_pT_fixed src annotation(
    Placement(visible = true, transformation(origin = {-152, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Valve_linear Vlin_vol(dpnom = 49999.99999999999, wnom = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Valve_linear vlin_cen(wnom = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Node_pT_fixed snk annotation(
    Placement(visible = true, transformation(origin = {90, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp cmd_p(duration = 10, height = 0.8, offset = 0.1, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-130, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp cmd_v(duration = 10, height = 0.8, offset = 0.1, startTime = 30)  annotation(
    Placement(visible = true, transformation(origin = {-30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));  equation
  connect(src.pwh_a, Pvol.pwh_a) annotation(
    Line(points = {{-140, -10}, {-120, -10}, {-120, 10}, {-102, 10}}, color = {46, 52, 54}));
  connect(src.pwh_a, Pcen.pwh_a) annotation(
    Line(points = {{-140, -10}, {-120, -10}, {-120, -30}, {-82, -30}}, color = {46, 52, 54}));
  connect(Vlin_vol.pwh_b, snk.pwh_a) annotation(
    Line(points = {{22, 10}, {60, 10}, {60, -10}, {78, -10}}, color = {46, 52, 54}));
  connect(vlin_cen.pwh_b, snk.pwh_a) annotation(
    Line(points = {{42, -30}, {60, -30}, {60, -10}, {78, -10}}, color = {46, 52, 54}));
  connect(Pvol.pwh_b, Vlin_vol.pwh_a) annotation(
    Line(points = {{-78, 10}, {-2, 10}}, color = {46, 52, 54}));
  connect(Pcen.pwh_b, vlin_cen.pwh_a) annotation(
    Line(points = {{-58, -30}, {18, -30}}, color = {46, 52, 54}));
  connect(cmd_p.y, Pvol.cmd) annotation(
    Line(points = {{-118, 50}, {-90, 50}, {-90, 18}}, color = {0, 0, 127}));
  connect(cmd_p.y, Pcen.cmd) annotation(
    Line(points = {{-118, 50}, {-70, 50}, {-70, -22}}, color = {0, 0, 127}));
  connect(cmd_v.y, Vlin_vol.x) annotation(
    Line(points = {{-18, 50}, {10, 50}, {10, 20}}, color = {0, 0, 127}));
  connect(cmd_v.y, vlin_cen.x) annotation(
    Line(points = {{-18, 50}, {30, 50}, {30, -20}}, color = {0, 0, 127}));
  annotation(
      Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-6, Interval = 0.1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
  end Pumps_valve;