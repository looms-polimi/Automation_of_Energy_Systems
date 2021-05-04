within AES.Coursework.ThermSys_Generation;

model HP_heater_DaisyChain_case_001
  extends AES.Icons.CourseworkModel;
  AES.ProcessComponents.Thermal.Liquid.Pump_volumetric P(w0 = 0.2)  annotation(
    Placement(visible = true, transformation(origin = {50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube pipeline(Di = 0.01, L = 50)  annotation(
    Placement(visible = true, transformation(origin = {128, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression cmdP(y = min(0.1 *time, 0.5))  annotation(
    Placement(visible = true, transformation(origin = {-30, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Convection_VecVec loss(A = 2)  annotation(
    Placement(visible = true, transformation(origin = {128, 36}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.surfTcond_prescribed Te annotation(
    Placement(visible = true, transformation(origin = {128, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression iTe(y = 273.15 + 10)  annotation(
    Placement(visible = true, transformation(origin = {-30, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Pressuriser pressuriser annotation(
    Placement(visible = true, transformation(origin = {170, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature pTcold annotation(
    Placement(visible = true, transformation(origin = {90, -80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression w(y = min(1, time / 20000))  annotation(
    Placement(visible = true, transformation(origin = {-122, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner ProcessComponents.Thermal.System_settings.System_liquid system annotation(
    Placement(visible = true, transformation(origin = {-150, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ControlBlocks.ActuationSchemes.DaisyChain_uniform DC annotation(
    Placement(visible = true, transformation(origin = {-70, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.Liquid.Tube streamElecHtr(Di = 0.01, L = 2) annotation(
    Placement(visible = true, transformation(origin = {10, -20}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain PmaxElec(k = 1000) annotation(
    Placement(visible = true, transformation(origin = {-30, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.Liquid.surfQcond_prescribed ElecHtr annotation(
    Placement(visible = true, transformation(origin = {10, -40}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  ProcessComponents.Thermal.Liquid.Tube streamHP(Di = 0.01, L = 2) annotation(
    Placement(visible = true, transformation(origin = {50, -20}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  ProcessComponents.Thermal.Liquid.VectorHPtoHP_conductor HP2pipe annotation(
    Placement(visible = true, transformation(origin = {50, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.HVAC.HP_CarnotFractionCOPh HP(Wmax = 2000) annotation(
    Placement(visible = true, transformation(origin = {50, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.Liquid.Tube delivery(Di = 0.01, L = 10) annotation(
    Placement(visible = true, transformation(origin = {170, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.Liquid.surfQcond_prescribed load annotation(
    Placement(visible = true, transformation(origin = {170, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression iQload(y = -200) annotation(
    Placement(visible = true, transformation(origin = {-30, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tsensor Tlow annotation(
    Placement(visible = true, transformation(origin = {-50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tsensor Thi annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(streamElecHtr.pwh_b, P.pwh_a) annotation(
    Line(points = {{-2, -20}, {-16, -20}, {-16, 10}, {38, 10}}, color = {46, 52, 54}));
  connect(P.pwh_b, pipeline.pwh_a) annotation(
    Line(points = {{62, 10}, {116, 10}}, color = {46, 52, 54}));
  connect(iTe.y, Te.T) annotation(
    Line(points = {{-18, 60}, {120, 60}}, color = {0, 0, 127}));
  connect(Te.surf, loss.surf_B) annotation(
    Line(points = {{128, 52}, {128, 42}}, color = {144, 5, 5}));
  connect(loss.surf_A, pipeline.surf) annotation(
    Line(points = {{128, 30}, {128, 16}}, color = {144, 5, 5}));
  connect(pressuriser.pwh_a, streamHP.pwh_a) annotation(
    Line(points = {{158, -20}, {62, -20}}, color = {46, 52, 54}));
  connect(streamHP.pwh_b, streamElecHtr.pwh_a) annotation(
    Line(points = {{38, -20}, {22, -20}}, color = {46, 52, 54}));
  connect(delivery.pwh_b, pressuriser.pwh_b) annotation(
    Line(points = {{182, 10}, {190, 10}, {190, -20}, {182, -20}}, color = {46, 52, 54}));
  connect(pipeline.pwh_b, delivery.pwh_a) annotation(
    Line(points = {{140, 10}, {158, 10}}, color = {46, 52, 54}));
  connect(iQload.y, load.Q) annotation(
    Line(points = {{-18, 80}, {162, 80}}, color = {0, 0, 127}));
  connect(load.surf, delivery.surf) annotation(
    Line(points = {{170, 72}, {170, 16}}, color = {144, 5, 5}));
  connect(iTe.y, pTcold.T) annotation(
    Line(points = {{-18, 60}, {108, 60}, {108, -80}, {102, -80}}, color = {0, 0, 127}));
  connect(pTcold.port, HP.coldPort) annotation(
    Line(points = {{80, -80}, {50, -80}, {50, -68}}, color = {191, 0, 0}));
  connect(HP.hotPort, HP2pipe.HP) annotation(
    Line(points = {{50, -50}, {50, -44}}, color = {191, 0, 0}));
  connect(HP2pipe.vectorHP, streamHP.surf) annotation(
    Line(points = {{50, -36}, {50, -26}}, color = {144, 5, 5}));
  connect(w.y, DC.CSi01) annotation(
    Line(points = {{-110, -40}, {-82, -40}}, color = {0, 0, 127}));
  connect(DC.CSo01[2], PmaxElec.u) annotation(
    Line(points = {{-58, -40}, {-42, -40}}, color = {0, 0, 127}));
  connect(DC.CSo01[1], HP.cmd01) annotation(
    Line(points = {{-58, -40}, {-50, -40}, {-50, -60}, {42, -60}}, color = {0, 0, 127}));
  connect(PmaxElec.y, ElecHtr.Q) annotation(
    Line(points = {{-18, -40}, {2, -40}}, color = {0, 0, 127}));
  connect(ElecHtr.surf, streamElecHtr.surf) annotation(
    Line(points = {{10, -32}, {10, -26}}, color = {144, 5, 5}));
  connect(cmdP.y, P.cmd) annotation(
    Line(points = {{-18, 40}, {50, 40}, {50, 18}}, color = {0, 0, 127}));
  connect(Tlow.pwh_a, streamHP.pwh_a) annotation(
    Line(points = {{-38, -10}, {62, -10}, {62, -20}}, color = {46, 52, 54}));
  connect(Thi.pwh_a, streamElecHtr.pwh_b) annotation(
    Line(points = {{-38, 10}, {-16, 10}, {-16, -20}, {-2, -20}}, color = {46, 52, 54}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 50000, Tolerance = 1e-6, Interval = 100),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end HP_heater_DaisyChain_case_001;