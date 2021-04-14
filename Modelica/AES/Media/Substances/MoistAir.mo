within AES.Media.Substances;

model MoistAir "Moist air"
  extends Modelica.Icons.MaterialProperty;
  import MAC = AES.Media.Constants;
  input SI.Pressure p "pressure";
  input SI.Temperature T "temperature";
  input SI.MassFraction X "absolute humidity [kg vap/kg da]";
  //-----------------------------------------------------------------------------
  SI.MassFraction x "vapour mass fraction [kg vap/kg tot]";
  SI.Pressure pv "vapour partial pressure";
  SI.Pressure pvs "vapour saturation pressure";
  Real phi "relative humidity";
  SI.Temperature Twb "wet bulb temperature";
  SI.MassFraction Xs "absolute humidity [kg vap/kg da] at saturation (phi=1)";
  SI.SpecificEnthalpy ha "specific enthalpy of dry air [J/kg da]";
  SI.SpecificEnthalpy hv "specific enthalpy of vapour [J/kg vap]";
  SI.SpecificEnthalpy h "specific enthalpy of moist air [J/kg da]";
  SI.SpecificEnthalpy hl "specific enthalpy of liquid water at T [J/kg liq]";
  SI.Density d "density of moist air";
  SI.SpecificHeatCapacity cp "moist air specific heat capacity [J/kg da K]";
  SI.SpecificHeatCapacity R "equivalent gas constant of moist air";
equation
  x = X / (1 + X);
  pv = p * (X / 0.622) / (1 + X / 0.622);
  pvs = 610.78 * exp((T - 273.15) / (T - 273.15 + 238.3) * 17.2694);
  pv = pvs * phi;
  pv = 610.78 * exp((Twb - 273.15) / (Twb - 273.15 + 238.3) * 17.2694);
// for Twb
  pvs = p * (Xs / 0.622) / (1 + Xs / 0.622);
// for Xs
  ha = MAC.cp_a * (T - 273.15);
  hv = MAC.h_v_3pt + MAC.cp_v * (T - 273.15);
  h = ha + X * hv;
  hl = MAC.cp_l * (T - 273.15);
  d = (p - pv) / (MAC.Ra * T) + pv / (MAC.Rv * T);
  cp = MAC.cp_a + X * MAC.cp_v;
  R = MAC.Ra + MAC.Rv * X;
  annotation(
    Documentation(info = "<html>
<p>This is the moist air model that is based on Mollier Diagram.</p>
<p>In the HVAC systems, the air is generally considered as a binary mixture of dry air and water vapor, i.e. moist air. State properties of moist air are calculated by using the Dalton&rsquo;s law on perfect gas mixtures.</p>
<p>In order to find out the thermodynamic state of the moist air, we use the Gibbs&rsquo; phase rule</p>
<p align=\"center\">F = C &minus; P + 2 </p>
<p>where C is the number of components (in this case, vapor and dry air), P the number of phases in thermodynamic equilibrium (in this case the only phase is the gas one), and F the number of degrees of freedom.</p>
<p>Thus, dealing with moist air, C is two (vapor and dry air), P is one (gas phase only) and therefore F is equal to three. So we need to know the total pressure, the specific enthalpy h (using convetion that h=0 if T=0&deg;C and no water vapour is present), and the mass fraction X, which is the vapor and dry air mass ratio.</p>
</html>"));
end MoistAir;