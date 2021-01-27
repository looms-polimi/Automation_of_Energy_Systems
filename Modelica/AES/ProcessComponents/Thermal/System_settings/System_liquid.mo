within AES.ProcessComponents.Thermal.System_settings;

model System_liquid
  extends Icons.Settings;
  
  parameter SI.Density ro=1000 "working liquid density";
  parameter SI.SpecificHeatCapacity cp=4186 "working liquid specific heat";
  parameter SI.ThermalConductivity lambda=0.55 "working liquid thermal conductivity";
  parameter SI.DynamicViscosity mu=8.9e-4 "working liquid dynamic viscosity";
  annotation(
    defaultComponentName="system",
    defaultComponentPrefixes="inner",
    missingInnerMessage="Your model is using an outer \"system\" component but an inner \"system\" component is not defined. Drag AES.ProcessComponents.Thermal.System_settings.System_liquid into your model to specify the working fluid properties.",
  Icon(graphics = {Polygon(origin = {50, -30}, lineColor = {52, 101, 164}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Sphere, points = {{-14, 42}, {-26, 22}, {-34, 8}, {-38, -8}, {-38, -18}, {-34, -34}, {-18, -46}, {6, -46}, {18, -38}, {24, -20}, {22, 4}, {16, 22}, {4, 46}, {-2, 72}, {-14, 42}})}));
end System_liquid;