within AES.ProcessComponents.Thermal.Interfaces;

model pwhPortSplitter
  AES.ProcessComponents.Thermal.Interfaces.pwhTwinPort pwhTwin_HC annotation(
    Placement(visible = true, transformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-116, 0}, extent = {{-16, -20}, {16, 20}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Interfaces.pwhPort pwh_H annotation(
    Placement(visible = true, transformation(origin = {50, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Interfaces.pwhPort pwh_C annotation(
    Placement(visible = true, transformation(origin = {50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(pwh_H, pwhTwin_HC.H) annotation(
    Line(points = {{50, 32}, {0, 32}, {0, 0}, {-110, 0}}, color = {46, 52, 54}));
  connect(pwhTwin_HC.C, pwh_C) annotation(
    Line(points = {{-110, 0}, {0, 0}, {0, -30}, {50, -30}}));

annotation(
    Icon(graphics = {Polygon(origin = {0, 50}, fillColor = {239, 41, 41}, fillPattern = FillPattern.Solid, points = {{-100, -30}, {40, -30}, {40, 20}, {100, 20}, {100, -2}, {60, -2}, {60, -50}, {-100, -50}, {-100, -30}}), Polygon(origin = {2, -110}, fillColor = {32, 74, 135}, fillPattern = FillPattern.Solid, points = {{-102, 90}, {38, 90}, {38, 38}, {98, 38}, {98, 62}, {58, 62}, {58, 110}, {-102, 110}, {-102, 90}}), Text(origin = {17, 59}, extent = {{-47, 29}, {47, -29}}, textString = "H"), Text(origin = {17, -61}, extent = {{-47, 29}, {47, -29}}, textString = "C")}));
end pwhPortSplitter;