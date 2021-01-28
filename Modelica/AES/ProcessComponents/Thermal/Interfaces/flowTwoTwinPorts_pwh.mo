within AES.ProcessComponents.Thermal.Interfaces;

partial model flowTwoTwinPorts_pwh
  outer System_settings.System_liquid system;
  AES.ProcessComponents.Thermal.Interfaces.pwhTwinPort tpwh_a annotation(
    Placement(visible = true, transformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-116, 0}, extent = {{-16, -20}, {16, 20}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Interfaces.pwhTwinPort tpwh_b annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {116, 0}, extent = {{16, -20}, {-16, 20}}, rotation = 0)));
end flowTwoTwinPorts_pwh;