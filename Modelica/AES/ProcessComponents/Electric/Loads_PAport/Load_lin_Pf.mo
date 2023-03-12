within AES.ProcessComponents.Electric.Loads_PAport;

model Load_lin_Pf
  extends Icons.Load;

  parameter SI.Power Pnom=10e6 "nominal P";
  parameter SI.Frequency fnom=50 "nominal f";
  
  AES.ProcessComponents.Electric.Interfaces.PowerAnglePort port annotation(
    Placement(visible = true, transformation(origin = {66, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  SI.AngularVelocity w(start=wnom);
  Modelica.Blocks.Interfaces.RealOutput Pact "actual P" annotation(
    Placement(visible = true, transformation(origin = {-120, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 100}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealOutput fl annotation(
    Placement(visible = true, transformation(origin = {-126, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-1.9984e-15, -100}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
protected
  final parameter SI.AngularVelocity wnom = 2*Modelica.Constants.pi*fnom; 
equation
  w    = der(port.theta)+wnom;
  Pact = port.P;

  Pact/Pnom = w/wnom;
  fl = w/(2*Modelica.Constants.pi);
annotation(
    Icon(graphics = {Text(origin = {35, 23}, extent = {{-53, 39}, {53, -39}}, textString = "D")}));
end Load_lin_Pf;