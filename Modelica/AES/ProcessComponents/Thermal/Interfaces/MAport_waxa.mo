within AES.ProcessComponents.Thermal.Interfaces;

connector MAport_waxa "Interface for moist air (w,AU)"
  SI.AbsolutePressure pa "Pressure";
  flow SI.MassFlowRate wa "Dry air mass flowrate";
  stream SI.SpecificEnthalpy ha "Specific enthalpy";
  stream SI.MassFraction xa "Absolute humidity [Kg vap/Kg dry air]";
  annotation(
    defaultComponentName = "air_flange",
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse( fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid,extent = {{-40, 40}, {40, -40}}, endAngle = 360), Text(extent = {{-150, 110}, {150, 50}}, textString = "%name")}),
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(lineColor = {0, 100, 150}, fillColor = {240, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{-100, 100}, {100, -100}}, endAngle = 360), Text(origin = {3, -1}, extent = {{-59, 55}, {59, -55}}, textString = "MA")}),
    Documentation(info = "<html>
<p>This connector is composed of:</p>
<p>- a potential variable &QUOT;pa&QUOT; which is the pressure [Pa];</p>
<p>- a flow variable &QUOT;wa&QUOT; which is the dry air mass flowrate [kg/s];</p>
<p>- two stream variables &QUOT;ha&QUOT; and &QUOT;xa&QUOT; which are respectively specifc enthalpy [J/kg] and absolute humidity [Kg vap/Kg dry air].</p>
</html>"));
end MAport_waxa;