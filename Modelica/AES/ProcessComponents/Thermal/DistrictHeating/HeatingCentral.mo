within AES.ProcessComponents.Thermal.DistrictHeating;

model HeatingCentral
  parameter SI.Power Pmax=1e6 "max power";
  parameter SI.MassFlowRate dp0=1 "nominal H-C pressore deop at w=w0";
  parameter SI.MassFlowRate w0=1 "mass flowrate at dp0 and spw01=1";
  parameter Real w0off=0.02 "fraction of w0 when off";
  parameter SI.Volume V=0.25 "liquid volume";
  parameter SI.Time Tcl = 30 "CL temp ctrl TC";
  parameter SI.Time Tpump = 2 "CL flow ctrl TC";
  parameter SI.Temperature Tstart = 273.15 + 25 "initial fluid temp";
  AES.ProcessComponents.Thermal.HVAC.ControlledLiquidHeater_lim H(Pmax = Pmax, Tcl = Tcl, Tstart = Tstart, V = V)  annotation(
    Placement(visible = true, transformation(origin = {-10, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Interfaces.pwhTwinPort tpwh_a annotation(
    Placement(visible = true, transformation(origin = {110, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {116, 0}, extent = {{16, -20}, {-16, 20}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Interfaces.pwhPortSplitter pwh annotation(
    Placement(visible = true, transformation(origin = {70, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput spTfo annotation(
    Placement(visible = true, transformation(origin = {-100, 2}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput spw01 annotation(
    Placement(visible = true, transformation(origin = {-160, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.BooleanInput ON annotation(
    Placement(visible = true, transformation(origin = {-100, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder FlowCtrl(T = Tpump)  annotation(
    Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression wsp(y = if ON then spw01 else w0off * spw01)  annotation(
    Placement(visible = true, transformation(origin = {-100, 50}, extent = {{-60, -10}, {60, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Liquid.Tsensor t1 annotation(
    Placement(visible = true, transformation(origin = {-2, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Liquid.Tsensor t2 annotation(
    Placement(visible = true, transformation(origin = {52, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Liquid.Pump_volumetric P(w0 = w0)  annotation(
    Placement(visible = true, transformation(origin = {28, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(pwh.pwhTwin_HC, tpwh_a) annotation(
    Line(points = {{81.6, -10}, {109.6, -10}}));
  connect(pwh.pwh_C, H.pwh_a) annotation(
    Line(points = {{58, -16}, {58, -34}, {-34, -34}, {-34, -4}, {-22, -4}}, color = {46, 52, 54}));
  connect(spTfo, H.To) annotation(
    Line(points = {{-100, 2}, {-22, 2}}, color = {0, 0, 127}));
  connect(ON, H.ON) annotation(
    Line(points = {{-100, -30}, {-60, -30}, {-60, -10}, {-22, -10}}, color = {255, 0, 255}));
  connect(wsp.y, FlowCtrl.u) annotation(
    Line(points = {{-34, 50}, {-22, 50}}, color = {0, 0, 127}));
  connect(FlowCtrl.y, P.cmd) annotation(
    Line(points = {{2, 50}, {28, 50}, {28, 4}}, color = {0, 0, 127}));
  connect(H.pwh_b, P.pwh_a) annotation(
    Line(points = {{2, -4}, {16, -4}}, color = {46, 52, 54}));
  connect(t1.pwh_a, P.pwh_a) annotation(
    Line(points = {{10, 80}, {16, 80}, {16, -4}}, color = {46, 52, 54}));
  connect(P.pwh_b, pwh.pwh_H) annotation(
    Line(points = {{40, -4}, {58, -4}}, color = {46, 52, 54}));
  connect(t2.pwh_a, pwh.pwh_H) annotation(
    Line(points = {{64, 74}, {74, 74}, {74, 44}, {48, 44}, {48, -4}, {58, -4}}, color = {46, 52, 54}));
initial equation
  FlowCtrl.y = if ON then spw01 else w0off * spw01;
annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    Icon(graphics = {Rectangle(origin = {70.1, 11}, fillColor = {238, 238, 236}, fillPattern = FillPattern.HorizontalCylinder, extent = {{29.9, 5}, {-29.9, -5}}), Rectangle(origin = {70.1, -11}, fillColor = {238, 238, 236}, fillPattern = FillPattern.HorizontalCylinder, extent = {{29.9, 5}, {-29.9, -5}}), Rectangle(origin = {-49.98, 0}, fillColor = {85, 87, 83}, fillPattern = FillPattern.Solid, extent = {{-50.02, 80}, {50.02, -80}}), Rectangle(origin = {19.9, -20.02}, fillColor = {193, 125, 17}, fillPattern = FillPattern.Solid, extent = {{-19.9, 60.02}, {19.9, -60.02}}), Text(origin = {-48, -2}, lineColor = {255, 255, 85}, extent = {{-42, 52}, {42, -52}}, textString = "HS")}));
annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    Icon(graphics = {Polygon(origin = {-40, 10}, fillColor = {136, 138, 133}, fillPattern = FillPattern.Solid, points = {{-60, 50}, {60, 90}, {60, -90}, {-60, -90}, {-60, 50}}), Rectangle(origin = {40, -20}, fillColor = {233, 185, 110}, fillPattern = FillPattern.Solid, extent = {{-20, 60}, {20, -60}}), Text(origin = {-43, -5}, lineColor = {255, 255, 85}, extent = {{-41, 45}, {41, -45}}, textString = "HC"), Rectangle(origin = {80, 9}, fillColor = {238, 238, 236}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-20, 7}, {20, -7}}), Rectangle(origin = {80, -9}, fillColor = {238, 238, 236}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-20, 7}, {20, -7}})}));
end HeatingCentral;