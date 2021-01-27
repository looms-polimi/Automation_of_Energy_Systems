within AES.ProcessComponents.Thermal.Interfaces;

connector vectorHeatPort
  parameter Integer n=3;
  SI.Temperature T[n];
  flow SI.Power Q_flow[n];
  annotation(
    Icon(coordinateSystem(extent = {{-300, -100}, {300, 100}}), graphics = {Rectangle(origin = {-250, 0}, lineColor = {144, 5, 5}, fillColor = {245, 121, 0}, fillPattern = FillPattern.VerticalCylinder, extent = {{-50, 100}, {50, -100}}), Rectangle(origin = {-150, 0}, lineColor = {144, 5, 5}, fillColor = {245, 121, 0}, fillPattern = FillPattern.VerticalCylinder, extent = {{-50, 100}, {50, -100}}), Rectangle(origin = {50, 0}, lineColor = {144, 5, 5}, fillColor = {245, 121, 0}, fillPattern = FillPattern.VerticalCylinder, extent = {{-50, 100}, {50, -100}}), Rectangle(origin = {-50, 0}, lineColor = {144, 5, 5}, fillColor = {245, 121, 0}, fillPattern = FillPattern.VerticalCylinder, extent = {{-50, 100}, {50, -100}}), Rectangle(origin = {250, 0}, lineColor = {144, 5, 5}, fillColor = {245, 121, 0}, fillPattern = FillPattern.VerticalCylinder, extent = {{-50, 100}, {50, -100}}), Rectangle(origin = {150, 0}, lineColor = {144, 5, 5}, fillColor = {245, 121, 0}, fillPattern = FillPattern.VerticalCylinder, extent = {{-50, 100}, {50, -100}})}));
end vectorHeatPort;