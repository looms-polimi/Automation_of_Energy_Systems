within AES.ProcessComponents.Thermal.Interfaces;

partial model flowTwoPorts_pwh
  outer System_settings.System_liquid system;
  parameter Boolean pbhi=false "if true dp is pb-pa,otherwise pa-pb";
  AES.ProcessComponents.Thermal.Interfaces.pwhPort pwh_a annotation(
    Placement(visible = true, transformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-120, 1.11022e-16}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Interfaces.pwhPort pwh_b annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, 2.22045e-16}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  SI.PressureDifference dp;
  SI.MassFlowRate w;
  SI.SpecificEnthalpy hai,hbi,hao,hbo;
protected
  parameter SI.Density ro=system.ro;
  parameter SI.SpecificHeatCapacity cp=system.cp;
  parameter SI.ThermalConductivity lambda=system.lambda;
  parameter SI.DynamicViscosity mu=system.mu;
equation
  dp   = if pbhi then pwh_b.p-pwh_a.p else pwh_a.p-pwh_b.p;
  0    = pwh_a.w+pwh_b.w;
  w    = pwh_a.w;
  hai  = inStream(pwh_a.h);
  hao  = pwh_a.h; 
  hbi  = inStream(pwh_b.h);
  hbo  = pwh_b.h;
end flowTwoPorts_pwh;