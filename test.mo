package test
  model ms
    parameter Real T[3], P[3], F[3];
    annotation(Icon(graphics = {Polygon(origin = {50, 0}, fillColor = {98, 100, 102}, fillPattern = FillPattern.Solid, points = {{-30, 60}, {30, 0}, {-30, -60}, {-30, 60}}), Rectangle(origin = {-20, 0}, fillColor = {117, 109, 115}, fillPattern = FillPattern.Solid, extent = {{-40, 32}, {40, -32}})}));
  end ms;


  model Mixer
    Real T[3],P[3],F[3];
    base port0 annotation(Placement(visible = true, transformation(origin = {-28, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-34, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  base port1 annotation(Placement(visible = true, transformation(origin = {-36, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-36, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  base port2 annotation(Placement(visible = true, transformation(origin = {76, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {76, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      sum(F) = 0;
      sum(F.*T) = 0;
      P[3] = (P[1]+P[2]) / 2;
      port0.TEMPERATURE = T[1];
      port0.PRESSURE = P[1];
      port0.FLOWRATE = F[1];
      port1.TEMPERATURE = T[2];
      port1.PRESSURE = P[2];
      port1.FLOWRATE = F[2];
      port2.TEMPERATURE = T[3];
      port2.PRESSURE = P[3];
      port2.FLOWRATE = -F[3];
      
  
  annotation(Icon(coordinateSystem(initialScale = 0.1), graphics = {Polygon(origin = {10, 0}, fillColor = {107, 108, 112}, fillPattern = FillPattern.Solid, points = {{-30, 60}, {30, 0}, {-30, -60}, {-30, 60}})}), Diagram(graphics = {Rectangle(fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-50, 48}, {-50, 48}}), Polygon(origin = {9, -6}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, points = {{-55, 62}, {-55, -62}, {55, -6}, {55, -6}, {55, -6}, {-55, 62}})}));end Mixer;











  model Mat_Stm
      base conn;
      Real TEMPERATURE, PRESSURE, FLOWRATE;
      equation 
      conn.TEMPERATURE = TEMPERATURE;
      conn.PRESSURE = PRESSURE;
      conn.FLOWRATE  = FLOWRATE;
    annotation(Icon(graphics = {Polygon(origin = {50, 0}, fillColor = {98, 100, 102}, fillPattern = FillPattern.Solid, points = {{-30, 60}, {30, 0}, {-30, -60}, {-30, 60}}), Rectangle(origin = {-20, 0}, fillColor = {117, 109, 115}, fillPattern = FillPattern.Solid, extent = {{-40, 32}, {40, -32}})}));
  annotation(
      Icon(coordinateSystem(initialScale = 0.1), graphics = {Rectangle(origin = {11, 2}, extent = {{-67, 36}, {67, -36}})}));end Mat_Stm;
























  connector base
    Real FLOWRATE;
    Real TEMPERATURE, PRESSURE;
  annotation(Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, lineThickness = 0.75, extent = {{-96, 96}, {96, -96}})}));
  end base;







end test;
