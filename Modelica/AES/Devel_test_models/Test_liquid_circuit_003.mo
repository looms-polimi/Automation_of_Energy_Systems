within AES.Devel_test_models;

model Test_liquid_circuit_003
  extends Icons.TestModel;
  inner AES.ProcessComponents.Thermal.System_settings.System_liquid system annotation(
    Placement(visible = true, transformation(origin = {-170, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Node_pT_fixed snk(p(displayUnit = "Pa")) annotation(
    Placement(visible = true, transformation(origin = {128, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Node_pT_prescribed src annotation(
    Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression pi(y = 101315)  annotation(
    Placement(visible = true, transformation(origin = {-112, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Ti(y = 293.15)  annotation(
    Placement(visible = true, transformation(origin = {-112, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression cmdP(y = if time < 500 then 0.1 else 0.2) annotation(
    Placement(visible = true, transformation(origin = {-112, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression xV(y = -50) annotation(
    Placement(visible = true, transformation(origin = {-112, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube tube annotation(
    Placement(visible = true, transformation(origin = {90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.surfQcond_prescribed Q annotation(
    Placement(visible = true, transformation(origin = {90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Pump_volumetric pumpV(w0 = 0.2)  annotation(
    Placement(visible = true, transformation(origin = {-30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.HVAC.ControlledLiquidHeater_ideal H annotation(
    Placement(visible = true, transformation(origin = {32, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression spTf(y = 313.25) annotation(
    Placement(visible = true, transformation(origin = {-10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression Hon(y = sin(time / 50) > 0)  annotation(
    Placement(visible = true, transformation(origin = {-10, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Ti.y, src.T) annotation(
    Line(points = {{-101, -36}, {-80, -36}}, color = {0, 0, 127}));
  connect(pi.y, src.p) annotation(
    Line(points = {{-101, -10}, {-93, -10}, {-93, -24}, {-80, -24}}, color = {0, 0, 127}));
  connect(tube.pwh_b, snk.pwh_a) annotation(
    Line(points = {{102, -30}, {116, -30}}, color = {46, 52, 54}));
  connect(xV.y, Q.Q) annotation(
    Line(points = {{-101, 30}, {82, 30}}, color = {0, 0, 127}));
  connect(Q.surf, tube.surf) annotation(
    Line(points = {{90, 21.3333}, {90, -24.6667}}, color = {144, 5, 5}));
  connect(src.pwh_a, pumpV.pwh_a) annotation(
    Line(points = {{-58, -30}, {-42, -30}}, color = {46, 52, 54}));
  connect(cmdP.y, pumpV.cmd) annotation(
    Line(points = {{-100, 10}, {-30, 10}, {-30, -22}}, color = {0, 0, 127}));
  connect(pumpV.pwh_b, H.pwh_a) annotation(
    Line(points = {{-18, -30}, {20, -30}}, color = {46, 52, 54}));
  connect(H.pwh_b, tube.pwh_a) annotation(
    Line(points = {{44, -30}, {78, -30}}, color = {46, 52, 54}));
  connect(spTf.y, H.To) annotation(
    Line(points = {{2, 0}, {10, 0}, {10, -26}, {24, -26}}, color = {0, 0, 127}));
  connect(Hon.y, H.ON) annotation(
    Line(points = {{2, 16}, {14, 16}, {14, -24}, {24, -24}}, color = {255, 0, 255}));
protected
  annotation(
    experiment(StartTime = 0, StopTime = 1000, Tolerance = 1e-6, Interval = 0.1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})));
end Test_liquid_circuit_003;