within AES.ProcessComponents.Electric.Generators_PAport;

model Generator_order0_prescribed_P
  extends Icons.Generator;
  
  parameter SI.Power Prated=30e6 "rated (active) power";
  parameter SI.Frequency fnom=50 "nominal frequency";
  parameter Real dnom=25 "angle to yield rated power at sync speed [deg]";
  parameter SI.Time Tox=4 "proper ox period";
  parameter Real xi=0.8 "damping";

  AES.ProcessComponents.Electric.Interfaces.PowerAnglePort port annotation(
    Placement(visible = true, transformation(origin = {66, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Pcmd "commanded active power [W]" annotation(
    Placement(visible = true, transformation(origin = {-96, 56}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));


 
  Modelica.Blocks.Interfaces.RealOutput fg "local instantaneous generator frequency" annotation(
    Placement(visible = true, transformation(origin = {6, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -100}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  SI.Angle thetag,thetap "generator and port absolute angles";  
  SI.Angle deltag "generator angle wrt port"; 
  SI.AngularVelocity wg(start=wnom,fixed=true),wp(start=wnom) "generator and port rot speed";
  SI.ActivePower Pm,Pe "power generated and taken at port (positive)";
  SI.Torque taum,taue "torques, generated (mech) and at port (elec)";

protected
  final parameter SI.AngularVelocity wnom=2*Modelica.Constants.pi*fnom
                  "nominal frequency in r/s";
  final parameter SI.Angle dnomr = dnom/180*Modelica.Constants.pi
                  "nominal machine angle in r";
  final parameter Real K = Prated/wnom/(dnom/180*Modelica.Constants.pi)
                  "Prated,dnom->elasticity"; 
  final parameter Real J = K/(2*Modelica.Constants.pi/Tox)^2
                  "K,Tox->inertia";
  final parameter Real F = 2*xi*sqrt(J*K)
                  "K,J,xi->friction";
equation
  Pm             =  Pcmd;
  thetap         =  port.theta;
  Pe             = -port.P;
  Pm             =  wg*taum;
  deltag         =  thetag-thetap;
    
  wg-wnom        =  der(thetag);
  wp-wnom        =  der(thetap);
  
  Pe             =  wp*taue;
  taue           =  K*deltag+F*der(deltag);

  J*der(wg)      =  taum-taue;

  fg             =  wg/(2*Modelica.Constants.pi);
  
initial equation
  Pm     = Pcmd;
  thetag = Pm/K/wnom;

  annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002));
end Generator_order0_prescribed_P;