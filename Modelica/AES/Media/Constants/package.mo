within AES.Media;
package Constants "Pakage with constants"
  extends Modelica.Icons.UtilitiesPackage;
  final constant SI.SpecificHeatCapacity cp_a = 1005 "Specific heat capacity of dry air";
  final constant SI.SpecificHeatCapacity cp_v = 1870 "Specific heat capacity of water vapour";
  final constant SI.SpecificHeatCapacity cp_l = 4186 "Specific heat capacity of liquid water";
  final constant SI.SpecificEnthalpy h_v_3pt = 2501 * 1e3 "Specific enthalpy of water vapour at triple point (0?C) [J/Kg]";
  final constant SI.SpecificHeatCapacity Ra = Modelica.Constants.R/MMa "Gas constant of dry air";
  final constant SI.SpecificHeatCapacity Rv = Modelica.Constants.R/MMw "Gas constant of water vapour in moist air";
  final constant SI.Density d_l = 1000 "density of subcooled water";
  final constant SI.MolarMass MMa = 0.029 "molar mass of dry air";
  final constant SI.MolarMass MMw = 0.018 "molar mass of water";
  final constant SI.Pressure patm = 101325 "Atmospheric pressure";
  final constant SI.Density d_a_typ = 1.1 "typ dens of air for w/q param conv";
end Constants;