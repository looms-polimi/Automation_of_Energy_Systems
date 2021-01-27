within AES.ControlBlocks.AnalogueControllers;

model TITOdecoupler_zeroInit
extends Icons.AnalogueController200x200;
  parameter Real[:] P11n = {1};
  parameter Real[:] P11d = {1,1};
  parameter Real[:] P12n = {0.5};
  parameter Real[:] P12d = {2,1};
  parameter Real[:] P21n = {0.3};
  parameter Real[:] P21d = {3,1};
  parameter Real[:] P22n = {1.5};
  parameter Real[:] P22d = {1.2,1};
  parameter Real[:] Fcs1d = {0.01,1}; 
  parameter Real[:] Fcs2d = {0.01,1};
  Modelica.Blocks.Interfaces.RealInput CSfromC1 annotation(
    Placement(visible = true, transformation(origin = {-160, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput CSfromC2 annotation(
    Placement(visible = true, transformation(origin = {-160, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput CS1 annotation(
    Placement(visible = true, transformation(origin = {140, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {100, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput CS2 annotation(
    Placement(visible = true, transformation(origin = {140, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {102, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput BiasToC1 annotation(
    Placement(visible = true, transformation(origin = {-160, 20}, extent = {{20, -20}, {-20, 20}}, rotation = 0), iconTransformation(origin = {-100, 40}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput BiasToC2 annotation(
    Placement(visible = true, transformation(origin = {-160, -20}, extent = {{20, -20}, {-20, 20}}, rotation = 0), iconTransformation(origin = {-100, -40}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));

  final parameter Real[size(P12n,1)+size(P11d,1)-1] P12oP11n=Functions.conv(P12n,P11d);
  final parameter Real[size(P12d,1)+size(P11n,1)-1] P12oP11d=Functions.conv(P12d,P11n);
  final parameter Real[size(P21n,1)+size(P22d,1)-1] P21oP22n=Functions.conv(P21n,P22d);
  final parameter Real[size(P21d,1)+size(P22n,1)-1] P21oP22d=Functions.conv(P21d,P22n);
protected  
  Modelica.Blocks.Continuous.TransferFunction D12(a = P21oP22d, b = -P21oP22n)  annotation(
    Placement(visible = true, transformation(origin = {-50, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction D21(a = P12oP11d, b = -P12oP11n)  annotation(
    Placement(visible = true, transformation(origin = {-50, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction Fcs2(a = Fcs2d, b = {1}, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = 0)  annotation(
    Placement(visible = true, transformation(origin = {10, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction Fcs1(a = Fcs1d, b = {1}, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = 0)  annotation(
    Placement(visible = true, transformation(origin = {10, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(D21.u, Fcs2.y) annotation(
    Line(points = {{-38, 20}, {2, 20}, {2, 20}, {0, 20}, {0, 20}}, color = {0, 0, 127}));
  connect(Fcs2.u, CS2) annotation(
    Line(points = {{22, 20}, {40, 20}, {40, -60}, {140, -60}, {140, -60}}, color = {0, 0, 127}));
  connect(Fcs1.y, D12.u) annotation(
    Line(points = {{0, -20}, {-38, -20}, {-38, -20}, {-38, -20}}, color = {0, 0, 127}));
  connect(CS1, Fcs1.u) annotation(
    Line(points = {{140, 60}, {60, 60}, {60, -20}, {22, -20}}, color = {0, 0, 127}));
  connect(D12.y, BiasToC2) annotation(
    Line(points = {{-62, -20}, {-150, -20}, {-150, -20}, {-160, -20}}, color = {0, 0, 127}));
  connect(BiasToC1, D21.y) annotation(
    Line(points = {{-160, 20}, {-60, 20}, {-60, 20}, {-60, 20}, {-60, 20}}, color = {0, 0, 127}));
  connect(CSfromC2, CS2) annotation(
    Line(points = {{-160, -60}, {122, -60}, {122, -60}, {140, -60}}, color = {0, 0, 127}));
  connect(CSfromC1, CS1) annotation(
    Line(points = {{-160, 60}, {122, 60}, {122, 60}, {140, 60}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    Icon(coordinateSystem(initialScale = 0.1), graphics = {Text(origin = {-12, 34}, extent = {{-46, 38}, {70, -48}}, textString = "TITOd0"), Text(origin = {-4, -80}, extent = {{-30, 16}, {30, -16}}, textString = "%name")}));
end TITOdecoupler_zeroInit;