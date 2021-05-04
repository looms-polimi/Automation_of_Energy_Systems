within AES.Devel_test_models;

model foo
  ProcessComponents.Thermal.Liquid.Node_pT_fixed node_pT_fixed(p = 120000)  annotation(
    Placement(visible = true, transformation(origin = {-70, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Node_pT_fixed node_pT_fixed1 annotation(
    Placement(visible = true, transformation(origin = {58, -22}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  inner ProcessComponents.Thermal.System_settings.System_liquid system annotation(
    Placement(visible = true, transformation(origin = {-68, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.Liquid.TubeStream tubeStream annotation(
    Placement(visible = true, transformation(origin = {-22, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.Liquid.TubeStream tubeStream1 annotation(
    Placement(visible = true, transformation(origin = {12, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.Liquid.TubeStream tubeStream2 annotation(
    Placement(visible = true, transformation(origin = {-28, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(node_pT_fixed.pwh_a, tubeStream.pwh_a) annotation(
    Line(points = {{-58, -20}, {-34, -20}, {-34, 30}}, color = {46, 52, 54}));
  connect(node_pT_fixed.pwh_a, tubeStream2.pwh_a) annotation(
    Line(points = {{-58, -20}, {-46, -20}, {-46, -42}, {-40, -42}}, color = {46, 52, 54}));
  connect(tubeStream.pwh_b, tubeStream1.pwh_a) annotation(
    Line(points = {{-10, 30}, {0, 30}, {0, 10}}, color = {46, 52, 54}));
  connect(tubeStream1.pwh_b, node_pT_fixed1.pwh_a) annotation(
    Line(points = {{24, 10}, {46, 10}, {46, -22}}, color = {46, 52, 54}));
  connect(tubeStream2.pwh_b, node_pT_fixed1.pwh_a) annotation(
    Line(points = {{-16, -42}, {46, -42}, {46, -22}}, color = {46, 52, 54}));
end foo;