within AES.ProcessComponents.Thermal.HVAC;

model StratifiedTank_2zones
  outer System_settings.System_liquid system;
  AES.ProcessComponents.Thermal.Interfaces.pwhPort hotIn annotation(
    Placement(visible = true, transformation(origin = {-112, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Interfaces.pwhPort coldOut annotation(
    Placement(visible = true, transformation(origin = {-102, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Interfaces.pwhPort hotOut annotation(
    Placement(visible = true, transformation(origin = {-92, 92}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Interfaces.pwhPort coldIn annotation(
    Placement(visible = true, transformation(origin = {-82, 102}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  parameter SI.Area Abase=1 "base area";
  parameter SI.Length H=3 "height";
  parameter SI.Temperature Thotstart=273.15+40;
  parameter SI.Temperature Tcoldstart=273.15+20;
  parameter SI.Length lcoldstart=1.5 "initial cold height";
  parameter SI.Time tmix=86400 "time to reach uniform T at lcold=H/2";
  SI.Length lcold(start=lcoldstart,stateSelect=StateSelect.prefer) "cold height";
  SI.Temperature Thot(start=Thotstart,stateSelect=StateSelect.prefer);
  SI.Temperature Tcold(start=Tcoldstart,stateSelect=StateSelect.prefer);
  SI.Mass Mhot(stateSelect=StateSelect.never);
  SI.Mass Mcold(stateSelect=StateSelect.never);
  SI.Energy Ehot(stateSelect=StateSelect.never);
  SI.Energy Ecold(stateSelect=StateSelect.never);
protected
  parameter SI.Density ro=system.ro;
  parameter SI.SpecificHeatCapacity cp=system.cp;
  parameter SI.ThermalConductivity lambda=system.lambda;
  parameter SI.DynamicViscosity mu=system.mu;
  parameter SI.ThermalConductance Gmix=cp*ro*Abase*H/tmix;
equation

  0          = coldIn.w+coldOut.w+hotIn.w+hotOut.w;
  coldIn.p   = coldOut.p;
  hotIn.p    = hotOut.p;
  hotIn.p    = coldIn.p;
  
  Mcold      = ro*Abase*lcold;
  Mhot       = ro*Abase*(H-lcold);
  Ecold      = Mcold*cp*Tcold;  
  Ehot       = Mhot*cp*Thot; 
  
  if lcold<0 and coldIn.w+coldOut.w<0 then /* all hot */
     der(Mcold) = 0;
     der(Ecold) = 0;
     der(Ehot)  = hotIn.w*actualStream(hotIn.h)+hotOut.w*actualStream(hotOut.h)
                  +coldIn.w*actualStream(coldIn.h)+coldOut.w*actualStream(coldOut.h);
     coldIn.h   = cp*Thot;
     coldOut.h  = cp*Thot;   
     hotIn.h    = cp*Thot;
     hotOut.h   = cp*Thot;     
  elseif lcold>H and coldIn.w+coldOut.w>0 then /* all cold */
     der(Mcold) = 0;
     der(Ecold) = coldIn.w*actualStream(coldIn.h)+coldOut.w*actualStream(coldOut.h)
                  +hotIn.w*actualStream(hotIn.h)+hotOut.w*actualStream(hotOut.h);
     der(Ehot)  = 0;
     coldIn.h   = cp*Tcold;
     coldOut.h  = cp*Tcold;   
     hotIn.h    = cp*Tcold;
     hotOut.h   = cp*Tcold;  
  else /* normal */
     der(Mcold) = coldIn.w+coldOut.w;
     der(Ecold) = coldIn.w*actualStream(coldIn.h)+coldOut.w*actualStream(coldOut.h)
                  +Gmix*(Thot-Tcold);
     der(Ehot)  = hotIn.w*actualStream(hotIn.h)+hotOut.w*actualStream(hotOut.h)
                  -Gmix*(Thot-Tcold);
     coldIn.h   = cp*Tcold;
     coldOut.h  = cp*Tcold;   
     hotIn.h    = cp*Thot;
     hotOut.h   = cp*Thot;
  end if;


  
annotation(
    Icon(graphics = {Rectangle(origin = {0, 40}, lineColor = {204, 0, 0}, fillColor = {250, 173, 173}, fillPattern = FillPattern.VerticalCylinder, extent = {{-100, 60}, {100, -60}}), Polygon(origin = {-82, 59}, fillColor = {250, 173, 173}, fillPattern = FillPattern.Solid, points = {{-10, 21}, {-10, -19}, {10, 1}, {-10, 21}}), Polygon(origin = {82, 59}, fillColor = {250, 173, 173}, fillPattern = FillPattern.Solid, points = {{-10, 21}, {-10, -19}, {10, 1}, {-10, 21}}), Rectangle(origin = {0, -60}, lineColor = {32, 74, 135}, fillColor = {170, 255, 255}, fillPattern = FillPattern.VerticalCylinder, extent = {{-100, 40}, {100, -40}}), Polygon(origin = {-62, -61}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid, points = {{-10, 21}, {-10, -19}, {-30, 1}, {-10, 21}}), Polygon(origin = {98, -61}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid, points = {{-10, 21}, {-10, -19}, {-30, 1}, {-10, 21}}), Polygon(origin = {14, -11}, fillColor = {252, 233, 79}, fillPattern = FillPattern.Solid, points = {{-2, 21}, {-12, 9}, {-4, 9}, {-4, -29}, {-12, -29}, {-2, -39}, {8, -29}, {0, -29}, {0, 9}, {8, 9}, {-2, 21}})}),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end StratifiedTank_2zones;