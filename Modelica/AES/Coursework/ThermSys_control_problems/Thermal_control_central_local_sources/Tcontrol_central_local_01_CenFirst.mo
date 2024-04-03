within AES.Coursework.ThermSys_control_problems.Thermal_control_central_local_sources;

model Tcontrol_central_local_01_CenFirst
  extends Icons.CourseworkModel;
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Ccen(C = 5000, T(start = 313.15))  annotation(
    Placement(transformation(origin = {-150, 10}, extent = {{-30, -30}, {30, 30}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Cloc1(C = 5000)  annotation(
    Placement(visible = true, transformation(origin = {104, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow Ploc1 annotation(
    Placement(visible = true, transformation(origin = {62, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor Gloss1(G = 1000 / 20)  annotation(
    Placement(visible = true, transformation(origin = {132, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_basic C1(CSmin = 0, K = 50, Ti = 10)  annotation(
    Placement(visible = true, transformation(origin = {-44, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.ActuationSchemes.DaisyChain_uniform DC1 annotation(
    Placement(visible = true, transformation(origin = {-12, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor sTloc1 annotation(
    Placement(visible = true, transformation(origin = {-6, -14}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature Te annotation(
    Placement(visible = true, transformation(origin = {192, 28}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression spT1(y = 273.15 + 19)  annotation(
    Placement(visible = true, transformation(origin = {-88, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Text(y = 273.15 + 12 + 4 * sin(time / 100))  annotation(
    Placement(visible = true, transformation(origin = {236, 28}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ControlBlocks.ActuationSchemes.u01_yMinMax Grange1(y0 = 1, y1 = 10)  annotation(
    Placement(visible = true, transformation(origin = {54, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.ActuationSchemes.u01_yMinMax Prange1(y0=0, y1 = 500)  annotation(
    Placement(visible = true, transformation(origin = {24, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Containment.VariableThermalConductor Gtake1 annotation(
    Placement(visible = true, transformation(origin = {84, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  AES.ControlBlocks.ActuationSchemes.DaisyChain_uniform DC2 annotation(
    Placement(visible = true, transformation(origin = {-12, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_basic C2(CSmin = 0, K = 50, Ti = 10) annotation(
    Placement(visible = true, transformation(origin = {-44, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.ActuationSchemes.u01_yMinMax Prange2(y0 = 0, y1 = 1000) annotation(
    Placement(visible = true, transformation(origin = {24, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.ActuationSchemes.u01_yMinMax Grange2(y0 = 1, y1 = 12) annotation(
    Placement(visible = true, transformation(origin = {54, -92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow Ploc2 annotation(
    Placement(visible = true, transformation(origin = {62, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Containment.VariableThermalConductor Gtake2 annotation(
    Placement(visible = true, transformation(origin = {84, -88}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor sTloc2 annotation(
    Placement(visible = true, transformation(origin = {-6, -114}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Cloc2(C = 8000) annotation(
    Placement(visible = true, transformation(origin = {104, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor Gloss2(G = 1500 / 20) annotation(
    Placement(visible = true, transformation(origin = {132, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression spT2(y = 273.15 + 18 + (if sin(time / 1000) > 0 then 0 else 2)) annotation(
    Placement(visible = true, transformation(origin = {-86, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor Glosscen(G = 5) annotation(
    Placement(visible = true, transformation(origin = {130, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.AnalogueControllers.PI_awfb_basic Cc(CSmin = 0, K = 10, Ti = 100) annotation(
    Placement(visible = true, transformation(origin = {-230, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ControlBlocks.ActuationSchemes.u01_yMinMax Prangec(y0 = 0, y1 = 5000) annotation(
    Placement(visible = true, transformation(origin = {-200, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow Pc annotation(
    Placement(visible = true, transformation(origin = {-170, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor sTc annotation(
    Placement(visible = true, transformation(origin = {-170, -70}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression spTc(y = 273.15 + 40) annotation(
    Placement(visible = true, transformation(origin = {-270, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Ploc1.port, Cloc1.port) annotation(
    Line(points = {{72, 28}, {104, 28}, {104, 38}}, color = {191, 0, 0}));
  connect(Gloss1.port_a, Cloc1.port) annotation(
    Line(points = {{122, 28}, {104, 28}, {104, 38}}, color = {191, 0, 0}));
  connect(C1.CS, DC1.CSi01) annotation(
    Line(points = {{-32, 28}, {-24, 28}}, color = {0, 0, 127}));
  connect(Gloss1.port_b, Te.port) annotation(
    Line(points = {{142, 28}, {182, 28}}, color = {191, 0, 0}));
  connect(Te.T, Text.y) annotation(
    Line(points = {{204, 28}, {225, 28}}, color = {0, 0, 127}));
  connect(Prange1.CSoMInMax, Ploc1.Q_flow) annotation(
    Line(points = {{35.8, 28}, {51.8, 28}}, color = {0, 0, 127}));
  connect(spT1.y, C1.SP) annotation(
    Line(points = {{-77, 34}, {-56, 34}}, color = {0, 0, 127}));
  connect(sTloc1.T, C1.PV) annotation(
    Line(points = {{-16, -14}, {-66, -14}, {-66, 24}, {-56, 24}}, color = {0, 0, 127}));
  connect(Gtake1.hp_b, Cloc1.port) annotation(
    Line(points = {{84, 22}, {84, 28}, {104, 28}, {104, 38}}, color = {191, 0, 0}));
  connect(Grange1.CSoMInMax, Gtake1.Gc) annotation(
    Line(points = {{65.8, 8}, {84, 8}}, color = {0, 0, 127}));
  connect(sTloc1.port, Cloc1.port) annotation(
    Line(points = {{4, -14}, {104, -14}, {104, 38}}, color = {191, 0, 0}));
  connect(Ploc2.port, Cloc2.port) annotation(
    Line(points = {{72, -72}, {104, -72}, {104, -62}}, color = {191, 0, 0}));
  connect(Gloss2.port_a, Cloc2.port) annotation(
    Line(points = {{122, -72}, {104, -72}, {104, -62}}, color = {191, 0, 0}));
  connect(Grange2.CSoMInMax, Gtake2.Gc) annotation(
    Line(points = {{65.8, -92}, {84, -92}}, color = {0, 0, 127}));
  connect(sTloc2.port, Cloc2.port) annotation(
    Line(points = {{4, -114}, {104, -114}, {104, -62}}, color = {191, 0, 0}));
  connect(Prange2.CSoMInMax, Ploc2.Q_flow) annotation(
    Line(points = {{35.8, -72}, {51.8, -72}}, color = {0, 0, 127}));
  connect(DC2.CSo01[2], Prange2.CSi01) annotation(
    Line(points = {{0, -72}, {12, -72}}, color = {0, 0, 127}));
  connect(DC2.CSo01[1], Grange2.CSi01) annotation(
    Line(points = {{0, -72}, {6, -72}, {6, -92}, {42, -92}}, color = {0, 0, 127}));
  connect(C2.CS, DC2.CSi01) annotation(
    Line(points = {{-32, -72}, {-24, -72}}, color = {0, 0, 127}));
  connect(spT2.y, C2.SP) annotation(
    Line(points = {{-75, -66}, {-57, -66}}, color = {0, 0, 127}));
  connect(sTloc2.T, C2.PV) annotation(
    Line(points = {{-16, -114}, {-66, -114}, {-66, -76}, {-56, -76}}, color = {0, 0, 127}));
  connect(Gloss2.port_b, Te.port) annotation(
    Line(points = {{142, -72}, {164, -72}, {164, 28}, {182, 28}}, color = {191, 0, 0}));
  connect(Ccen.port, Gtake2.hp_a) annotation(
    Line(points = {{-152, -20}, {-152, -140}, {84, -140}, {84, -98}}, color = {191, 0, 0}));
  connect(Ccen.port, Gtake1.hp_a) annotation(
    Line(points = {{-152, -20}, {-152, -40}, {84, -40}, {84, 2}}, color = {191, 0, 0}));
  connect(Ccen.port, Glosscen.port_a) annotation(
    Line(points = {{-152, -20}, {-150, -140}, {120, -140}}, color = {191, 0, 0}));
  connect(Glosscen.port_b, Te.port) annotation(
    Line(points = {{140, -140}, {164, -140}, {164, 28}, {182, 28}}, color = {191, 0, 0}));
  connect(Pc.port, Ccen.port) annotation(
    Line(points = {{-160, -40}, {-150, -40}, {-152, -20}}, color = {191, 0, 0}));
  connect(Prangec.CSoMInMax, Pc.Q_flow) annotation(
    Line(points = {{-188, -40}, {-180, -40}}, color = {0, 0, 127}));
  connect(Cc.CS, Prangec.CSi01) annotation(
    Line(points = {{-218, -40}, {-212, -40}}, color = {0, 0, 127}));
  connect(Ccen.port, sTc.port) annotation(
    Line(points = {{-152, -20}, {-150, -70}, {-160, -70}}, color = {191, 0, 0}));
  connect(sTc.T, Cc.PV) annotation(
    Line(points = {{-180, -70}, {-252, -70}, {-252, -44}, {-242, -44}}, color = {0, 0, 127}));
  connect(spTc.y, Cc.SP) annotation(
    Line(points = {{-258, -34}, {-242, -34}}, color = {0, 0, 127}));
  connect(Gtake2.hp_b, Cloc2.port) annotation(
    Line(points = {{84, -78}, {84, -72}, {104, -72}, {104, -62}}, color = {191, 0, 0}));
  connect(DC1.CSo01[1], Grange1.CSi01) annotation(
    Line(points = {{0, 28}, {4, 28}, {4, 8}, {42, 8}}, color = {0, 0, 127}));
  connect(DC1.CSo01[2], Prange1.CSi01) annotation(
    Line(points = {{0, 28}, {12, 28}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-300, -200}, {300, 200}})),
    experiment(StartTime = 0, StopTime = 10000, Tolerance = 1e-6, Interval = 2),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end Tcontrol_central_local_01_CenFirst;