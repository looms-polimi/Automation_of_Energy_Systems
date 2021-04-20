within AES.ControlBlocks.ActuationSchemes;

model DaisyChain_uniform
  extends Icons.ControlBlock;
  parameter Integer ns = 2;
  Modelica.Blocks.Interfaces.RealInput CSi01 annotation(
    Placement(visible = true,transformation(extent = {{-100, -20}, {-60, 20}}, rotation = 0), iconTransformation(extent = {{-140, -22}, {-100, 18}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput CSo01[ns] annotation(
    Placement(visible = true,transformation(extent = {{60, -20}, {100, 20}}, rotation = 0), iconTransformation(extent = {{100, -20}, {140, 20}}, rotation = 0)));
  Real csi, cso[ns], cso01tot;
equation
  csi = CSi01;
  cso = CSo01;
  for i in 1:ns loop
    cso[i] = max(0, min(1, (csi - (i - 1) / ns)*ns));
  end for;
  cso01tot = sum(cso);
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-78, 80}, {78, -74}}, textString = "Daisy\nChain\nuniform")}));
end DaisyChain_uniform;