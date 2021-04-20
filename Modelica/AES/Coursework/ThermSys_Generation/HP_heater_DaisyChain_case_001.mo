within AES.Coursework.ThermSys_Generation;

model HP_heater_DaisyChain_case_001
  extends AES.Icons.CourseworkModel;
  AES.ProcessComponents.Thermal.Piping_liquid.Pump_volumetric P(w0 = 0.2)  annotation(
    Placement(visible = true, transformation(origin = {50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Piping_liquid.Tube pipeline(Di = 0.01, L = 50)  annotation(
    Placement(visible = true, transformation(origin = {128, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression cmdP(y = min(0.1 *time, 0.5))  annotation(
    Placement(visible = true, transformation(origin = {-30, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Piping_liquid.Convection_VecVec loss(A = 2)  annotation(
    Placement(visible = true, transformation(origin = {128, 36}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Piping_liquid.surfTcond_prescribed Te annotation(
    Placement(visible = true, transformation(origin = {128, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression iTe(y = 273.15 + 10)  annotation(
    Placement(visible = true, transformation(origin = {-30, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Piping_liquid.Pressuriser pressuriser annotation(
    Placement(visible = true, transformation(origin = {170, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Piping_liquid.Tube delivery(Di = 0.01, L = 10) annotation(
    Placement(visible = true, transformation(origin = {170, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Piping_liquid.surfQcond_prescribed load annotation(
    Placement(visible = true, transformation(origin = {170, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression iQload(y = -1000)  annotation(
    Placement(visible = true, transformation(origin = {-30, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature pTcold annotation(
    Placement(visible = true, transformation(origin = {90, -80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression w annotation(
    Placement(visible = true, transformation(origin = {-122, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner ProcessComponents.Thermal.System_settings.System_liquid system annotation(
    Placement(visible = true, transformation(origin = {-150, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ControlBlocks.ActuationSchemes.DaisyChain_uniform DC annotation(
    Placement(visible = true, transformation(origin = {-70, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.Piping_liquid.Tube streamElecHtr(Di = 0.01, L = 2) annotation(
    Placement(visible = true, transformation(origin = {10, -20}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain PmaxElec(k = 1000) annotation(
    Placement(visible = true, transformation(origin = {-30, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.Piping_liquid.surfQcond_prescribed ElecHtr annotation(
    Placement(visible = true, transformation(origin = {10, -40}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  ProcessComponents.Thermal.Piping_liquid.Tube streamHP(Di = 0.01, L = 2) annotation(
    Placement(visible = true, transformation(origin = {50, -20}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  ProcessComponents.Thermal.Piping_liquid.VectorHPtoHP_conductor HP2pipe annotation(
    Placement(visible = true, transformation(origin = {50, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.HVAC.HP_ConstCOPh HP(Wmax = 2000) annotation(
    Placement(visible = true, transformation(origin = {50, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(P.pwh_b, pipeline.pwh_a) annotation(
    Line(points = {{62, 10}, {116, 10}}, color = {46, 52, 54}));
  connect(cmdP.y, P.cmd) annotation(
    Line(points = {{-19, 40}, {50, 40}, {50, 18}}, color = {0, 0, 127}));
  connect(Te.surf, loss.surf_B) annotation(
    Line(points = {{128, 51.3333}, {128, 42.3333}}, color = {144, 5, 5}));
  connect(loss.surf_A, pipeline.surf) annotation(
    Line(points = {{128, 30.7333}, {128, 16.7334}}, color = {144, 5, 5}));
  connect(iTe.y, Te.T) annotation(
    Line(points = {{-19, 60}, {120, 60}}, color = {0, 0, 127}));
  connect(pipeline.pwh_b, delivery.pwh_a) annotation(
    Line(points = {{140, 10}, {158, 10}}, color = {46, 52, 54}));
  connect(delivery.pwh_b, pressuriser.pwh_b) annotation(
    Line(points = {{182, 10}, {192, 10}, {192, -20}, {182, -20}}, color = {46, 52, 54}));
  connect(iQload.y, load.Q) annotation(
    Line(points = {{-19, 80}, {162, 80}}, color = {0, 0, 127}));
  connect(load.surf, delivery.surf) annotation(
    Line(points = {{170, 71.3333}, {170, 15.3333}}, color = {144, 5, 5}));
  connect(iTe.y, pTcold.T) annotation(
    Line(points = {{-18, 60}, {110, 60}, {110, -80}, {102, -80}}, color = {0, 0, 127}));
  connect(w.y, DC.CSi01) annotation(
    Line(points = {{-110, -40}, {-82, -40}}, color = {0, 0, 127}));
  connect(streamElecHtr.pwh_b, P.pwh_a) annotation(
    Line(points = {{-2, -20}, {-2, -19}, {-12, -19}, {-12, 10}, {38, 10}}, color = {46, 52, 54}));
  connect(DC.CSo01[2], PmaxElec.u) annotation(
    Line(points = {{-58, -40}, {-42, -40}}, color = {0, 0, 127}));
  connect(PmaxElec.y, ElecHtr.Q) annotation(
    Line(points = {{-19, -40}, {1, -40}}, color = {0, 0, 127}));
  connect(ElecHtr.surf, streamElecHtr.surf) annotation(
    Line(points = {{10, -31.3333}, {10, -25}}, color = {144, 5, 5}));
  connect(streamElecHtr.pwh_a, streamHP.pwh_b) annotation(
    Line(points = {{22, -20}, {38, -20}}, color = {46, 52, 54}));
  connect(streamHP.pwh_a, pressuriser.pwh_a) annotation(
    Line(points = {{62, -20}, {158, -20}}, color = {46, 52, 54}));
  connect(HP2pipe.vectorHP, streamHP.surf) annotation(
    Line(points = {{50, -36}, {50, -26}}, color = {144, 5, 5}));
  connect(DC.CSo01[1], HP.cmd01) annotation(
    Line(points = {{-58, -40}, {-50, -40}, {-50, -60}, {42, -60}}, color = {0, 0, 127}));
  connect(HP2pipe.HP, HP.hotPort) annotation(
    Line(points = {{50, -44}, {50, -50}}, color = {191, 0, 0}));
  connect(pTcold.port, HP.coldPort) annotation(
    Line(points = {{80, -80}, {50, -80}, {50, -68}}, color = {191, 0, 0}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 10000, Tolerance = 1e-6, Interval = 20),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end HP_heater_DaisyChain_case_001;