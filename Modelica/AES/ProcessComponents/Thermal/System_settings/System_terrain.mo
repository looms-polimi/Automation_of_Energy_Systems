within AES.ProcessComponents.Thermal.System_settings;

model System_terrain
  extends Icons.Settings;
  
  parameter SI.Temperature T=283.15 "terrain temperature";
  annotation(
    defaultComponentName="terrain",
    defaultComponentPrefixes="inner",
    missingInnerMessage="Your model is using an outer \"terrain\" component but an inner \"terrain\" component is not defined. Drag AES.ProcessComponents.Thermal.System_settings.System_terrain into your model to specify the terrain properties.",
  Icon(graphics = {Polygon(origin = {44, -54}, fillColor = {143, 89, 2}, fillPattern = FillPattern.Solid, points = {{-36, 20}, {36, 22}, {10, -22}, {-28, -22}, {-36, 20}})}));
end System_terrain;