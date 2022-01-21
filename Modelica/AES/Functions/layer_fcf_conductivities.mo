within AES.Functions;
function layer_fcf_conductivities "face-centres-face"
  extends Modelica.Icons.Function;
  input Real s[:];
  input Real lambda[:];
  output Real L[size(s,1) + 1];
protected
  Integer n;
algorithm
  n := size(s,1);
  L[1] := lambda[1];
  L[n + 1] := lambda[n];
  for i in 2:n loop
    L[i] := lambda[i - 1] * lambda[i]
            / (s[i - 1] * lambda[i] + s[i] * lambda[i - 1])
            * (s[i - 1] + s[i]);
  end for;

  annotation (
  Documentation(info="<html>
<p><span style=\"font-family: MS Shell Dlg 2;\">This f</span>unction that sets the conductivities in each layer component, given as input the number of layers , each thickness and thermal conductivities.</p>
<p>It is used in <a href=\"EEB.Components.BaseComponents.Envelope.SolidMultilayer_NonHomogeneous\">SolidMultilayer_NonHomogeneous</a>.</p>
</html>"));
end layer_fcf_conductivities;