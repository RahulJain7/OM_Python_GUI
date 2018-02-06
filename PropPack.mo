model PropPack
parameter Chemsep_Database.Benzene C1;
parameter Chemsep_Database.Toluene C2;
parameter Real Pressure = 101325;
extends Thermodynamic_Packages.bubblepnt;
extends Thermodynamic_Packages.Peng-Robinson(NOC = 2, Comp = {C1,C2}, P = Pressure);
end PropPack;
