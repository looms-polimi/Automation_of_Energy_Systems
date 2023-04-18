within AES.Coursework.ElecSys_power_frequency_control;

model PA_islanded_generator_loadDroop
  extends AES.Icons.CourseworkModel;

  Modelica.Blocks.Sources.RealExpression dPe(y =  20e6 * (if time < 600 then 1 else 1.1))  annotation(
    Placement(visible = true, transformation(origin = {-30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction g(a = {1, 2, 1}, b = {30e6})  annotation(
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression fo(y = 50)  annotation(
    Placement(visible = true, transformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Electric.Loads_PAport.Load_linear_droop L(Pnom = 20e6)  annotation(
    Placement(visible = true, transformation(origin = {8, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.LimPID Cps(Ti = 80, controllerType = .Modelica.Blocks.Types.SimpleController.PI, k = 0.15, yMax = 1, yMin = 0)  annotation(
    Placement(visible = true, transformation(origin = {-68, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Electric.Generators_PAport.Generator_order0_prescribed_P G(Tox = 0.8, xi = 0.3)  annotation(
    Placement(visible = true, transformation(origin = {8, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(dPe.y, L.Preq) annotation(
    Line(points = {{-18, 30}, {-2, 30}}, color = {0, 0, 127}));
  connect(fo.y, Cps.u_s) annotation(
    Line(points = {{-99, 0}, {-80, 0}}, color = {0, 0, 127}));
  connect(Cps.y, g.u) annotation(
    Line(points = {{-57, 0}, {-42, 0}}, color = {0, 0, 127}));
  connect(g.y, G.Pcmd) annotation(
    Line(points = {{-18, 0}, {-2, 0}}, color = {0, 0, 127}));
  connect(G.fg, Cps.u_m) annotation(
    Line(points = {{8, -10}, {8, -30}, {-68, -30}, {-68, -12}}, color = {0, 0, 127}));
  connect(L.port, G.port) annotation(
    Line(points = {{18, 30}, {28, 30}, {28, 0}, {18, 0}}, color = {0, 0, 255}));  protected
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 1000, Tolerance = 1e-6, Interval = 0.1),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));

end PA_islanded_generator_loadDroop;