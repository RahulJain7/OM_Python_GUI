model Flowsheet
parameter Simulator.Files.Chemsep_Database.Benzene compound0; 
parameter Simulator.Files.Chemsep_Database.Toluene compound1; 
Simulator.Streams.Mat_Stm_RL Mat_Stm1(NOC = 2,comp = {compound0,compound1});
Simulator.Streams.Mat_Stm_RL Mat_Stm2(NOC = 2,comp = {compound0,compound1});
Simulator.Unit_Operations.Mixer Mixer3(NOC = 2,comp = {compound0,compound1},outPress = "Inlet_Average",NI=2);
Simulator.Streams.Mat_Stm_RL Mat_Stm4(NOC = 2,comp = {compound0,compound1});
equation
connect(Mat_Stm1.outlet,Mixer3.inlet[1]);
connect(Mat_Stm2.outlet,Mixer3.inlet[2]);
connect(Mixer3.outlet,Mat_Stm4.inlet);
Mat_Stm1.P=101325;
Mat_Stm1.T=373;
Mat_Stm1.compMolFrac[1,:] = {0.5,0.5};
Mat_Stm1.totMolFlo[1] = 100;
Mat_Stm2.P=101325;
Mat_Stm2.T=373;
Mat_Stm2.compMolFrac[1,:] = {0.5,0.5};
Mat_Stm2.totMolFlo[1] = 100;
end Flowsheet;
