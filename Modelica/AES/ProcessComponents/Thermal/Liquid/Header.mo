within AES.ProcessComponents.Thermal.Liquid;

model Header
  extends Interfaces.flowTwoPorts_pwh;
  parameter SI.Volume V=1 "volume";
  parameter SI.Temperature Tstart=293.15 "initial T";
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort annotation(
    Placement(visible = true, transformation(origin = {-20, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-1, 99}, extent = {{-21, -21}, {21, 21}}, rotation = 0)));
  SI.Temperature T(start=Tstart) "fluid T";
protected
  final parameter SI.HeatCapacity C=system.ro*V*system.cp
        annotation(Evaluate = true);
equation
  dp         = 0;
  C*der(T)   =  pwh_a.w*actualStream(pwh_a.h)
               +pwh_b.w*actualStream(pwh_b.h)
               +heatPort.Q_flow;
  heatPort.T = T;
  hao        = system.cp*T;
  hbo        = system.cp*T;
initial equation
annotation(
    Icon(graphics = {Ellipse(fillColor = {211, 215, 207}, fillPattern = FillPattern.Sphere, extent = {{-100, 100}, {100, -100}}, endAngle = 360), Text(origin = {0, -120}, extent = {{-100, 20}, {100, -20}}, textString = "%name")}));
end Header;