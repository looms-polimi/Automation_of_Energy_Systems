within AES.ProcessComponents.Thermal.DistrictHeating;

model TwinPipeSubstation_PriValve
  extends Interfaces.flowTwoTwinPorts_pwh;
  parameter SI.Power Pn=1e5 "rated thermal power";
  parameter SI.Temperature Tn_pi=273.15+100 "nominal primary inlet T";
  parameter SI.Temperature Tn_po=273.15+60 "nominal primary outlet T";
  parameter SI.Temperature Tn_si=273.15+20 "nominal secondary inlet T";
  parameter SI.Temperature Tn_so=273.15+50 "nominal secondary outlet T";
  parameter Real eta=0.85 "efficiency";
  parameter SI.PressureDifference Dpn_p=1e5 "nominal primary pressure drop";

  
  AES.ProcessComponents.Thermal.Interfaces.pwhPort pwh_H annotation(
    Placement(visible = true, transformation(origin = {-70, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-40, 120}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Interfaces.pwhPort pwh_C annotation(
    Placement(visible = true, transformation(origin = {70, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {40, 120}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Interfaces.pwhPortSplitter splt_a annotation(
    Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Interfaces.pwhPortSplitter split_b annotation(
    Placement(visible = true, transformation(origin = {70, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.HE_LiquidLiquid_1vol HE(Tcinom = Tn_si, Tconom = Tn_so, Thinom = Tn_pi, qCnom = qn_s, qHnom = qn_p,eta=eta)  annotation(
    Placement(visible = true, transformation(origin = {0, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.dp_linear dplC(dpnom = 0.1 *Dpn_p, wnom = system.ro * qn_p)  annotation(
    Placement(visible = true, transformation(origin = {0, 22}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
//protected
  final parameter SI.VolumeFlowRate qn_p = Pn/system.ro/system.cp/(Tn_pi-Tn_po) annotation(Evaluate = true);
  final parameter SI.VolumeFlowRate qn_s = Pn/system.ro/system.cp/(Tn_so-Tn_si) annotation(Evaluate = true);
  SI.Power Ph,Pc;
  AES.ProcessComponents.Thermal.Liquid.Valve_linear ValveP(dpnom = 0.9 *Dpn_p, wnom = system.ro * qn_p) annotation(
    Placement(visible = true, transformation(origin = {-32, 60}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tsensor sTpo annotation(
    Placement(visible = true, transformation(origin = {38, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput cmdVpri annotation(
    Placement(visible = true, transformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-38, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealOutput ToutPri annotation(
    Placement(visible = true, transformation(origin = {70, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {40, -80}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
equation
  Ph = HE.hotIn.w*system.cp*(HE.Thi-HE.Tho);
  Pc = HE.coldIn.w*system.cp*(HE.Tco-HE.Tci);
  connect(pwh_H, HE.coldOut) annotation(
    Line(points = {{-70, 80}, {0, 80}, {0, 72}}, color = {46, 52, 54}));
  connect(HE.coldIn, pwh_C) annotation(
    Line(points = {{12, 59.8}, {20, 59.8}, {20, 79.8}, {70, 79.8}}, color = {46, 52, 54}));
  connect(tpwh_a, splt_a.pwhTwin_HC) annotation(
    Line(points = {{-110, 0}, {-82, 0}}));
  connect(splt_a.pwh_H, split_b.pwh_H) annotation(
    Line(points = {{-58, 6}, {58, 6}}, color = {46, 52, 54}));
  connect(HE.hotOut, dplC.pwh_a) annotation(
    Line(points = {{0, 48}, {0, 34}}, color = {46, 52, 54}));
  connect(splt_a.pwh_C, dplC.pwh_b) annotation(
    Line(points = {{-58, -6}, {0, -6}, {0, 10}}, color = {46, 52, 54}));
  connect(split_b.pwh_C, dplC.pwh_b) annotation(
    Line(points = {{58, -6}, {0, -6}, {0, 10}}, color = {46, 52, 54}));
  connect(split_b.pwhTwin_HC, tpwh_b) annotation(
    Line(points = {{82, 0}, {110, 0}}));
  connect(ValveP.pwh_b, HE.hotIn) annotation(
    Line(points = {{-20, 60}, {-12, 60}}, color = {46, 52, 54}));
  connect(ValveP.pwh_a, splt_a.pwh_H) annotation(
    Line(points = {{-44, 60}, {-50, 60}, {-50, 6}, {-58, 6}}, color = {46, 52, 54}));
  connect(HE.hotOut, sTpo.pwh_a) annotation(
    Line(points = {{0, 48}, {0, 40}, {26, 40}}, color = {46, 52, 54}));
  connect(cmdVpri, ValveP.x) annotation(
    Line(points = {{-120, 40}, {-32, 40}, {-32, 50}}, color = {0, 0, 127}));
  connect(sTpo.oT, ToutPri) annotation(
    Line(points = {{36, 40}, {70, 40}}, color = {0, 0, 127}));

annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    Icon(graphics = {Rectangle(origin = {-40, 80}, fillColor = {239, 41, 41}, fillPattern = FillPattern.Solid, extent = {{-40, 20}, {40, -20}}), Polygon(origin = {-40, 80}, fillColor = {252, 233, 79}, fillPattern = FillPattern.Solid, points = {{-20, -10}, {0, 10}, {20, -10}, {-20, -10}}), Rectangle(origin = {40, 80}, fillColor = {32, 74, 135}, fillPattern = FillPattern.Solid, extent = {{-40, 20}, {40, -20}}), Polygon(origin = {40, 100}, fillColor = {114, 159, 207}, fillPattern = FillPattern.Solid, points = {{-20, -10}, {0, -30}, {20, -10}, {-20, -10}}), Rectangle(origin = {0, 0.06}, fillColor = {186, 189, 182}, fillPattern = FillPattern.Solid, extent = {{-100, 60.06}, {100, -60.06}}), Text(extent = {{-100, 20}, {100, -20}}, textString = "%name")}),
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end TwinPipeSubstation_PriValve;