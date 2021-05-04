within AES.Devel_test_models;

model Test_liquid_circuit_008_net02
  extends Icons.TestModel;
  inner AES.ProcessComponents.Thermal.System_settings.System_liquid system annotation(
    Placement(visible = true, transformation(origin = {-270, 148}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression cmdP(y = if time < 500 then 0.1 elseif time < 2000 then 0.6    elseif time < 3000 then 0.9 else 0.2) annotation(
    Placement(visible = true, transformation(origin = {-230, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression cmdQ(y = 5000) annotation(
    Placement(visible = true, transformation(origin = {-230, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.surfQcond_prescribed Q annotation(
    Placement(visible = true, transformation(origin = {-150, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression cmdT(y = 293.15) annotation(
    Placement(visible = true, transformation(origin = {-230, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.surfTcond_prescribed T annotation(
    Placement(visible = true, transformation(origin = {-30, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Pressuriser pressuriser annotation(
    Placement(visible = true, transformation(origin = {-230, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Pump_volumetric pumpC(w0 = 5)  annotation(
    Placement(visible = true, transformation(origin = {-190, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube tube01 annotation(
    Placement(visible = true, transformation(origin = {-150, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube tube02 annotation(
    Placement(visible = true, transformation(origin = {-90, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube tube03 annotation(
    Placement(visible = true, transformation(origin = {-30, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube tube04 annotation(
    Placement(visible = true, transformation(origin = {30, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube tube05 annotation(
    Placement(visible = true, transformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube tube06 annotation(
    Placement(visible = true, transformation(origin = {-30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube tube07 annotation(
    Placement(visible = true, transformation(origin = {30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube tube08 annotation(
    Placement(visible = true, transformation(origin = {-90, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube tube09 annotation(
    Placement(visible = true, transformation(origin = {-30, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube tube10 annotation(
    Placement(visible = true, transformation(origin = {90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube tube11 annotation(
    Placement(visible = true, transformation(origin = {90, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube tube12 annotation(
    Placement(visible = true, transformation(origin = {150, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube tube13 annotation(
    Placement(visible = true, transformation(origin = {210, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube tube14 annotation(
    Placement(visible = true, transformation(origin = {150, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube tube15 annotation(
    Placement(visible = true, transformation(origin = {90, -50}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube tube16 annotation(
    Placement(visible = true, transformation(origin = {30, -50}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube tube17 annotation(
    Placement(visible = true, transformation(origin = {-30, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube tube18 annotation(
    Placement(visible = true, transformation(origin = {-90, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube tube19 annotation(
    Placement(visible = true, transformation(origin = {-90, -90}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube tube20 annotation(
    Placement(visible = true, transformation(origin = {-90, -130}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.surfTcond_fixed Tcond1 annotation(
    Placement(visible = true, transformation(origin = {30, -90}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.surfTcond_fixed Tcond2 annotation(
    Placement(visible = true, transformation(origin = {210, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(cmdQ.y, Q.Q) annotation(
    Line(points = {{-219, 110}, {-158, 110}}, color = {0, 0, 127}));
  connect(cmdT.y, T.T) annotation(
    Line(points = {{-219, 130}, {-38, 130}}, color = {0, 0, 127}));
 connect(pressuriser.pwh_b, pumpC.pwh_a) annotation(
    Line(points = {{-218, 30}, {-202, 30}}, color = {46, 52, 54}));
 connect(tube01.pwh_b, tube02.pwh_a) annotation(
    Line(points = {{-138, 30}, {-120, 30}, {-120, 70}, {-102, 70}}, color = {46, 52, 54}));
 connect(tube01.pwh_b, tube05.pwh_a) annotation(
    Line(points = {{-138, 30}, {-102, 30}}, color = {46, 52, 54}));
 connect(tube01.pwh_b, tube08.pwh_a) annotation(
    Line(points = {{-138, 30}, {-120, 30}, {-120, -10}, {-102, -10}}, color = {46, 52, 54}));
 connect(tube02.pwh_b, tube03.pwh_a) annotation(
    Line(points = {{-78, 70}, {-42, 70}}, color = {46, 52, 54}));
 connect(tube05.pwh_b, tube06.pwh_a) annotation(
    Line(points = {{-78, 30}, {-42, 30}}, color = {46, 52, 54}));
 connect(tube08.pwh_b, tube09.pwh_a) annotation(
    Line(points = {{-78, -10}, {-42, -10}}, color = {46, 52, 54}));
 connect(tube06.pwh_b, tube07.pwh_a) annotation(
    Line(points = {{-18, 30}, {18, 30}}, color = {46, 52, 54}));
 connect(tube09.pwh_b, tube07.pwh_a) annotation(
    Line(points = {{-18, -10}, {0, -10}, {0, 30}, {18, 30}}, color = {46, 52, 54}));
 connect(tube03.pwh_b, tube04.pwh_a) annotation(
    Line(points = {{-18, 70}, {18, 70}}, color = {46, 52, 54}));
 connect(tube04.pwh_b, tube10.pwh_a) annotation(
    Line(points = {{42, 70}, {60, 70}, {60, 50}, {78, 50}}, color = {46, 52, 54}));
 connect(tube07.pwh_b, tube10.pwh_a) annotation(
    Line(points = {{42, 30}, {60, 30}, {60, 50}, {78, 50}}, color = {46, 52, 54}));
 connect(tube09.pwh_b, tube11.pwh_a) annotation(
    Line(points = {{-18, -10}, {78, -10}}, color = {46, 52, 54}));
 connect(tube10.pwh_b, tube12.pwh_a) annotation(
    Line(points = {{102, 50}, {120, 50}, {120, 70}, {138, 70}}, color = {46, 52, 54}));
 connect(tube12.pwh_b, tube13.pwh_a) annotation(
    Line(points = {{162, 70}, {198, 70}}, color = {46, 52, 54}));
 connect(tube10.pwh_b, tube14.pwh_a) annotation(
    Line(points = {{102, 50}, {120, 50}, {120, 30}, {138, 30}}, color = {46, 52, 54}));
 connect(tube11.pwh_b, tube13.pwh_b) annotation(
    Line(points = {{102, -10}, {242, -10}, {242, 70}, {222, 70}}, color = {46, 52, 54}));
 connect(tube14.pwh_b, tube13.pwh_b) annotation(
    Line(points = {{162, 30}, {242, 30}, {242, 70}, {222, 70}}, color = {46, 52, 54}));
 connect(cmdP.y, pumpC.cmd) annotation(
    Line(points = {{-219, 90}, {-190, 90}, {-190, 38}}, color = {0, 0, 127}));
 connect(pumpC.pwh_b, tube01.pwh_a) annotation(
    Line(points = {{-178, 30}, {-162, 30}}, color = {46, 52, 54}));
 connect(Q.surf, tube01.surf) annotation(
    Line(points = {{-150, 102}, {-150, 36}}, color = {144, 5, 5}));
 connect(T.surf, tube03.surf) annotation(
    Line(points = {{-30, 122}, {-30, 76}}, color = {144, 5, 5}));
 connect(Tcond1.surf, tube16.surf) annotation(
    Line(points = {{30, -82}, {30, -55}}, color = {144, 5, 5}));
 connect(tube14.pwh_b, tube15.pwh_a) annotation(
    Line(points = {{162, 30}, {242, 30}, {242, -50}, {102, -50}}, color = {46, 52, 54}));
 connect(tube15.pwh_b, tube16.pwh_a) annotation(
    Line(points = {{78, -50}, {42, -50}}, color = {46, 52, 54}));
 connect(tube15.pwh_a, tube20.pwh_a) annotation(
    Line(points = {{102, -50}, {120, -50}, {120, -130}, {-78, -130}}, color = {46, 52, 54}));
 connect(tube17.pwh_a, tube16.pwh_b) annotation(
    Line(points = {{-18, -50}, {18, -50}}, color = {46, 52, 54}));
 connect(tube17.pwh_a, tube19.pwh_a) annotation(
    Line(points = {{-18, -50}, {0, -50}, {0, -90}, {-78, -90}}, color = {46, 52, 54}));
 connect(tube20.pwh_b, tube19.pwh_b) annotation(
    Line(points = {{-102, -130}, {-120, -130}, {-120, -90}, {-102, -90}}, color = {46, 52, 54}));
 connect(tube19.pwh_b, tube18.pwh_b) annotation(
    Line(points = {{-102, -90}, {-120, -90}, {-120, -50}, {-102, -50}}, color = {46, 52, 54}));
 connect(tube18.pwh_b, pressuriser.pwh_a) annotation(
    Line(points = {{-102, -50}, {-260, -50}, {-260, 30}, {-242, 30}}, color = {46, 52, 54}));
 connect(tube18.pwh_a, tube17.pwh_b) annotation(
    Line(points = {{-78, -50}, {-42, -50}}, color = {46, 52, 54}));
 connect(Tcond2.surf, tube13.surf) annotation(
    Line(points = {{210, 102}, {210, 76}}, color = {144, 5, 5}));
protected
  annotation(
    experiment(StartTime = 0, StopTime = 8000, Tolerance = 1e-6, Interval = 0.8),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-300, -200}, {300, 200}})));
end Test_liquid_circuit_008_net02;