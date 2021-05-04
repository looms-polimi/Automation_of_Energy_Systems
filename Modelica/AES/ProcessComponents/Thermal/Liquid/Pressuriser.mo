within AES.ProcessComponents.Thermal.Liquid;

model Pressuriser
  parameter SI.Pressure p=101325;
  AES.ProcessComponents.Thermal.Interfaces.pwhPort pwh_a annotation(
    Placement(visible = true, transformation(origin = {0, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Interfaces.pwhPort pwh_b annotation(
    Placement(visible = true, transformation(origin = {10, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  pwh_a.p = p;
  pwh_b.p = p;
  pwh_a.h = inStream(pwh_b.h);
  pwh_b.h = inStream(pwh_a.h);
annotation(
    Icon(graphics = {Rectangle(origin = {0, -60}, lineColor = {46, 52, 54}, fillColor = {211, 215, 207}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, 20}, {100, -20}}), Polygon(origin = {2, -31}, lineColor = {46, 52, 54}, fillColor = {211, 215, 207}, fillPattern = FillPattern.VerticalCylinder, points = {{-20, 51}, {20, 51}, {20, -9}, {0, -29}, {-20, -9}, {-20, 51}}), Rectangle(origin = {1.06581e-13, 30}, rotation = -90, lineColor = {46, 52, 54}, fillColor = {211, 215, 207}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-50, 60}, {50, -60}})}));
end Pressuriser;