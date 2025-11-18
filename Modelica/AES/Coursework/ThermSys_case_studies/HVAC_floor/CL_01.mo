within AES.Coursework.ThermSys_case_studies.HVAC_floor;

model CL_01
  extends Icons.CourseworkModel;
  Room room annotation(
    Placement(transformation(origin = {10, 10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression SP_Tair(y = 20) annotation(
    Placement(transformation(origin = {-148, -4}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression SP_Tfloor(y = 23)  annotation(
    Placement(transformation(origin = {-150, 36}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression zero annotation(
    Placement(transformation(origin = {-80, -76}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression Tamb(y = 10)  annotation(
    Placement(transformation(origin = {-30, 78}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression Vphren(y = if AES.Functions.hod(time) > 8 and AES.Functions.hod(time) < 20 then 0.5 else 0.125) annotation(
    Placement(transformation(origin = {-50, 56}, extent = {{-10, -10}, {10, 10}})));
  ControlBlocks.AnalogueControllers.PI_awfb_basic PI_heater_floor(K = 20, Ti = 1500, CSmin = 0, CSmax = 100*room.Lroom*room.Wroom)  annotation(
    Placement(transformation(origin = {-88, 30}, extent = {{-10, -10}, {10, 10}})));
  ControlBlocks.AnalogueControllers.PI_awfb_basic PI_heater_air(K = 50, Ti = 100, CSmin = 0, CSmax = 1000)  annotation(
    Placement(transformation(origin = {-88, -10}, extent = {{-10, -10}, {10, 10}})));

  Real Efloor(start=0),Eair(start=0);

equation
  
  der(Efloor) = PI_heater_floor.CS;
  der(Eair)   = PI_heater_air.CS;

  connect(Tamb.y, room.Tamb) annotation(
    Line(points = {{-19, 78}, {14, 78}, {14, 22}}, color = {0, 0, 127}));
  connect(Vphren.y, room.Vphren) annotation(
    Line(points = {{-39, 56}, {7, 56}, {7, 22}, {6, 22}}, color = {0, 0, 127}));
  connect(SP_Tair.y, PI_heater_air.SP) annotation(
    Line(points = {{-137, -4}, {-100, -4}}, color = {0, 0, 127}));
  connect(room.Tair, PI_heater_air.PV) annotation(
    Line(points = {{22, 16}, {40, 16}, {40, -40}, {-120, -40}, {-120, -14}, {-100, -14}}, color = {0, 0, 127}));
  connect(zero.y, room.Pcair) annotation(
    Line(points = {{-68, -76}, {-30, -76}, {-30, 4}, {-2, 4}}, color = {0, 0, 127}));
  connect(room.Phair, PI_heater_air.CS) annotation(
    Line(points = {{-2, 10}, {-60, 10}, {-60, -10}, {-76, -10}}, color = {0, 0, 127}));
  connect(PI_heater_floor.CS, room.Phfloor) annotation(
    Line(points = {{-76, 30}, {-60, 30}, {-60, 16}, {-2, 16}}, color = {0, 0, 127}));
  connect(SP_Tfloor.y, PI_heater_floor.SP) annotation(
    Line(points = {{-138, 36}, {-100, 36}}, color = {0, 0, 127}));
  connect(room.Tfloor, PI_heater_floor.PV) annotation(
    Line(points = {{22, 10}, {30, 10}, {30, -28}, {-108, -28}, {-108, 26}, {-100, 26}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 864000, Tolerance = 1e-06, Interval = 1728),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"),
  Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})));
end CL_01;