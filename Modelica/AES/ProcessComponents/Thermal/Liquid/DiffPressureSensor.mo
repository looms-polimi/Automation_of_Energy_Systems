within AES.ProcessComponents.Thermal.Liquid;

model DiffPressureSensor
  outer System_settings.System_liquid system;
  Modelica.Blocks.Interfaces.RealOutput oDp annotation(
    Placement(visible = true, transformation(origin = {-66, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {20, 0}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Interfaces.pwhPort pwh_hi annotation(
    Placement(visible = true, transformation(origin = {138, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Interfaces.pwhPort pwh_lo annotation(
    Placement(visible = true, transformation(origin = {148, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  pwh_hi.w = 0;
  pwh_lo.w = 0;
  
  pwh_hi.h = -1; /* meaningless, no flow */
  pwh_lo.h = -1;
  oDp      = pwh_hi.p-pwh_lo.p;

annotation(
    Icon(graphics = {Text(origin = {-38, -68}, extent = {{-60, 30}, {60, -30}}, textString = "%name"), Rectangle(origin = {70, -2.84217e-14}, fillColor = {238, 238, 236}, fillPattern = FillPattern.Solid, extent = {{-10, 80}, {10, -80}})}));
end DiffPressureSensor;