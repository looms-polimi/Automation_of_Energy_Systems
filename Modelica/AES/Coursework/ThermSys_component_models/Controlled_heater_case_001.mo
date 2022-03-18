within AES.Coursework.ThermSys_component_models;

model Controlled_heater_case_001
  extends AES.Icons.CourseworkModel;
  AES.ProcessComponents.Thermal.HVAC.ControlledLiquidHeater_ideal CH annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Pump_volumetric P(w0 = 1) annotation(
    Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube pipeline(L = 50, n = 20) annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression spT(y = 273.15 + 50) annotation(
    Placement(visible = true, transformation(origin = {-110, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression cmdP(y = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Convection_VecVec conv(A = 2, n = 20) annotation(
    Placement(visible = true, transformation(origin = {30, 36}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.surfTcond_prescribed Te(n = 20) annotation(
    Placement(visible = true, transformation(origin = {30, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression iTe(y = 273.15 + 20) annotation(
    Placement(visible = true, transformation(origin = {-110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression Hon(y = sin(time / 200) > 0) annotation(
    Placement(visible = true, transformation(origin = {-110, 4}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  inner ProcessComponents.Thermal.System_settings.System_liquid system annotation(
    Placement(visible = true, transformation(origin = {-170, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Node_pT_fixed src annotation(
    Placement(visible = true, transformation(origin = {-150, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Node_pT_fixed snk annotation(
    Placement(visible = true, transformation(origin = {70, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tsensor t1 annotation(
    Placement(visible = true, transformation(origin = {-72, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.Liquid.Tsensor t2 annotation(
    Placement(visible = true, transformation(origin = {-28, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(CH.pwh_b, P.pwh_a) annotation(
    Line(points = {{-58, 10}, {-42, 10}}, color = {46, 52, 54}));
  connect(P.pwh_b, pipeline.pwh_a) annotation(
    Line(points = {{-18, 10}, {18, 10}}, color = {46, 52, 54}));
  connect(spT.y, CH.To) annotation(
    Line(points = {{-99, 16}, {-82, 16}}, color = {0, 0, 127}));
  connect(cmdP.y, P.cmd) annotation(
    Line(points = {{-99, 40}, {-30, 40}, {-30, 18}}, color = {0, 0, 127}));
  connect(Te.surf, conv.surf_B) annotation(
    Line(points = {{30, 51}, {30, 42}}, color = {144, 5, 5}));
  connect(conv.surf_A, pipeline.surf) annotation(
    Line(points = {{30, 30}, {30, 16}}, color = {144, 5, 5}));
  connect(iTe.y, Te.T) annotation(
    Line(points = {{-99, 60}, {21, 60}}, color = {0, 0, 127}));
  connect(Hon.y, CH.ON) annotation(
    Line(points = {{-98, 4}, {-82, 4}}, color = {255, 0, 255}));
  connect(src.pwh_a, CH.pwh_a) annotation(
    Line(points = {{-138, 10}, {-82, 10}}, color = {46, 52, 54}));
  connect(pipeline.pwh_b, snk.pwh_a) annotation(
    Line(points = {{42, 10}, {58, 10}}, color = {46, 52, 54}));
  connect(P.pwh_a, t1.pwh_a) annotation(
    Line(points = {{-42, 10}, {-42, -34}, {-60, -34}}, color = {46, 52, 54}));
  connect(P.pwh_b, t2.pwh_a) annotation(
    Line(points = {{-18, 10}, {-2, 10}, {-2, -32}, {-16, -32}}, color = {46, 52, 54}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 2000, Tolerance = 1e-6, Interval = 4),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end Controlled_heater_case_001;