within AES.Coursework.ElecSys_case_studies;

model foo
  extends AES.Icons.CourseworkModel;
  AES.ProcessComponents.Electric.Generators_PAport.Generator_order0_prescribed_P Ge1(Prated = 100e6, Tox = 4) annotation(
    Placement(visible = true, transformation(origin = {88, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Electric.Loads_PAport.Load_prescribed_P L1 annotation(
    Placement(visible = true, transformation(origin = {150, 0}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Pe(y = if time < 1000 then 80e6 else 120e6) annotation(
    Placement(visible = true, transformation(origin = {190, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression fo(y = 50) annotation(
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback fes annotation(
    Placement(visible = true, transformation(origin = {-10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction C(a = {1, 1}, b = {80e6})  annotation(
    Placement(visible = true, transformation(origin = {34, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(L1.P, Pe.y) annotation(
    Line(points = {{160, 0}, {179, 0}}, color = {0, 0, 127}));
  connect(Ge1.port, L1.port) annotation(
    Line(points = {{98, 0}, {140, 0}}, color = {0, 0, 255}));
  connect(fo.y, fes.u1) annotation(
    Line(points = {{-39, 0}, {-18, 0}}, color = {0, 0, 127}));
  connect(Ge1.fg, fes.u2) annotation(
    Line(points = {{88, -10}, {88, -34}, {-10, -34}, {-10, -8}}, color = {0, 0, 127}));
  connect(fes.y, C.u) annotation(
    Line(points = {{0, 0}, {22, 0}}, color = {0, 0, 127}));
  connect(C.y, Ge1.Pcmd) annotation(
    Line(points = {{46, 0}, {78, 0}}, color = {0, 0, 127}));
protected
  annotation(
    Diagram(coordinateSystem(extent = {{-240, -120}, {240, 120}})),
    experiment(StartTime = 0, StopTime = 2000, Tolerance = 1e-6, Interval = 0.4),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end foo;