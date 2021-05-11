within AES.Devel_test_models;

model Test_SR01
  extends Icons.TestModel;
  AES.ControlBlocks.ActuationSchemes.SplitRange01 SR annotation(
    Placement(visible = true, transformation(origin = {-10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression u(y = time - 5)  annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(u.y, SR.CSi01) annotation(
    Line(points = {{-38, 30}, {-22, 30}}, color = {0, 0, 127}));
annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.02),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end Test_SR01;