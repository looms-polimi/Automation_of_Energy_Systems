within AES.ProcessComponents.Electric.Connections_PAport;

model IdealBreaker
  extends Icons.PAconnection;
  AES.ProcessComponents.Electric.Interfaces.PowerAnglePort port_a annotation(
    Placement(visible = true, transformation(origin = {-126, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  AES.ProcessComponents.Electric.Interfaces.PowerAnglePort port_b annotation(
    Placement(visible = true, transformation(origin = {98, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -1}, extent = {{-20, -21}, {20, 21}}, rotation = 0)));
  Modelica.Blocks.Interfaces.BooleanInput close annotation(
    Placement(visible = true, transformation(origin = {-218, 38}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {0, 100}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
//protected
   SI.Power P;
   SI.AngularVelocity wa,wb,deltaw;
equation
  port_a.P+port_b.P = 0;
  P                 = port_a.P;
  wa                = der(port_a.theta);
  wb                = der(port_b.theta);
  deltaw            = wa-wb;
  if close then
     deltaw = 0;
  else
     P      = 0;
  end if;
  
end IdealBreaker;