within AES;

package Media "Package with medium models"
  extends Modelica.Icons.MaterialPropertiesPackage;
  annotation(
    Documentation(info = "<html>
<p>This package contain media models for moist air and water. These models are simpler than the ones present in <a href=\"Modelica.Media\">Modelica.Media</a>, therefore often with a more efficient simulation. The leak of accuracy is not so relevant thanks to the range temperature in building HVAC applications.</p>
<p>There is also a <a href=\"BuildingsAndPlants.Media.Materials\">Materials</a> package containing records with properties of many materials.</p>
</html>"));
end Media;