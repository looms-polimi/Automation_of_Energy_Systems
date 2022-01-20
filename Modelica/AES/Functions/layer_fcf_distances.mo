within AES.Functions;
function layer_fcf_distances "face-centres-face" 
  extends Modelica.Icons.Function;
  input Integer n "number of layers";
  input Real s[n] "layer thicknesses";
  output Real d[n + 1];
algorithm
  d[1] := s[1] / 2;
  d[n + 1] := s[n] / 2;
  for i in 2:n loop
    d[i] := s[i - 1] / 2 + s[i] / 2;
  end for;

  annotation (
  Documentation(info="<html>
<p><span style=\"font-family: MS Shell Dlg 2;\">This f</span>unction that sets the thickness in each layer component, given as input the number of layers and each thickness.</p>
<p>It is used in <a href=\"EEB.Components.BaseComponents.Envelope.SolidMultilayer_NonHomogeneous\">SolidMultilayer_NonHomogeneous</a>.</p>
</html>"));
end layer_fcf_distances;