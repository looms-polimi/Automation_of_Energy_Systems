within AES.Coursework.ElecSys_power_frequency_control;

model PA_two_generators_loadDroop
  extends AES.Icons.CourseworkModel;
  Modelica.Blocks.Continuous.TransferFunction G1(a = {10, 1}, b = {10e6}*0.2) annotation(
    Placement(visible = true, transformation(origin = {44, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction G2(a = {15, 1}, b = {30e6}) annotation(
    Placement(visible = true, transformation(origin = {44, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add as1 annotation(
    Placement(visible = true, transformation(origin = {-36, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add as2 annotation(
    Placement(visible = true, transformation(origin = {4, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain beta1(k = 0.25) annotation(
    Placement(visible = true, transformation(origin = {-56, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Math.Gain beta2(k = 0.75) annotation(
    Placement(visible = true, transformation(origin = {-16, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.Integrator Cs(k = 0.03*0.5) annotation(
    Placement(visible = true, transformation(origin = {-96, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction Cp1(a = {1}, b = {1.5}) annotation(
    Placement(visible = true, transformation(origin = {-76, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction Cp2(a = {1}, b = {1.5})  annotation(
    Placement(visible = true, transformation(origin = {-76, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Electric.Generators_PAport.Generator_order0_prescribed_P Ge1(Prated = 10e6, Tox = 2, dnom = 10, xi = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Electric.Generators_PAport.Generator_order0_prescribed_P Ge2(Tox = 3, dnom = 10)  annotation(
    Placement(visible = true, transformation(origin = {80, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback fe1 annotation(
    Placement(visible = true, transformation(origin = {-108, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback fe2 annotation(
    Placement(visible = true, transformation(origin = {-108, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback fes annotation(
    Placement(visible = true, transformation(origin = {-128, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression fo(y = 50)  annotation(
    Placement(visible = true, transformation(origin = {-170, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Electric.Loads_PAport.Load_prescribed_P L1 annotation(
    Placement(visible = true, transformation(origin = {120, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Electric.Loads_PAport.Load_linear_droop L2 annotation(
    Placement(visible = true, transformation(origin = {120, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Pe1(y = 35e6)  annotation(
    Placement(visible = true, transformation(origin = {160, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Pe2(y = if time < 500 then 5e6 else 15e6)  annotation(
    Placement(visible = true, transformation(origin = {160, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(beta2.y, as2.u1) annotation(
    Line(points = {{-16, 39}, {-16, -34}, {-8, -34}}, color = {0, 0, 127}));
  connect(beta1.y, as1.u1) annotation(
    Line(points = {{-56, 39}, {-56, 6}, {-48, 6}}, color = {0, 0, 127}));
  connect(as1.y, G1.u) annotation(
    Line(points = {{-25, 0}, {32, 0}}, color = {0, 0, 127}));
  connect(Cs.y, beta1.u) annotation(
    Line(points = {{-85, 80}, {-57, 80}, {-57, 62}}, color = {0, 0, 127}));
  connect(Cs.y, beta2.u) annotation(
    Line(points = {{-85, 80}, {-17, 80}, {-17, 62}}, color = {0, 0, 127}));
  connect(Cp1.y, as1.u2) annotation(
    Line(points = {{-65, -6}, {-48, -6}}, color = {0, 0, 127}));
  connect(Cp2.y, as2.u2) annotation(
    Line(points = {{-65, -46}, {-8, -46}}, color = {0, 0, 127}));
  connect(as2.y, G2.u) annotation(
    Line(points = {{15, -40}, {32, -40}}, color = {0, 0, 127}));
  connect(G1.y, Ge1.Pcmd) annotation(
    Line(points = {{55, 0}, {70, 0}}, color = {0, 0, 127}));
  connect(G2.y, Ge2.Pcmd) annotation(
    Line(points = {{55, -40}, {70, -40}}, color = {0, 0, 127}));
  connect(Ge1.fg, fe1.u2) annotation(
    Line(points = {{80, -10}, {80, -20}, {-108, -20}, {-108, -14}}, color = {0, 0, 127}));
  connect(Ge2.fg, fe2.u2) annotation(
    Line(points = {{80, -50}, {80, -62}, {-108, -62}, {-108, -54}}, color = {0, 0, 127}));
  connect(fe1.y, Cp1.u) annotation(
    Line(points = {{-99, -6}, {-89, -6}}, color = {0, 0, 127}));
  connect(fe2.y, Cp2.u) annotation(
    Line(points = {{-99, -46}, {-89, -46}}, color = {0, 0, 127}));
  connect(fes.y, Cs.u) annotation(
    Line(points = {{-119, 80}, {-109, 80}}, color = {0, 0, 127}));
  connect(fo.y, fes.u1) annotation(
    Line(points = {{-159, 80}, {-137, 80}}, color = {0, 0, 127}));
  connect(fo.y, fe1.u1) annotation(
    Line(points = {{-159, 80}, {-149, 80}, {-149, -6}, {-117, -6}}, color = {0, 0, 127}));
  connect(fo.y, fe2.u1) annotation(
    Line(points = {{-159, 80}, {-149, 80}, {-149, -46}, {-117, -46}}, color = {0, 0, 127}));
  connect(L1.port, L2.port) annotation(
    Line(points = {{110, 50}, {100, 50}, {100, 0}, {110, 0}}, color = {0, 0, 255}));
  connect(L2.port, Ge1.port) annotation(
    Line(points = {{110, 0}, {90, 0}}, color = {0, 0, 255}));
  connect(Ge1.port, Ge2.port) annotation(
    Line(points = {{90, 0}, {100, 0}, {100, -40}, {90, -40}}, color = {0, 0, 255}));
  connect(L1.fl, fes.u2) annotation(
    Line(points = {{120, 40}, {120, 28}, {-128, 28}, {-128, 72}}, color = {0, 0, 127}));
  connect(L2.Preq, Pe2.y) annotation(
    Line(points = {{130, 0}, {150, 0}}, color = {0, 0, 127}));
  connect(L1.P, Pe1.y) annotation(
    Line(points = {{130, 50}, {150, 50}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 1000, Tolerance = 1e-6, Interval = 0.2),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));

end PA_two_generators_loadDroop;