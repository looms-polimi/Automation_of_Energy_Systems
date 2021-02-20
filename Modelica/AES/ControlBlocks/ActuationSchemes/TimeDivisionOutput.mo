within AES.ControlBlocks.ActuationSchemes;

model TimeDivisionOutput
  extends Icons.ControlBlock;
  Modelica.Blocks.Interfaces.RealInput cmd01 annotation(
  Placement(visible = true,transformation(extent = {{-100, -20}, {-60, 20}}, rotation = 0), iconTransformation(extent = {{-140, -20}, {-100, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput TDO annotation(
  Placement(visible = true,transformation(extent = {{46, -20}, {86, 20}}, rotation = 0), iconTransformation(extent = {{100, -20}, {140, 20}}, rotation = 0)));
  parameter SI.Time Ttdo = 1 "TDO timebase";
  discrete Real tdo;
  discrete Real timeNextEv;
equation
  TDO = tdo;
initial algorithm
  timeNextEv := 0;
  tdo := 0;
algorithm
  when sample(0, Ttdo) then
    if cmd01 <= 0 then
      tdo := 0;
      timeNextEv := -1;
    elseif cmd01 >= 1 then
      tdo := 1;
      timeNextEv := -1;
    else
      tdo := 1;
      timeNextEv := time + cmd01 * Ttdo;
    end if;
  end when;
  when time >= timeNextEv and timeNextEv >= 0 then
    if cmd01 > 0 and cmd01 < 1 then
      tdo := 0;
    end if;
  end when;
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-78, 80}, {78, -74}}, textString = "Time\nDivision\nOutput")}));
end TimeDivisionOutput;