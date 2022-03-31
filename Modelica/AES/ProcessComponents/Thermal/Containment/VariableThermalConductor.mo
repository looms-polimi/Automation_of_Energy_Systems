within AES.ProcessComponents.Thermal.Containment;

model VariableThermalConductor
  Modelica.Blocks.Interfaces.RealInput Gc(unit="W/K")
    "Signal representing the convective thermal resistance in [K/W]"
    annotation (Placement(visible = true, transformation(origin = {0, 100}, extent = {{-20, -20}, {20, 20}}, rotation = 270), iconTransformation(extent = {{-20, -60}, {20, -20}}, rotation = 270)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a hp_a annotation (Placement(transformation(extent={{
            -110,-10},{-90,10}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b hp_b annotation (Placement(transformation(extent={{
            90,-10},{110,10}})));
equation
  hp_a.Q_flow = Gc*(hp_a.T-hp_b.T);
  hp_a.Q_flow = -hp_b.Q_flow;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
            100,100}}), graphics={Rectangle(origin = {450, 0},fillColor = {192, 192, 192}, fillPattern = FillPattern.Forward, extent = {{-540, 40}, {-360, -40}}),
        Text(origin = {-2, 54},lineColor = {0, 0, 255}, extent = {{-150, -90}, {150, -130}}, textString = "%name"),
        Line(points={{100,0},{100,0}}, color={0,127,255})}),
    Documentation(info="<html>
<p>
This is a model of linear heat convection, e.g., the heat transfer between a plate and the surrounding air; same as the
<a href=\"modelica://Modelica.Thermal.HeatTransfer.Components.Convection\">Convection</a> component
but using the convective resistance instead of the convective conductance as an input.
This is advantageous for series connections of ConvectiveResistors,
especially if it shall be allowed that a convective resistance is defined to be zero (i.e. no temperature difference).
</p>
</html>"), Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(fillColor = {192, 192, 192}, fillPattern = FillPattern.Forward, extent = {{-90, 80}, {-60, -80}}),
        Line(points={{100,0},{100,0}}, color={0,127,255}),
        Line(points={{100,0},{100,0}}, color={0,127,255}),
        Line(points={{100,0},{100,0}}, color={0,127,255}),
        Text(lineColor = {255, 0, 0}, extent = {{-40, 40}, {80, 20}}, textString = "Q_flow"),
        Line(points={{-60,20},{76,20}}, color={191,0,0}),
        Line(points={{-60,-20},{76,-20}}, color={191,0,0}),
        Line(points={{-34,80},{-34,-80}}, color={0,127,255}),
        Line(points={{6,80},{6,-80}}, color={0,127,255}),
        Line(points={{40,80},{40,-80}}, color={0,127,255}),
        Line(points={{76,80},{76,-80}}, color={0,127,255}),
        Line(points={{-34,-80},{-44,-60}}, color={0,127,255}),
        Line(points={{-34,-80},{-24,-60}}, color={0,127,255}),
        Line(points={{6,-80},{-4,-60}}, color={0,127,255}),
        Line(points={{6,-80},{16,-60}}, color={0,127,255}),
        Line(points={{40,-80},{30,-60}}, color={0,127,255}),
        Line(points={{40,-80},{50,-60}}, color={0,127,255}),
        Line(points={{76,-80},{66,-60}}, color={0,127,255}),
        Line(points={{76,-80},{86,-60}}, color={0,127,255}),
        Line(points={{56,-30},{76,-20}}, color={191,0,0}),
        Line(points={{56,-10},{76,-20}}, color={191,0,0}),
        Line(points={{56,10},{76,20}}, color={191,0,0}),
        Line(points={{56,30},{76,20}}, color={191,0,0})}));
end VariableThermalConductor;