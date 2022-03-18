within AES.ProcessComponents.Thermal.Liquid;

model HE_LiquidLiquid_1vol
  outer System_settings.System_liquid system;
  parameter SI.Volume Vh=0.01 "H side volume";
  parameter SI.Volume Vc=0.01 "C side volume";
  parameter SI.VolumeFlowRate qHnom=0.0002 "H nominal volume flowrate";
  parameter SI.VolumeFlowRate qCnom=0.0001 "C nominal volume flowrate";
  parameter SI.Temperature Thinom=273.15+70 "H side nominal inlet T";
  parameter SI.Temperature Tcinom=273.15+20 "C side nominal inlet T";
  parameter SI.Power Pnom=3000 "Nominal P (taken from H side)";
  parameter Real eta=0.95 "Efficiency";
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
  SI.Power Ph,Pc,Ploss;
//protected
  /*
  Given cp,wHnom,wCnom,Thinom,Tcinom,Pnom,eta
     e1  : Pnom   = G*(Thinom+Thonom-Tcinom-Tconom)/2;
     e2  : Thonom = Thinom-Pnom/wHnom/c;
     e3  : Tconom = Tcinom+eta*Pnom/wCnom/c;
     sol : solve([e1,e2,e3],[G,Thonom,Tconom])[1];
  */

  parameter SI.HeatCapacity
            Ch=system.ro*system.cp*Vh
            annotation(Evaluate = true);
  parameter SI.HeatCapacity
            Cc=system.ro*system.cp*Vc
            annotation(Evaluate = true);
  parameter SI.MassFlowRate
            wHnom=system.ro*qHnom
            annotation(Evaluate = true);
  parameter SI.MassFlowRate
            wCnom=system.ro*qCnom
            annotation(Evaluate = true);
  parameter SI.Temperature
            Thonom=Thinom-Pnom/(system.cp*wHnom)
            annotation(Evaluate = true);
  parameter SI.Temperature
            Tconom=Tcinom+eta*Pnom/(system.cp*wCnom)  
            annotation(Evaluate = true);
  parameter SI.Temperature
            Thostart=Thonom        
            annotation(Evaluate = true);     
  parameter SI.Temperature
            Tcostart=Tconom        
            annotation(Evaluate = true);             
  parameter SI.ThermalConductance
            G = (2*Pnom*system.cp*wCnom*wHnom)
                /(((2*Thinom-2*Tcinom)*system.cp*wCnom-Pnom*eta)*wHnom-Pnom*wCnom)
            annotation(Evaluate = true);
equation

  Ch*der(Tho) = hotIn.w*system.cp*(Thi-Tho)-Ph;
  Cc*der(Tco) = coldIn.w*system.cp*(Tci-Tco)+Pc;
  Ph          = G*(Thi+Tho-Tci-Tco)/2;
  Pc          = Ph*eta;
  Ploss       = Ph-Pc;
  Thi         = actualStream(hotIn.h)/system.cp;
  Tci         = actualStream(coldIn.h)/system.cp;

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
