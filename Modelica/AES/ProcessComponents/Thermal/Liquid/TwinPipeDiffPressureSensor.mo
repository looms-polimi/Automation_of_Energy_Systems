within AES.ProcessComponents.Thermal.Liquid;

model TwinPipeDiffPressureSensor
  outer System_settings.System_liquid system;
  Modelica.Blocks.Interfaces.RealOutput oDpHC annotation(
    Placement(visible = true, transformation(origin = {-66, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {20, 0}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Interfaces.pwhTwinPort tpwh_a annotation(
    Placement(visible = true, transformation(origin = {92, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {116, -2}, extent = {{16, -20}, {-16, 20}}, rotation = 0)));
equation
  tpwh_a.C.w = 0;
  tpwh_a.H.w = 0;
  
  tpwh_a.C.h = -1; /* meaningless, no flow */
  tpwh_a.H.h = -1;
  oDpHC      = tpwh_a.H.p-tpwh_a.C.p;

annotation(
    Icon(graphics = {Text(origin = {-38, -68}, extent = {{-60, 30}, {60, -30}}, textString = "%name"), Rectangle(origin = {71, 20}, fillColor = {238, 238, 236}, fillPattern = FillPattern.Solid, extent = {{-11, 60}, {11, -60}})}));
end TwinPipeDiffPressureSensor;