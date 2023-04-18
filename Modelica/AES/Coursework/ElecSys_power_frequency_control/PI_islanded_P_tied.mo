within AES.Coursework.ElecSys_power_frequency_control;

model PI_islanded_P_tied
  AES.ControlBlocks.AnalogueControllers.PI_awfb_full PI_island_mode(CSmax = Pmax, CSmin = 0, K = K, Ti = Ti, hasTracking = true)  annotation(
    Placement(visible = true, transformation(origin = {-10, -20}, extent = {{-10, -20}, {10, 20}}, rotation = 0)));
  Modelica.Blocks.Logical.Switch switch annotation(
    Placement(visible = true, transformation(origin = {48, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.BooleanInput connected_to_grid annotation(
    Placement(visible = true, transformation(origin = {-96, 30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-14, -34}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression zero annotation(
    Placement(visible = true, transformation(origin = {-72, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter Psat(uMax = Pmax, uMin = 0)  annotation(
    Placement(visible = true, transformation(origin = {-16, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(switch.u2, connected_to_grid) annotation(
    Line(points = {{36, 30}, {-96, 30}}, color = {255, 0, 255}));
  connect(PI_island_mode.CS, switch.u3) annotation(
    Line(points = {{0, -6}, {22, -6}, {22, 22}, {36, 22}}, color = {0, 0, 127}));
  connect(switch.y, PI_island_mode.TR) annotation(
    Line(points = {{59, 30}, {75, 30}, {75, -48}, {-35, -48}, {-35, -18}, {-21, -18}}, color = {0, 0, 127}));
  connect(connected_to_grid, PI_island_mode.TS) annotation(
    Line(points = {{-96, 30}, {-40, 30}, {-40, -14}, {-20, -14}}, color = {255, 0, 255}));
  connect(PI_island_mode.SP, zero.y) annotation(
    Line(points = {{-20.2, -6}, {-61.2, -6}}, color = {0, 0, 127}));
end PI_islanded_P_tied;