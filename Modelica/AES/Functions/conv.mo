within AES.Functions;

function conv
  extends Modelica.Icons.Function;

  input Real[:] cp1 "coeffs of poly 1 (dec pwr)";
  input Real[:] cp2 "coeffs of poly 2 (dec pwr)";
  output Real[size(cp1,1)+size(cp2,1)-1] cpo  "coeffs of product (dec pwr)";
protected 
  Integer n1,n2;  
algorithm
 
  n1 := size(cp1,1);
  n2 := size(cp2,1);

  for i in 1:n1+n2-1 loop
    cpo[i] := 0;
    for j in 1:n2 loop
        if i-j+1>0 and i-j+1<=n1 then
           cpo[i] := cpo[i]+cp1[i-j+1]*cp2[j];
        end if;
    end for;
end for;

end conv;