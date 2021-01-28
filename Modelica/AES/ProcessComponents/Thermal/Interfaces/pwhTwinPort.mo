within AES.ProcessComponents.Thermal.Interfaces;

connector pwhTwinPort
  pwhPort H;
  pwhPort C;
  annotation(
    Icon(coordinateSystem(extent = {{-160, -200}, {160, 200}}), graphics = {Rectangle(origin = {60, 0}, fillColor = {211, 215, 207}, fillPattern = FillPattern.Solid, extent = {{-120, 200}, {100, -200}}), Ellipse(origin = {-60, 100}, fillColor = {239, 41, 41}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}, endAngle = 360), Ellipse(origin = {-60, -100}, fillColor = {32, 74, 135}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}, endAngle = 360), Text(origin = {-60, 101}, lineColor = {255, 255, 255}, extent = {{-90, 83}, {90, -83}}, textString = "H", textStyle = {TextStyle.Bold}), Text(origin = {-64, -101}, lineColor = {255, 255, 255}, extent = {{-90, 83}, {90, -83}}, textString = "C", textStyle = {TextStyle.Bold}), Text(origin = {87, 6}, fillColor = {186, 189, 182}, fillPattern = FillPattern.Solid, extent = {{-69, 90}, {69, -90}}, textString = "pwh")}));
end pwhTwinPort;