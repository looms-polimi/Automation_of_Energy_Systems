within AES.Functions;

function sqrtReg "Symmetric square root approximation with finite derivative in zero"
  extends Modelica.Icons.Function;
  input Real x;
  input Real delta = 0.01 "Range of significant deviation from sqrt(x)";
  output Real y;
algorithm
  y := x / sqrt(sqrt(x * x + delta * delta));
  annotation(derivative(zeroDerivative = delta)=Functions.sqrtReg_der,
    Documentation(info = "<html>
<p>This function approximates square root, such that the derivative is finite in zero.</p>
</html>"));
end sqrtReg;