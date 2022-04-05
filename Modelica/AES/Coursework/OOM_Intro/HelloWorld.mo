within AES.Coursework.OOM_Intro;

model HelloWorld
  extends Icons.CourseworkModel;
  
  parameter Real a = -0.1;
  parameter Real b = 0.5;
  parameter Real xstart = 1;
  
  Real x(start = xstart), u;
  
equation

  0 = der(x) - a * x + b * u;
  u = if time < 10 then 0 else 1;
  
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.0333333));
end HelloWorld;
