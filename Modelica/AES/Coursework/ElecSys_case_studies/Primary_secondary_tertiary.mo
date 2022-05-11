within AES.Coursework.ElecSys_case_studies;

model Primary_secondary_tertiary
  extends AES.Icons.CourseworkModel;
  Modelica.Blocks.Continuous.TransferFunction g1(a = {10, 1}, b = {100e6}) annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction g2(a = {5, 1}, b = {100e6}) annotation(
    Placement(visible = true, transformation(origin = {50, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain beta1(k = 0.5) annotation(
    Placement(visible = true, transformation(origin = {-70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Math.Gain beta2(k = 0.5) annotation(
    Placement(visible = true, transformation(origin = {-30, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.Integrator Cs(k = 0.01) annotation(
    Placement(visible = true, transformation(origin = {-110, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction Cp1(a = {1}, b = {1}) annotation(
    Placement(visible = true, transformation(origin = {-110, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction Cp2(a = {1}, b = {1}) annotation(
    Placement(visible = true, transformation(origin = {-110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Electric.Generators_PAport.Generator_order0_prescribed_P Ge1(Prated = 100e6) annotation(
    Placement(visible = true, transformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Electric.Generators_PAport.Generator_order0_prescribed_P Ge2(Prated = 100e6) annotation(
    Placement(visible = true, transformation(origin = {90, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback fe1 annotation(
    Placement(visible = true, transformation(origin = {-150, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback fe2 annotation(
    Placement(visible = true, transformation(origin = {-150, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback fes annotation(
    Placement(visible = true, transformation(origin = {-150, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression fo(y = 50) annotation(
    Placement(visible = true, transformation(origin = {-190, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Electric.Loads_PAport.Load_prescribed_P L1 annotation(
    Placement(visible = true, transformation(origin = {148, 0}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Pe(y = if time < 1000 then 80e6 else 120e6) annotation(
    Placement(visible = true, transformation(origin = {190, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 pst1 annotation(
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 pst2 annotation(
    Placement(visible = true, transformation(origin = {-10, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression tc1(y = 0.4)  annotation(
    Placement(visible = true, transformation(origin = {-190, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression tc2(y = 0.4)  annotation(
    Placement(visible = true, transformation(origin = {-190, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Cs.y, beta1.u) annotation(
    Line(points = {{-99, 90}, {-70, 90}, {-70, 82}}, color = {0, 0, 127}));
  connect(Cs.y, beta2.u) annotation(
    Line(points = {{-99, 90}, {-30, 90}, {-30, 82}}, color = {0, 0, 127}));
  connect(g1.y, Ge1.Pcmd) annotation(
    Line(points = {{61, 0}, {80, 0}}, color = {0, 0, 127}));
  connect(g2.y, Ge2.Pcmd) annotation(
    Line(points = {{61, -60}, {80, -60}}, color = {0, 0, 127}));
  connect(Ge1.fg, fe1.u2) annotation(
    Line(points = {{90, -10}, {90, -40}, {-150, -40}, {-150, -28}}, color = {0, 0, 127}));
  connect(Ge2.fg, fe2.u2) annotation(
    Line(points = {{90, -70}, {90, -100}, {-150, -100}, {-150, -88}}, color = {0, 0, 127}));
  connect(fe1.y, Cp1.u) annotation(
    Line(points = {{-141, -20}, {-122, -20}}, color = {0, 0, 127}));
  connect(fe2.y, Cp2.u) annotation(
    Line(points = {{-141, -80}, {-122, -80}}, color = {0, 0, 127}));
  connect(fes.y, Cs.u) annotation(
    Line(points = {{-141, 90}, {-122, 90}}, color = {0, 0, 127}));
  connect(fo.y, fes.u1) annotation(
    Line(points = {{-179, 90}, {-158, 90}}, color = {0, 0, 127}));
  connect(fo.y, fe1.u1) annotation(
    Line(points = {{-179, 90}, {-169, 90}, {-169, -20}, {-158, -20}}, color = {0, 0, 127}));
  connect(fo.y, fe2.u1) annotation(
    Line(points = {{-179, 90}, {-169, 90}, {-169, -80}, {-158, -80}}, color = {0, 0, 127}));
  connect(Ge1.port, Ge2.port) annotation(
    Line(points = {{100, 0}, {120, 0}, {120, -60}, {100, -60}}, color = {0, 0, 255}));
  connect(L1.P, Pe.y) annotation(
    Line(points = {{158, 0}, {179, 0}}, color = {0, 0, 127}));
  connect(Ge1.port, L1.port) annotation(
    Line(points = {{100, 0}, {138, 0}}, color = {0, 0, 255}));
  connect(L1.fl, fes.u2) annotation(
    Line(points = {{148, 10}, {148, 40}, {-150, 40}, {-150, 82}}, color = {0, 0, 127}));
  connect(Cp1.y, pst1.u3) annotation(
    Line(points = {{-99, -20}, {-70.5, -20}, {-70.5, -8}, {-62, -8}}, color = {0, 0, 127}));
  connect(beta1.y, pst1.u2) annotation(
    Line(points = {{-70, 59}, {-70, 0}, {-62, 0}}, color = {0, 0, 127}));
  connect(beta2.y, pst2.u2) annotation(
    Line(points = {{-30, 60}, {-30, -60}, {-22, -60}}, color = {0, 0, 127}));
  connect(pst2.y, g2.u) annotation(
    Line(points = {{2, -60}, {38, -60}}, color = {0, 0, 127}));
  connect(Cp2.y, pst2.u3) annotation(
    Line(points = {{-99, -80}, {-30.5, -80}, {-30.5, -68}, {-22, -68}}, color = {0, 0, 127}));
  connect(pst1.y, g1.u) annotation(
    Line(points = {{-38, 0}, {38, 0}}, color = {0, 0, 127}));
  connect(tc1.y, pst1.u1) annotation(
    Line(points = {{-179, 8}, {-62, 8}}, color = {0, 0, 127}));
  connect(tc2.y, pst2.u1) annotation(
    Line(points = {{-179, -52}, {-22, -52}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-240, -120}, {240, 120}})),
    experiment(StartTime = 0, StopTime = 2000, Tolerance = 1e-6, Interval = 0.4),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end Primary_secondary_tertiary;