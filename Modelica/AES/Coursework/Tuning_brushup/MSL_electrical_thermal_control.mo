within AES.Coursework.Tuning_brushup;

model MSL_electrical_thermal_control
  extends Icons.CourseworkModel;
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Cbody(C = 10000, T(fixed = true, start = 283.15)) annotation(
    Placement(visible = true, transformation(origin = {-10, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor Gbodycont(G = 40) annotation(
    Placement(visible = true, transformation(origin = {10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow iPdist annotation(
    Placement(visible = true, transformation(origin = {-40, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor sT annotation(
    Placement(visible = true, transformation(origin = {-40, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.LimPID PID(Ti = 500 * 0.25, controllerType = Modelica.Blocks.Types.SimpleController.PI, k = 240, yMax = 100, yMin = 0) annotation(
    Placement(visible = true, transformation(origin = {-110, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Tsp(y = 273.15 + 20) annotation(
    Placement(visible = true, transformation(origin = {-150, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Pdist(y = if time < 1000 then 0 else 100) annotation(
    Placement(visible = true, transformation(origin = {-150, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.SignalVoltage Vh annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Resistor heater(R= 10, useHeatPort = true) annotation(
    Placement(visible = true, transformation(origin = {-40, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Electrical.Analog.Basic.Ground gnd annotation(
    Placement(visible = true, transformation(origin = {-70, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Ccont(C = 5000, T(displayUnit = "K", fixed = true, start = 283.15)) annotation(
    Placement(visible = true, transformation(origin = {30, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor Gcontamb(G = 30) annotation(
    Placement(visible = true, transformation(origin = {50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature iTamb annotation(
    Placement(visible = true, transformation(origin = {90, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Tamb(y = 273.15 + 10 + 10 * sin(6.28 / 100 * time)) annotation(
    Placement(visible = true, transformation(origin = {130, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(Pdist.y, iPdist.Q_flow) annotation(
    Line(points = {{-139, -40}, {-50, -40}}, color = {0, 0, 127}));
  connect(Tsp.y, PID.u_s) annotation(
    Line(points = {{-139, 30}, {-122, 30}}, color = {0, 0, 127}));
  connect(Cbody.port, sT.port) annotation(
    Line(points = {{-10, 50}, {-10, -10}, {-30, -10}}, color = {191, 0, 0}));
  connect(Cbody.port, Gbodycont.port_a) annotation(
    Line(points = {{-10, 50}, {-10, 30}, {0, 30}}, color = {191, 0, 0}));
  connect(PID.y, Vh.v) annotation(
    Line(points = {{-99, 30}, {-82, 30}}, color = {0, 0, 127}));
  connect(Vh.p, heater.p) annotation(
    Line(points = {{-70, 40}, {-70, 46}, {-40, 46}, {-40, 40}}, color = {0, 0, 255}));
  connect(Vh.n, heater.n) annotation(
    Line(points = {{-70, 20}, {-70, 16}, {-40, 16}, {-40, 20}}, color = {0, 0, 255}));
  connect(Vh.n, gnd.p) annotation(
    Line(points = {{-70, 20}, {-70, 12}}, color = {0, 0, 255}));
  connect(heater.heatPort, Cbody.port) annotation(
    Line(points = {{-30, 30}, {-10, 30}, {-10, 50}}, color = {191, 0, 0}));
  connect(Gbodycont.port_b, Ccont.port) annotation(
    Line(points = {{20, 30}, {30, 30}, {30, 50}}, color = {191, 0, 0}));
  connect(Gbodycont.port_b, Gcontamb.port_a) annotation(
    Line(points = {{20, 30}, {40, 30}}, color = {191, 0, 0}));
  connect(Gcontamb.port_b, iTamb.port) annotation(
    Line(points = {{60, 30}, {80, 30}}, color = {191, 0, 0}));
  connect(sT.T, PID.u_m) annotation(
    Line(points = {{-50, -10}, {-110, -10}, {-110, 18}}, color = {0, 0, 127}));
  connect(iPdist.port, Cbody.port) annotation(
    Line(points = {{-30, -40}, {-10, -40}, {-10, 50}}, color = {191, 0, 0}));
  connect(Tamb.y, iTamb.T) annotation(
    Line(points = {{119, 30}, {101, 30}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 2000, Tolerance = 1e-6, Interval = 0.25),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=aliasConflicts ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end MSL_electrical_thermal_control;