model PEMFC_simple_equivalent_circuit_model
  Modelica.Electrical.Analog.Basic.Resistor R_ohm(R = 0.44658566739134287)  annotation(
    Placement(transformation(origin = {46, 56}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Electrical.Analog.Basic.Ground GND annotation(
    Placement(transformation(origin = {-64, -24}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Electrical.Analog.Basic.Capacitor C_act(C = 0.26185975883432855)  annotation(
    Placement(transformation(origin = {-22, 72}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor V_sensor annotation(
    Placement(transformation(origin = {8, -44}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Interaction.Show.RealValue V_out annotation(
    Placement(transformation(origin = {62, -76}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Electrical.Analog.Basic.VariableResistor R_act annotation(
    Placement(transformation(origin = {-44, 48}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Electrical.Analog.Basic.VariableResistor R_conc annotation(
    Placement(transformation(origin = {0, 48}, extent = {{-10, -10}, {10, 10}})));


  parameter Real a = 0.14523894638625034;
  parameter Real b = 0.01750981265212292;
  parameter Real n = -0.03808550614603971;
  parameter Real ilim = 0.1731;
  parameter Real eps = 1e-9;

  
  Modelica.Blocks.Sources.RealExpression Act_source(y = max(1e-3,1/max(abs(V_in.i),eps)*(a+b*(log(max(abs(V_in.i),eps)))))) annotation(
    Placement(transformation(origin = {-77, 90}, extent = {{-15, -10}, {15, 10}})));
  Modelica.Blocks.Sources.RealExpression Conc_source(y = max(1e-3, n/max(abs(V_in.i),eps)*(log(max(1-max(abs(V_in.i),eps)/ilim,eps))))) annotation(
    Placement(transformation(origin = {45, 86}, extent = {{15, -10}, {-15, 10}}, rotation = -0)));
  Modelica.Electrical.Analog.Basic.VariableResistor R_load annotation(
    Placement(transformation(origin = {-4, -4}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));

  model PEMFC_simulation_two_C
  
    parameter Real a = 0.291972994252359;
    parameter Real b =0.044356579095739784;
    parameter Real n = -0.0577834921811912;
    parameter Real ilim = 0.0902116;
    parameter Real eps = 1e-9;
  
  Modelica.Electrical.Analog.Basic.Resistor R_ohm(R = 0.44) annotation(
      Placement(transformation(origin = {48, 54}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Electrical.Analog.Basic.Ground GND annotation(
      Placement(transformation(origin = {-62, -26}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Electrical.Analog.Basic.Capacitor C_act(C = 0.17) annotation(
      Placement(transformation(origin = {-20, 62}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor V_sensor annotation(
      Placement(transformation(origin = {10, -46}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Interaction.Show.RealValue V_out annotation(
      Placement(transformation(origin = {64, -78}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Electrical.Analog.Basic.VariableResistor R_act annotation(
      Placement(transformation(origin = {-42, 46}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Electrical.Analog.Basic.VariableResistor R_conc annotation(
      Placement(transformation(origin = {8, 44}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression Act_source(y = max(1e-3, 1/max(abs(V_in.i), eps)*(a + b*(log(max(abs(V_in.i), eps)))))) annotation(
      Placement(transformation(origin = {-123, 58}, extent = {{-15, -10}, {15, 10}})));
  Modelica.Blocks.Sources.RealExpression Conc_source(y = max(1e-3, n/max(abs(V_in.i), eps)*(log(max(1 - max(abs(V_in.i), eps)/ilim, eps))))) annotation(
      Placement(transformation(origin = {51, 96}, extent = {{15, -10}, {-15, 10}})));
  Modelica.Electrical.Analog.Basic.VariableResistor R_load annotation(
      Placement(transformation(origin = {-2, -6}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Electrical.Analog.Basic.Capacitor C_act_2(C = 1.7)  annotation(
      Placement(transformation(origin = {-20, 84}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Electrical.Analog.Ideal.IdealTwoWaySwitch switch annotation(
      Placement(transformation(origin = {-52, 80}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.BooleanInput switch_control annotation(
      Placement(transformation(origin = {-88, 78}, extent = {{20, -20}, {-20, 20}}, rotation = -0), iconTransformation(origin = {-76, 86}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealInput Load_Input annotation(
      Placement(transformation(origin = {22, 22}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {22, 22}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Electrical.Analog.Sources.SignalVoltage V_in annotation(
      Placement(transformation(origin = {-62, 24}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput v_in annotation(
      Placement(transformation(origin = {-112, 24}, extent = {{20, -20}, {-20, 20}}, rotation = -0), iconTransformation(origin = {-112, 24}, extent = {{-20, -20}, {20, 20}})));
  equation
    connect(C_act.n, R_ohm.p) annotation(
      Line(points = {{-10, 62}, {22, 62}, {22, 54}, {38, 54}}, color = {0, 0, 255}));
    connect(V_sensor.v, V_out.numberPort) annotation(
      Line(points = {{10, -57}, {10, -78}, {50.5 + 2, -78}}, color = {0, 0, 127}));
    connect(V_sensor.n, GND.p) annotation(
      Line(points = {{0, -46}, {-42, -46}, {-42, -16}, {-62, -16}}, color = {0, 0, 255}));
    connect(V_sensor.p, R_ohm.n) annotation(
      Line(points = {{20, -46}, {80, -46}, {80, 54}, {58, 54}}, color = {0, 0, 255}));
    connect(R_act.n, R_conc.p) annotation(
      Line(points = {{-32, 46}, {-17, 46}, {-17, 44}, {-2, 44}}, color = {0, 0, 255}));
    connect(R_conc.n, R_ohm.p) annotation(
      Line(points = {{18, 44}, {18, 43}, {38, 43}, {38, 54}}, color = {0, 0, 255}));
    connect(Conc_source.y, R_conc.R) annotation(
      Line(points = {{34.5, 96}, {34.5, 56}, {8, 56}}, color = {0, 0, 127}));
    connect(R_load.n, GND.p) annotation(
      Line(points = {{-12, -6}, {-62, -6}, {-62, -16}}, color = {0, 0, 255}));
    connect(R_load.p, R_ohm.n) annotation(
      Line(points = {{8, -6}, {58, -6}, {58, 54}}, color = {0, 0, 255}));
    connect(Act_source.y, R_act.R) annotation(
      Line(points = {{-106.5, 58}, {-42, 58}}, color = {0, 0, 127}));
    connect(C_act_2.n, R_ohm.p) annotation(
      Line(points = {{-10, 84}, {22, 84}, {22, 54}, {38, 54}}, color = {0, 0, 255}));
    connect(switch.n1, C_act_2.p) annotation(
      Line(points = {{-42, 84}, {-30, 84}}, color = {0, 0, 255}));
    connect(switch.n2, C_act.p) annotation(
      Line(points = {{-42, 80}, {-42, 78}, {-30, 78}, {-30, 62}}, color = {0, 0, 255}));
    connect(switch_control, switch.control) annotation(
      Line(points = {{-88, 78}, {-66, 78}, {-66, 92}, {-52, 92}}, color = {255, 0, 255}));
    connect(Load_Input, R_load.R) annotation(
      Line(points = {{22, 22}, {-2, 22}, {-2, 6}}, color = {0, 0, 127}));
  connect(V_in.p, R_act.p) annotation(
      Line(points = {{-62, 34}, {-62, 46}, {-52, 46}}, color = {0, 0, 255}));
  connect(V_in.p, switch.p) annotation(
      Line(points = {{-62, 34}, {-62, 80}}, color = {0, 0, 255}));
  connect(V_in.n, GND.p) annotation(
      Line(points = {{-62, 14}, {-62, -16}}, color = {0, 0, 255}));
  connect(v_in, V_in.v) annotation(
      Line(points = {{-112, 24}, {-74, 24}}, color = {0, 0, 127}));
  end PEMFC_simulation_two_C;

  Modelica.Blocks.Interfaces.RealInput Input_Load annotation(
    Placement(transformation(origin = {30, 18}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {42, -4}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Electrical.Analog.Sources.SignalVoltage V_in annotation(
    Placement(transformation(origin = {-64, 16}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput v_in annotation(
    Placement(transformation(origin = {-116, 16}, extent = {{20, -20}, {-20, 20}}), iconTransformation(origin = {-68, -26}, extent = {{-20, -20}, {20, 20}})));
equation
  connect(C_act.n, R_ohm.p) annotation(
    Line(points = {{-12, 72}, {20, 72}, {20, 56}, {36, 56}}, color = {0, 0, 255}));
  connect(V_sensor.v, V_out.numberPort) annotation(
    Line(points = {{8, -55}, {8, -76}, {50.5, -76}}, color = {0, 0, 127}));
  connect(V_sensor.n, GND.p) annotation(
    Line(points = {{-2, -44}, {-44, -44}, {-44, -14}, {-64, -14}}, color = {0, 0, 255}));
  connect(V_sensor.p, R_ohm.n) annotation(
    Line(points = {{18, -44}, {78, -44}, {78, 56}, {56, 56}}, color = {0, 0, 255}));
  connect(R_act.n, R_conc.p) annotation(
    Line(points = {{-34, 48}, {-10, 48}}, color = {0, 0, 255}));
  connect(R_conc.n, R_ohm.p) annotation(
    Line(points = {{10, 48}, {20, 48}, {20, 56}, {36, 56}}, color = {0, 0, 255}));
  connect(R_act.R, Act_source.y) annotation(
    Line(points = {{-44, 60}, {-44, 90}, {-60.5, 90}}, color = {0, 0, 127}));
  connect(Conc_source.y, R_conc.R) annotation(
    Line(points = {{28, 86}, {0, 86}, {0, 60}}, color = {0, 0, 127}));
  connect(R_load.n, GND.p) annotation(
    Line(points = {{-14, -4}, {-64, -4}, {-64, -14}}, color = {0, 0, 255}));
  connect(R_load.p, R_ohm.n) annotation(
    Line(points = {{6, -4}, {56, -4}, {56, 56}}, color = {0, 0, 255}));
  connect(R_load.R, Input_Load) annotation(
    Line(points = {{-4, 8}, {-4, 18}, {30, 18}}, color = {0, 0, 127}));
  connect(V_in.n, GND.p) annotation(
    Line(points = {{-64, 6}, {-64, -14}}, color = {0, 0, 255}));
  connect(V_in.p, C_act.p) annotation(
    Line(points = {{-64, 26}, {-64, 72}, {-32, 72}}, color = {0, 0, 255}));
  connect(V_in.p, R_act.p) annotation(
    Line(points = {{-64, 26}, {-64, 48}, {-54, 48}}, color = {0, 0, 255}));
  connect(v_in, V_in.v) annotation(
    Line(points = {{-116, 16}, {-76, 16}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.1.0")));
end PEMFC_simple_equivalent_circuit_model;
