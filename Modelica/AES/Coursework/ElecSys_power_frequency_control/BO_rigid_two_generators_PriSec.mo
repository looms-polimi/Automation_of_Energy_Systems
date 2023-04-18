within AES.Coursework.ElecSys_power_frequency_control;

model BO_rigid_two_generators_PriSec
  extends AES.Icons.CourseworkModel;
  Modelica.Blocks.Sources.RealExpression DPe(y = if time < 10 then 0 else 5) annotation(
    Placement(visible = true, transformation(origin = {68, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback Pbal annotation(
    Placement(visible = true, transformation(origin = {108, -20}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator N(k = 1 / 1000) annotation(
    Placement(visible = true, transformation(origin = {148, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain fb(k = -1) annotation(
    Placement(visible = true, transformation(origin = {68, -70}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction g1(a = {5, 1}, b = {1}) annotation(
    Placement(visible = true, transformation(origin = {-12, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction g2(a = {5, 1}, b = {1}) annotation(
    Placement(visible = true, transformation(origin = {-12, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain Pn1(k = 10) annotation(
    Placement(visible = true, transformation(origin = {28, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain Pn2(k = 30) annotation(
    Placement(visible = true, transformation(origin = {28, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add Ptot annotation(
    Placement(visible = true, transformation(origin = {68, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add as1 annotation(
    Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add as2 annotation(
    Placement(visible = true, transformation(origin = {-50, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain beta1(k = 0.25) annotation(
    Placement(visible = true, transformation(origin = {-110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Math.Gain beta2(k = 0.75) annotation(
    Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.Integrator Cs(k = 0.03) annotation(
    Placement(visible = true, transformation(origin = {-150, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction Cp1(a = {1}, b = {5}) annotation(
    Placement(visible = true, transformation(origin = {-150, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction Cp2(a = {1}, b = {5})  annotation(
    Placement(visible = true, transformation(origin = {-150, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Pbal.y, N.u) annotation(
    Line(points = {{117, -20}, {135, -20}}, color = {0, 0, 127}));
  connect(N.y, fb.u) annotation(
    Line(points = {{159, -20}, {177, -20}, {177, -70}, {80, -70}}, color = {0, 0, 127}));
  connect(DPe.y, Pbal.u2) annotation(
    Line(points = {{79, 20}, {107, 20}, {107, -12}}, color = {0, 0, 127}));
  connect(Pn1.y, Ptot.u1) annotation(
    Line(points = {{39, 0}, {47, 0}, {47, -14}, {55, -14}}, color = {0, 0, 127}));
  connect(Pn2.y, Ptot.u2) annotation(
    Line(points = {{39, -40}, {47, -40}, {47, -26}, {55, -26}}, color = {0, 0, 127}));
  connect(g1.y, Pn1.u) annotation(
    Line(points = {{-1, 0}, {15, 0}}, color = {0, 0, 127}));
  connect(g2.y, Pn2.u) annotation(
    Line(points = {{-1, -40}, {15, -40}}, color = {0, 0, 127}));
  connect(Ptot.y, Pbal.u1) annotation(
    Line(points = {{79, -20}, {99, -20}}, color = {0, 0, 127}));
  connect(beta2.y, as2.u1) annotation(
    Line(points = {{-70, 39}, {-70, -34}, {-62, -34}}, color = {0, 0, 127}));
  connect(beta1.y, as1.u1) annotation(
    Line(points = {{-110, 39}, {-110, 6}, {-102, 6}}, color = {0, 0, 127}));
  connect(as1.y, g1.u) annotation(
    Line(points = {{-79, 0}, {-25, 0}}, color = {0, 0, 127}));
  connect(Cs.y, beta1.u) annotation(
    Line(points = {{-138, 80}, {-110, 80}, {-110, 62}}, color = {0, 0, 127}));
  connect(Cs.y, beta2.u) annotation(
    Line(points = {{-138, 80}, {-70, 80}, {-70, 62}}, color = {0, 0, 127}));
  connect(Cp1.y, as1.u2) annotation(
    Line(points = {{-138, -6}, {-102, -6}}, color = {0, 0, 127}));
  connect(Cp2.y, as2.u2) annotation(
    Line(points = {{-139, -46}, {-62, -46}}, color = {0, 0, 127}));
  connect(fb.y, Cp2.u) annotation(
    Line(points = {{58, -70}, {-180, -70}, {-180, -46}, {-162, -46}}, color = {0, 0, 127}));
  connect(Cp2.u, Cp1.u) annotation(
    Line(points = {{-162, -46}, {-180, -46}, {-180, -6}, {-162, -6}}, color = {0, 0, 127}));
  connect(Cp1.u, Cs.u) annotation(
    Line(points = {{-162, -6}, {-180, -6}, {-180, 80}, {-162, 80}}, color = {0, 0, 127}));
  connect(as2.y, g2.u) annotation(
    Line(points = {{-39, -40}, {-24, -40}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 600, Tolerance = 1e-6, Interval = 1.2),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end BO_rigid_two_generators_PriSec;