within AES.ProcessComponents.Thermal.DistrictHeating;

model TwinPipe
  extends Interfaces.flowTwoTwinPorts_pwh;
  outer System_settings.System_terrain terrain;
  
  parameter SI.Length L=100 "length";
  parameter SI.Length Di=0.1 "inner diameter";
  parameter SI.Length t=0.002 "wall thickness";
  parameter SI.Length dz=0 "height of port b (out) over port a (in)";
  parameter SI.MassFlowRate wnom=1 "nominal flow rate";
  parameter Real kdp=0.1 "nominal dp [bar] per km at nominal flow";
  parameter SI.Density row=7600 "wall density";
  parameter SI.SpecificHeatCapacity cw=600 "wall specific heat";
  parameter SI.ThermalConductivity lambdaw=40 "wall thermal conductivity";  
  parameter Integer n(min=2)=5 "No. of lumps (axial), minimum 2";
  parameter Integer l(min=2)=2 "No. of  wall layers (radial), minimum 2"; 
  parameter SI.Temperature Thnom=363.15 "nominal H pipe temperature";
  parameter Real kloss=5 "loss [W/m] to terrain at Thnom";
  parameter SI.Temperature Tstart=293.15 "initial T, all lumps";
  parameter Boolean hasInertia=true "account for fluid inertia";
  
  SI.Power Ploss_total = Tterrain.port.Q_flow;

  AES.ProcessComponents.Thermal.Liquid.Tube tubeH(Di = Di, L = L, Tstart = Tstart, cw = cw, dz = dz, fluidHeats = true, hasInertia = hasInertia, kdp = kdp / 2, l = l, lambdaw = lambdaw, n = n, row = row, t = t, wnom = wnom)  annotation(
    Placement(visible = true, transformation(origin = {-20, 70}, extent = {{-20, 20}, {20, -20}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tube tubeC(Di = Di, L = L, Tstart = Tstart, cw = cw, dz = dz, fluidHeats = true, hasInertia = hasInertia, kdp = kdp / 2, l = l, lambdaw = lambdaw, n = n, row = row, t = t, wnom = wnom) annotation(
    Placement(visible = true, transformation(origin = {-20, -70}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.VectorHPtoHP_conductor pipeH2filler(Gtotal = Gloss, n = n)  annotation(
    Placement(visible = true, transformation(origin = {-20, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.VectorHPtoHP_conductor pipeC2filler(Gtotal = Gloss, n = n)  annotation(
    Placement(visible = true, transformation(origin = {-20, -30}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature Tterrain(T = terrain.T)  annotation(
    Placement(visible = true, transformation(origin = {40, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  SI.Temperature Thi,Tho,Tci,Tco;
protected
  final parameter SI.ThermalConductance Gloss = kloss*L/(Thnom-terrain.T) annotation(Evaluate = true);
equation
  connect(tpwh_a.H, tubeH.pwh_a) annotation(
    Line(points = {{-110, 0}, {-80, 0}, {-80, 70}, {-44, 70}}));
  connect(tubeH.pwh_b, tpwh_b.H) annotation(
    Line(points = {{4, 70}, {80, 70}, {80, 0}, {110, 0}}, color = {46, 52, 54}));
  connect(tpwh_b.C, tubeC.pwh_a) annotation(
    Line(points = {{110, 0}, {80, 0}, {80, -70}, {4, -70}}));
  connect(tubeC.pwh_b, tpwh_a.C) annotation(
    Line(points = {{-44, -70}, {-80, -70}, {-80, 0}, {-110, 0}}, color = {46, 52, 54}));
  Thi = tubeH.fluidStream.Ta;
  Tho = tubeH.fluidStream.Tb;
  Tci = tubeC.fluidStream.Tb;
  Tco = tubeC.fluidStream.Tb;
  connect(tubeH.surf, pipeH2filler.vectorHP) annotation(
    Line(points = {{-20, 59.2}, {-20, 35.2}}, color = {144, 5, 5}));
  connect(pipeC2filler.vectorHP, tubeC.surf) annotation(
    Line(points = {{-20, -36.6667}, {-20, -60.6667}}, color = {144, 5, 5}));
  connect(pipeH2filler.HP, pipeC2filler.HP) annotation(
    Line(points = {{-20, 23}, {-20, -23}}, color = {191, 0, 0}));
  connect(pipeH2filler.HP, Tterrain.port) annotation(
    Line(points = {{-20, 23}, {-20, 0}, {30, 0}}, color = {191, 0, 0}));
  annotation(
    Icon(graphics = {Rectangle(fillColor = {193, 125, 17}, fillPattern = FillPattern.Solid, extent = {{-100, 50}, {100, -50}}), Rectangle(lineColor = {193, 125, 17},fillColor = {252, 213, 155}, fillPattern = FillPattern.CrossDiag, extent = {{-95, 45}, {95, -45}}), Rectangle(origin = {0, -18}, lineColor = {32, 74, 135}, fillColor = {255, 255, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-95, 15}, {95, -15}}), Rectangle(origin = {0, 18}, lineColor = {204, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-95, 15}, {95, -15}}), Polygon(origin = {-60, -18}, rotation = 180, fillColor = {252, 233, 79}, fillPattern = FillPattern.Solid, points = {{-70, -4}, {0, -4}, {0, -10}, {22, 0}, {0, 10}, {0, 4}, {-70, 4}, {-70, -4}}), Polygon(origin = {58, 18}, fillColor = {252, 233, 79}, fillPattern = FillPattern.Solid, points = {{-68, -4}, {0, -4}, {0, -10}, {22, 0}, {0, 10}, {0, 4}, {-68, 4}, {-68, -4}}), Text(origin = {-116, 38}, extent = {{-18, 18}, {18, -18}}, textString = "a"), Text(origin = {116, 38}, extent = {{-18, 18}, {18, -18}}, textString = "b")}));
end TwinPipe;