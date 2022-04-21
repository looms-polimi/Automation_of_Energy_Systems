within AES.ProcessComponents.Electric.Loads_PAport;

model Load_prescribed_P
  extends Icons.Load;
  parameter SI.Frequency fnom=50 "nominal f";
  AES.ProcessComponents.Electric.Interfaces.PowerAnglePort port annotation(
    Placement(visible = true, transformation(origin = {100, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput P annotation(
    Placement(visible = true, transformation(origin = {-118, -18}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput fl annotation(
    Placement(visible = true, transformation(origin = {-126, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-1.9984e-15, -100}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
protected
  final parameter SI.AngularVelocity wnom = 2*Modelica.Constants.pi*fnom; 
equation
  port.P = P;
  fl = (wnom+der(port.theta))/(2*Modelica.Constants.pi);
end Load_prescribed_P;