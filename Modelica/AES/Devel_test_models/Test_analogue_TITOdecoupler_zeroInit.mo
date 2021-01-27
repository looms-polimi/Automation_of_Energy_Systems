within AES.Devel_test_models;

model Test_analogue_TITOdecoupler_zeroInit
  extends Icons.TestModel;
  Modelica.Blocks.Sources.RealExpression u2(y = if time < 10 then 0 else 1) annotation(
    Placement(visible = true, transformation(origin = {-110, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression u1(y = if time < 1 then 0 else 1) annotation(
    Placement(visible = true, transformation(origin = {-110, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessBlocks.TITO_rational_zeroInit Pdec annotation(
    Placement(visible = true, transformation(origin = {50,0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.TITOdecoupler_zeroInit D annotation(
    Placement(visible = true, transformation(origin = {-2, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add ad1 annotation(
    Placement(visible = true, transformation(origin = {-50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add ad2 annotation(
    Placement(visible = true, transformation(origin = {-52, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessBlocks.TITO_rational_zeroInit P annotation(
    Placement(visible = true, transformation(origin = {50, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(u1.y, ad1.u1) annotation(
    Line(points = {{-99, 26}, {-62, 26}}, color = {0, 0, 127}));
  connect(u1.y, P.u1) annotation(
    Line(points = {{-99, 26}, {-80, 26}, {-80, -46}, {40, -46}}, color = {0, 0, 127}));
  connect(D.CS1, Pdec.u1) annotation(
    Line(points = {{8, 4}, {40, 4}}, color = {0, 0, 127}));
  connect(D.CS2, Pdec.u2) annotation(
    Line(points = {{8, -4}, {40, -4}}, color = {0, 0, 127}));
  connect(u2.y, P.u2) annotation(
    Line(points = {{-98, -26}, {-86, -26}, {-86, -54}, {40, -54}, {40, -54}}, color = {0, 0, 127}));
  connect(D.BiasToC2, ad2.u1) annotation(
    Line(points = {{-12, -4}, {-72, -4}, {-72, -14}, {-64, -14}, {-64, -14}}, color = {0, 0, 127}));
  connect(D.BiasToC1, ad1.u2) annotation(
    Line(points = {{-12, 4}, {-72, 4}, {-72, 14}, {-62, 14}, {-62, 14}}, color = {0, 0, 127}));
  connect(u2.y, ad2.u2) annotation(
    Line(points = {{-98, -26}, {-66, -26}, {-66, -26}, {-64, -26}}, color = {0, 0, 127}));
  connect(ad2.y, D.CSfromC2) annotation(
    Line(points = {{-40, -20}, {-24, -20}, {-24, -8}, {-12, -8}, {-12, -8}}, color = {0, 0, 127}));
  connect(ad1.y, D.CSfromC1) annotation(
    Line(points = {{-38, 20}, {-24, 20}, {-24, 8}, {-12, 8}, {-12, 8}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 25, Tolerance = 1e-06, Interval = 0.05));
end Test_analogue_TITOdecoupler_zeroInit;
