within AES.ProcessComponents.Electric.Loads_PAport;

model Load_prescribed_P
  extends Icons.Load;
  
  AES.ProcessComponents.Electric.Interfaces.PowerAnglePort port annotation(
    Placement(visible = true, transformation(origin = {100, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput P annotation(
    Placement(visible = true, transformation(origin = {-118, -18}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput fl annotation(
    Placement(visible = true, transformation(origin = {-126, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-1.9984e-15, -100}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));

equation
  port.P = P;
  fl = der(port.theta)/(2*Modelica.Constants.pi);
end Load_prescribed_P;