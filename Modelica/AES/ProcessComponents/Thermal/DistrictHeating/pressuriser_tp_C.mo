within AES.ProcessComponents.Thermal.DistrictHeating;

model pressuriser_tp_C
  extends Interfaces.flowTwoTwinPorts_pwh;
  parameter SI.Pressure pC=101325 "prescribed pressure on C pipe";
  AES.ProcessComponents.Thermal.Liquid.Pressuriser ppri(p = pC)  annotation(
    Placement(visible = true, transformation(origin = {0, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Interfaces.pwhPortSplitter split_a annotation(
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Interfaces.pwhPortSplitter split_b annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(split_a.pwh_C, ppri.pwh_a) annotation(
    Line(points = {{-38, -6}, {-20, -6}, {-20, -20}, {-12, -20}}, color = {46, 52, 54}));
  connect(split_b.pwh_C, ppri.pwh_b) annotation(
    Line(points = {{38, -6}, {20, -6}, {20, -20}, {12, -20}}, color = {46, 52, 54}));
  connect(split_a.pwh_H, split_b.pwh_H) annotation(
    Line(points = {{-38, 6}, {38, 6}}, color = {46, 52, 54}));
  connect(tpwh_a, split_a.pwhTwin_HC) annotation(
    Line(points = {{-110, 0}, {-62, 0}}));
  connect(split_b.pwhTwin_HC, tpwh_b) annotation(
    Line(points = {{62, 0}, {110, 0}}));
protected
annotation(
    Icon(graphics = {Rectangle(origin = {0, 48}, rotation = -90, lineColor = {46, 52, 54}, fillColor = {211, 215, 207}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-16, 20}, {16, -20}}), Rectangle(origin = {0, -9}, lineColor = {46, 52, 54}, fillColor = {114, 159, 207}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, 5}, {100, -5}}), Polygon(origin = {0, -9}, lineColor = {46, 52, 54}, fillColor = {114, 159, 207}, fillPattern = FillPattern.VerticalCylinder, points = {{-6, 41}, {6, 41}, {6, 5}, {0, -1}, {-6, 5}, {-6, 41}}), Rectangle(origin = {0, 9}, lineColor = {46, 52, 54}, fillColor = {239, 41, 41}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, 5}, {100, -5}})}));
end pressuriser_tp_C;