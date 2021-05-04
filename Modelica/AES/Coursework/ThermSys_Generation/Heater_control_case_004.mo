within AES.Coursework.ThermSys_Generation;

model Heater_control_case_004
  extends AES.Icons.CourseworkModel;
  AES.ProcessComponents.Thermal.HVAC.ControlledLiquidHeater_lim CH annotation(
    Placement(visible = true, transformation(origin = {-90, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Pump_volumetric P(w0 = 1)  annotation(
    Placement(visible = true, transformation(origin = {-50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube pipeline(L = 50)  annotation(
    Placement(visible = true, transformation(origin = {10, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression spT(y = if time < 5000 then 273.15 + 50 else 273.15 + 52)  annotation(
    Placement(visible = true, transformation(origin = {-130, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression cmdP(y = 0.9)  annotation(
    Placement(visible = true, transformation(origin = {-130, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Convection_VecVec loss(A = 2)  annotation(
    Placement(visible = true, transformation(origin = {10, 16}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.surfTcond_prescribed Te annotation(
    Placement(visible = true, transformation(origin = {10, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression iTe(y = 273.15 + 20)  annotation(
    Placement(visible = true, transformation(origin = {-130, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression Hon(y = true)  annotation(
    Placement(visible = true, transformation(origin = {-130, -16}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Pressuriser pressuriser annotation(
    Placement(visible = true, transformation(origin = {-70, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube delivery(L = 10) annotation(
    Placement(visible = true, transformation(origin = {70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.surfQcond_prescribed load annotation(
    Placement(visible = true, transformation(origin = {70, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression iQload(y = -1000)  annotation(
    Placement(visible = true, transformation(origin = {-130, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner ProcessComponents.Thermal.System_settings.System_liquid system annotation(
    Placement(visible = true, transformation(origin = {-170, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(CH.pwh_b, P.pwh_a) annotation(
    Line(points = {{-78, -10}, {-62, -10}}, color = {46, 52, 54}));
  connect(P.pwh_b, pipeline.pwh_a) annotation(
    Line(points = {{-38, -10}, {-2, -10}}, color = {46, 52, 54}));
  connect(spT.y, CH.To) annotation(
    Line(points = {{-119, -4}, {-102, -4}}, color = {0, 0, 127}));
  connect(cmdP.y, P.cmd) annotation(
    Line(points = {{-119, 20}, {-50, 20}, {-50, -2}}, color = {0, 0, 127}));
  connect(Te.surf, loss.surf_B) annotation(
    Line(points = {{10, 31.3333}, {10, 22.3333}}, color = {144, 5, 5}));
  connect(loss.surf_A, pipeline.surf) annotation(
    Line(points = {{10, 10.7333}, {10, -3.26667}}, color = {144, 5, 5}));
  connect(iTe.y, Te.T) annotation(
    Line(points = {{-119, 40}, {1, 40}}, color = {0, 0, 127}));
  connect(Hon.y, CH.ON) annotation(
    Line(points = {{-119, -16}, {-102, -16}}, color = {255, 0, 255}));
  connect(pressuriser.pwh_a, CH.pwh_a) annotation(
    Line(points = {{-82, -40}, {-110, -40}, {-110, -10}, {-102, -10}}, color = {46, 52, 54}));
  connect(pipeline.pwh_b, delivery.pwh_a) annotation(
    Line(points = {{22, -10}, {58, -10}}, color = {46, 52, 54}));
  connect(delivery.pwh_b, pressuriser.pwh_b) annotation(
    Line(points = {{82, -10}, {92, -10}, {92, -40}, {-58, -40}}, color = {46, 52, 54}));
  connect(iQload.y, load.Q) annotation(
    Line(points = {{-119, 60}, {62, 60}}, color = {0, 0, 127}));
  connect(load.surf, delivery.surf) annotation(
    Line(points = {{70, 52}, {70, -4}}, color = {144, 5, 5}));

annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 10000, Tolerance = 1e-6, Interval = 20),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end Heater_control_case_004;