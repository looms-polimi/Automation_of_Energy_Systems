within AES.Coursework.OOM_Intro;

model HelloWorld_inverse
  extends Icons.CourseworkModel;
  
  parameter Real a = -0.1;
  parameter Real b = 0.5;
  Real x, u;
equation
  der(x) = a * x + b * u;
  x = 2 * (1 - exp(-time / 2));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.0333333));
end HelloWorld_inverse;
