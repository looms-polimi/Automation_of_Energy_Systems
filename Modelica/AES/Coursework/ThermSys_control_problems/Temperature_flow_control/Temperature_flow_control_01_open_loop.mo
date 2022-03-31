within AES.Coursework.ThermSys_control_problems.Temperature_flow_control;

model Temperature_flow_control_01_open_loop
  extends Icons.CourseworkModel;
  AES.ProcessComponents.Thermal.Liquid.Pump_volumetric P(w0 = 5)  annotation(
    Placement(visible = true, transformation(origin = {-50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.TubeStream stream_loss(kdp = 1)  annotation(
    Placement(visible = true, transformation(origin = {10, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.TubeStream stream_load(kdp = 1)  annotation(
    Placement(visible = true, transformation(origin = {50, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  AES.ProcessComponents.Thermal.Liquid.Pressuriser pressuriser annotation(
    Placement(visible = true, transformation(origin = {10, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.HVAC.ControlledLiquidHeater_lim heater annotation(
    Placement(visible = true, transformation(origin = {-90, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Convection_VecVec conv_loss(gamma = 100)  annotation(
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.surfQcond_fixed Pload(Q = 10000)  annotation(
    Placement(visible = true, transformation(origin = {90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.surfTcond_fixed Tloss(T = 283.15)  annotation(
    Placement(visible = true, transformation(origin = {10, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Tsp(y = 273.15 + 30)  annotation(
    Placement(visible = true, transformation(origin = {-150, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Pcmd(y = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {-150, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression Hon(y = true)  annotation(
    Placement(visible = true, transformation(origin = {-150, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(pressuriser.pwh_b, stream_load.pwh_b) annotation(
    Line(points = {{22, -76}, {50, -76}, {50, -62}}, color = {46, 52, 54}));
  connect(P.pwh_b, stream_loss.pwh_a) annotation(
    Line(points = {{-38, -10}, {-2, -10}}, color = {46, 52, 54}));
  connect(stream_loss.pwh_b, stream_load.pwh_a) annotation(
    Line(points = {{22, -10}, {50, -10}, {50, -38}}, color = {46, 52, 54}));
  connect(heater.pwh_b, P.pwh_a) annotation(
    Line(points = {{-78, -10}, {-62, -10}}, color = {46, 52, 54}));
  connect(pressuriser.pwh_a, heater.pwh_a) annotation(
    Line(points = {{-2, -76}, {-120, -76}, {-120, -10}, {-102, -10}}, color = {46, 52, 54}));
  connect(stream_loss.surf, conv_loss.surf_A) annotation(
    Line(points = {{10, -4.6}, {10, 3.4}}, color = {144, 5, 5}));
  connect(stream_load.surf, Pload.surf) annotation(
    Line(points = {{55.4, -50}, {89.4, -50}, {89.4, -38}}, color = {144, 5, 5}));
  connect(conv_loss.surf_B, Tloss.surf) annotation(
    Line(points = {{10, 15.2667}, {10, 28.2667}}, color = {144, 5, 5}));
  connect(Tsp.y, heater.To) annotation(
    Line(points = {{-139, -4}, {-102, -4}}, color = {0, 0, 127}));
  connect(Pcmd.y, P.cmd) annotation(
    Line(points = {{-139, 30}, {-51, 30}, {-51, -2}}, color = {0, 0, 127}));
  connect(Hon.y, heater.ON) annotation(
    Line(points = {{-139, -30}, {-131, -30}, {-131, -16}, {-103, -16}}, color = {255, 0, 255}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}}), graphics = {Text(origin = {-74, 77}, extent = {{-116, 17}, {116, -17}}, textString = "Try various combinations of flowrate and heater Tout SP;\nchange the pipes friction and comment;\nchange Tloss and analyse its influence")}),
    experiment(StartTime = 0, StopTime = 10000, Tolerance = 1e-6, Interval = 20),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end Temperature_flow_control_01_open_loop;