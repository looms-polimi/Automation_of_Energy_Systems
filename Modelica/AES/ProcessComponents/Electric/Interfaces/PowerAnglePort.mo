within AES.ProcessComponents.Electric.Interfaces;

connector PowerAnglePort
  SI.Angle theta;
  flow SI.ActivePower P;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(lineColor = {0, 0, 255}, fillColor = {114, 159, 207}, fillPattern = FillPattern.Solid, extent = {{-100, 98}, {100, -100}}, endAngle = 360), Text(origin = {1, 0}, fillColor = {46, 52, 54}, fillPattern = FillPattern.Solid, extent = {{-69, 90}, {69, -90}}, textString = "PA")}));
end PowerAnglePort;