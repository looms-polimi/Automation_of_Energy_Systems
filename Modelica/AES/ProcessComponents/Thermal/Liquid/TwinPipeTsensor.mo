within AES.ProcessComponents.Thermal.Liquid;

model TwinPipeTsensor
  outer System_settings.System_liquid system;
  Modelica.Blocks.Interfaces.RealOutput oTh annotation(
    Placement(visible = true, transformation(origin = {-76, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {20, 60}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput oTc annotation(
    Placement(visible = true, transformation(origin = {-66, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {20, 0}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Interfaces.pwhTwinPort tpwh_a annotation(
    Placement(visible = true, transformation(origin = {92, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {116, -2}, extent = {{16, -20}, {-16, 20}}, rotation = 0)));
equation
  tpwh_a.C.w = 0;
  tpwh_a.H.w = 0;
  
  tpwh_a.C.h = -1; /* meaningless, no flow */
  tpwh_a.H.h = -1;
  
  oTc =inStream(tpwh_a.C.h)/system.cp;
  oTh =inStream(tpwh_a.H.h)/system.cp;

annotation(
    Icon(graphics = {Ellipse(origin = {70, 44}, lineColor = {239, 41, 41}, fillColor = {239, 41, 41}, fillPattern = FillPattern.Solid, extent = {{-10, 10}, {10, -10}}, endAngle = 360), Ellipse(origin = {70, 78}, lineColor = {239, 41, 41}, fillColor = {239, 41, 41}, fillPattern = FillPattern.Solid, extent = {{-6, 4}, {6, -4}}, endAngle = 360), Rectangle(origin = {70, 64}, lineColor = {239, 41, 41}, fillColor = {239, 41, 41}, fillPattern = FillPattern.Solid, extent = {{-6, 14}, {6, -14}}), Text(origin = {-38, -68}, extent = {{-60, 30}, {60, -30}}, textString = "%name"), Rectangle(origin = {70, 6}, lineColor = {0, 0, 240}, fillColor = {0, 0, 240}, fillPattern = FillPattern.Solid, extent = {{-6, 14}, {6, -14}}), Ellipse(origin = {70, 18}, lineColor = {0, 0, 240}, fillColor = {0, 0, 240}, fillPattern = FillPattern.Solid, extent = {{-6, 4}, {6, -4}}, endAngle = 360), Ellipse(origin = {70, -14}, lineColor = {0, 0, 240}, fillColor = {0, 0, 240}, fillPattern = FillPattern.Solid, extent = {{-10, 10}, {10, -10}}, endAngle = 360)}));
end TwinPipeTsensor;