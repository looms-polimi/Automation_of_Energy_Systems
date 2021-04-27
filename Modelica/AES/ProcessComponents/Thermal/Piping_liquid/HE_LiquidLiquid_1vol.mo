within AES.ProcessComponents.Thermal.Piping_liquid;

model HE_LiquidLiquid_1vol
  outer System_settings.System_liquid system;
  parameter SI.Volume Vh=0.01 "H side volume";
  parameter SI.Volume Vc=0.01 "C side volume";
  parameter SI.VolumeFlowRate qHnom=0.0002 "H nominal volume flowrate";
  parameter SI.VolumeFlowRate qCnom=0.0001 "C nominal volume flowrate";
  parameter SI.Temperature Thinom=273.15+70 "H side nominal inlet T";
  parameter SI.Temperature Tcinom=273.15+20 "C side nominal inlet T";
  parameter SI.Temperature Tconom=273.15+40 "C side nominal outlet T";
  parameter SI.Temperature Tcostart=Tconom;
  parameter SI.Temperature Thostart=(Thinom*qHnom+(Tcinom-Tconom)*qCnom)/qHnom;
  AES.ProcessComponents.Thermal.Interfaces.pwhPort hotOut annotation(
    Placement(visible = true, transformation(origin = {-92, 92}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Interfaces.pwhPort coldIn annotation(
    Placement(visible = true, transformation(origin = {-82, 102}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, -2}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Interfaces.pwhPort hotIn annotation(
    Placement(visible = true, transformation(origin = {-112, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Interfaces.pwhPort coldOut annotation(
    Placement(visible = true, transformation(origin = {-102, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  SI.Temperature Thi,Tci;
  SI.Temperature Tho(start=Thostart);
  SI.Temperature Tco(start=Tcostart);
  SI.Power Qhc;
protected
  /*
  Given cp,wh,wc,Thi,Tco,P
     e1: cp*wh*(Thi-Tho) = P; 
     e2: cp*wc*(Tco-Tci) = P;
     e3: P =G*(Tho-Tco); 
         solve([e1,e2,e3],[G,Tho,Tci]);
  Given cp,wh,wc,Thi,Tco,Tci
     e1: cp*wh*(Thi-Tho) = P; 
     e2: cp*wc*(Tco-Tci) = P;
     e3: P =G*(Tho-Tco); 
         solve([e1,e2,e3],[G,Tho,P]);
  */

  parameter SI.HeatCapacity Ch=system.ro*system.cp*Vh annotation(Evaluate = true);
  parameter SI.HeatCapacity Cc=system.ro*system.cp*Vc annotation(Evaluate = true);
  parameter SI.MassFlowRate wHnom=system.ro*qHnom annotation(Evaluate = true);
  parameter SI.MassFlowRate wCnom=system.ro*qCnom annotation(Evaluate = true);
  parameter SI.Power Pnom=wCnom*system.cp*(Tconom-Tcinom) annotation(Evaluate = true);
  parameter SI.ThermalConductance G=((Tconom-Tcinom)*system.cp*wCnom*wHnom)
                                    /((Thinom-Tconom)*wHnom+(Tcinom-Tconom)*wCnom)
                                    annotation(Evaluate = true);
equation


  Ch*der(Tho) = hotIn.w*system.cp*(Thi-Tho)-Qhc;
  Cc*der(Tco) = coldIn.w*system.cp*(Tci-Tco)+Qhc;
  Qhc         = G*(Tho-Tco);

  Thi=actualStream(hotIn.h)/system.cp;
  Tci=actualStream(coldIn.h)/system.cp;

  hotIn.p = hotOut.p;
  hotIn.w+hotOut.w = 0;
  hotIn.h = system.cp*Tho;
  hotOut.h = system.cp*Tho;

  coldIn.p = coldOut.p;
  coldIn.w+coldOut.w = 0;
  coldIn.h = system.cp*Tho;
  coldOut.h = system.cp*Tho;
  

annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    Icon(graphics = {Polygon(origin = {-52, -72}, lineColor = {204, 0, 0}, fillColor = {255, 219, 219}, fillPattern = FillPattern.VerticalCylinder, points = {{-48, 172}, {-48, -28}, {152, -28}, {-48, 172}}), Polygon(origin = {14, 120}, lineColor = {32, 74, 135}, fillColor = {170, 255, 255}, fillPattern = FillPattern.HorizontalCylinder, points = {{86, -220}, {-114, -20}, {86, -20}, {86, -220}}), Line(origin = {-40.65, -39.94}, points = {{-30, 30}, {30, -30}}, thickness = 3, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20), Line(origin = {99.4, -28.97}, points = {{-30, 30}, {-90, 90}}, thickness = 3, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20)}),
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end HE_LiquidLiquid_1vol;