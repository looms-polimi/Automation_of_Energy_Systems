within AES.Functions;
function sqrtReg_der "Derivative of sqrtReg"
  extends Modelica.Icons.Function;
  input Real x;
  input Real delta = 0.01 "Range of significant deviation from sqrt(x)";
  input Real dx "Derivative of x";
  output Real dy;
algorithm
  dy := dx * 0.5 * (x * x + 2 * delta * delta) / (x * x + delta * delta) ^ 1.25;
end sqrtReg_der;