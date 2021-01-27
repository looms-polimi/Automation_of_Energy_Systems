within AES.ProcessComponents.Thermal.Interfaces;

connector pwhPort
  SI.Pressure p;
  flow SI.MassFlowRate w;
  stream SI.SpecificEnthalpy h;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(lineColor = {46, 52, 54}, fillColor = {211, 215, 207}, fillPattern = FillPattern.Solid, extent = {{-100, 98}, {100, -100}}, endAngle = 360), Text(origin = {1, 2}, fillColor = {186, 189, 182}, fillPattern = FillPattern.Solid, extent = {{-69, 90}, {69, -90}}, textString = "pwh")}));
end pwhPort;