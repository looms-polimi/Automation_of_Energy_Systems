within AES.Coursework.ThermSys_case_studies.HVAC_floor;

model OL
  extends Icons.CourseworkModel;
  Room room annotation(
    Placement(transformation(origin = {10, 10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression Phair(y = if sin(6.28/86400*time) > 0 then 1000 else 0)  annotation(
    Placement(transformation(origin = {-74, 8}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression Pcair annotation(
    Placement(transformation(origin = {-66, -18}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression Phfloor(y = 400)  annotation(
    Placement(transformation(origin = {-68, 30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression Tamb(y = 10)  annotation(
    Placement(transformation(origin = {-30, 78}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression Vphren(y = if time < 864000/2 then 0 else 1) annotation(
    Placement(transformation(origin = {-66, 52}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(Phair.y, room.Phair) annotation(
    Line(points = {{-63, 8}, {-32.5, 8}, {-32.5, 10}, {-2, 10}}, color = {0, 0, 127}));
  connect(Phfloor.y, room.Phfloor) annotation(
    Line(points = {{-56, 30}, {-32, 30}, {-32, 16}, {-2, 16}}, color = {0, 0, 127}));
  connect(Pcair.y, room.Pcair) annotation(
    Line(points = {{-54, -18}, {-34, -18}, {-34, 4}, {-2, 4}}, color = {0, 0, 127}));
  connect(Tamb.y, room.Tamb) annotation(
    Line(points = {{-19, 78}, {14, 78}, {14, 22}}, color = {0, 0, 127}));
  connect(Vphren.y, room.Vphren) annotation(
    Line(points = {{-54, 52}, {6, 52}, {6, 22}}, color = {0, 0, 127}));

annotation(
    experiment(StartTime = 0, StopTime = 864000, Tolerance = 1e-06, Interval = 1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"));
end OL;