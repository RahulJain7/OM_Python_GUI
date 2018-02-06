package Thermodynamic_Functions
  function Psat
    input Real VP[6];
    input Real T;
    output Real Vp;
  algorithm
    Vp := exp(VP[2] + VP[3] / T + VP[4] * log(T) + VP[5] .* T .^ VP[6]);
  end Psat;

  function LCp
    input Real LCpC[6];
    input Real T;
    output Real Cp;
  algorithm
    Cp := (LCpC[2] + exp(LCpC[3] / T + LCpC[4] + LCpC[5] * T + LCpC[6] * T ^ 2)) / 1000;
  end LCp;

  function HV
    input Real HOV[6];
    input Real Tc;
    input Real T;
    output Real Hv;
  protected
    Real Tr = T / Tc;
  algorithm
    Hv := HOV[2] * (1 - Tr) ^ (HOV[3] + HOV[4] * Tr + HOV[5] * Tr ^ 2 + HOV[6] * Tr ^ 3) / 1000;
  end HV;

  function HLiq
    input Real SH;
    input Real LCpC[6];
    input Real T;
    output Real Ent;
  protected
    Real Temp = 298.15;
  algorithm
    Ent := 0;
    while Temp < T loop
      Ent := Ent + LCp(LCpC, Temp) * 1;
      Temp := Temp + 1;
    end while;
    Ent := SH / 1000 + Ent;
  end HLiq;

  function HVap
    input Real SH;
    input Real LCpC[6];
    input Real HOV[6];
    input Real Tc;
    input Real T;
    output Real Ent;
  algorithm
    Ent := HLiq(SH, LCpC, T) + HV(HOV, Tc, T) ;
  end HVap;

  model LiqDen
  constant Real r = 8.314;
  Real Zra[NOC], ZRA, DenTr, Tcij[NOC, NOC], Vss, Denfi[NOC], Vs, Tcm, w, MM, Density, Tcmsum[NOC], B, Pvp, Ps[NOC];
  algorithm
  Denfi := x[:] .* Comp[:].Vc ./ sum(x[:] .* Comp[:].Vc);
  for i in 1:NOC loop
  for j in 1:NOC loop
  Tcij[i, j] := 8 * (Comp[i].Tc * Comp[j].Tc) ^ 0.5 * (Comp[i].Vc * Comp[j].Vc / 1000000) ^ 0.5 / ((Comp[i].Vc / 1000) ^ (1 / 3) + (Comp[j].Vc  / 1000) ^ (1 / 3) ) ^ 3;
  end for;
  end for;
  for i in 1:NOC loop
  Tcmsum[i] := Denfi[i] * sum(Denfi[:] .* Tcij[i, :]);
  end for;
  Tcm := sum(Tcmsum[:]);
  DenTr := T / Tcm;
  Zra := Comp[:].Racketparam;
    for i in 1:NOC loop
 if Zra[i] == 0 then
 Zra[i] := 0.2956 - 0.08775 * Comp[i].AF;
 end if;
 end for;
    for i in 1:NOC loop
    Ps[i] := Psat(Comp[i].VP, T);
    end for;
    ZRA := sum(x[:] .* Zra[:]);
    Vs := r * sum(x[:] .* Comp[:].Tc ./ Comp[:].Pc) * ZRA ^ (1 + (1 - DenTr) ^ (2 / 7));
  w := sum(x[:] .* Comp[:].AF);
  B := P * ((-1) - 9.070217 * (1 - DenTr) ^ (1 / 3) + 62.45326 * (1 - DenTr) ^ (2 / 3) - 135.1102 * (1 - DenTr) + exp(4.7959 + 0.250047 * w + 1.14188 * w ^ 2) * (1 - DenTr) ^ (4 / 3));
  Pvp := sum(  gamma[:] .* x[:] .* Ps[:]);
  Vss  := Vs * (1 - (0.0861488 + 0.0344483 * w) * log((B + P) / (B + Pvp)));
    MM := sum(x[:] .* Comp[:].MW);
  Density := MM / (1000 * Vss);
  end LiqDen;
  
  model TestPsat
  constant Integer NOC = 2;
  extends Psat;
  parameter Chemsep_Database.Ethanol ethanol;
  parameter Chemsep_Database.Water water;
  parameter Chemsep_Database.General_Properties Comp[NOC] = {ethanol, water};
  parameter Real T = 373.15;
  end TestPsat;
  
  model LiqDenTest
  constant Integer NOC = 2;
  extends Thermodynamic_Packages.NRTL;
  extends LiqDen;
  parameter Real P = 101325, T = 293;
  parameter Chemsep_Database.Methanol methanol;
  parameter Chemsep_Database.Water water;
  parameter Real x[2] = {0.5, 0.5};
  parameter Chemsep_Database.General_Properties Comp[NOC] = {methanol, water};
  end LiqDenTest;
  
  model PureLiqDen
  Real PureLiqDen[NOC];
  Real Trd;
  algorithm
  for i in 1:NOC loop
  if Comp[i].LiqDen[1] == 105 then
  PureLiqDen[i] := Comp[i].LiqDen[2] / Comp[i].LiqDen[3] ^ (1 + (1 - T / Comp[i].LiqDen[4]) ^ Comp[i].LiqDen[5]) * Comp[i].MW;
  elseif Comp[i].LiqDen[1] == 106 then
  Trd := T / Comp[i].Tc;
  PureLiqDen[i] := Comp[i].LiqDen[2] * (1 - Trd) ^ (Comp[i].LiqDen[3] + Comp[i].LiqDen[4] * Trd + Comp[i].LiqDen[5] * Trd ^ 2 + Comp[i].LiqDen[6] * Trd ^ 3) * Comp[i].MW;
  end if;
  end for;
  end PureLiqDen;
  
  model VapDen
  Real Density;
  Real MW;
  algorithm
  MW := sum(y[:] .* Comp[:].MW);
  Density := MW * P / (1000 * ZV * R * T);
  end VapDen;
  
  model VapDenTest
  constant Integer NOC = 2;
  extends Thermodynamic_Packages.PR;
  extends VapDen;
  parameter Real P = 101325, T = 293;
  parameter Chemsep_Database.Methane methane;
  parameter Chemsep_Database.Ethane ethane;
  parameter Real y[2] = {0.5, 0.5};
  parameter Chemsep_Database.General_Properties Comp[NOC] = {methane, ethane};
  end VapDenTest;
  
  model Hid
  extends Tsat;
  protected
    Real Hideal[NOC];
  algorithm
  for i in 1:NOC loop
  if T < Ts[i] then
  Hideal[i] := HLiq(Comp[i].SH, Comp[i].LiqCp, T) ;
  end if;
  if T > Ts[i] and Ts[i] > 298.15 then
  Hideal[i] := HVap(Comp[i].SH, Comp[i].LiqCp, Comp[i].HOV, Comp[i].VapCp, Comp[i].Tc, Ts[i], T);
  end if;
  if Ts[i] < 298.15 then
  Hideal[i] := Comp[i].SH / 1000 + VapCP(Comp[i].VapCp, 298.15, T);
      end if;
      end for;
  end Hid;
  
  model Tsat
  protected
    Real Ts[NOC](each start = 5, each min = 1);
  equation
  for i in 1:NOC loop
      P = exp(Comp[i].VP[2] + Comp[i].VP[3] / Ts [i] + Comp[i].VP[4] * log(Ts[i]) + Comp[i].VP[5] .* Ts [i] .^ Comp[i].VP[6]);
      end for;
  end Tsat;
  model testTsat
  constant Integer NOC = 2;
    extends Hid;
  parameter Chemsep_Database.Ethane ethane;
  parameter Chemsep_Database.Methane methane;
  //parameter Real x[NOC] = {0.5, 0.5};
 parameter Chemsep_Database.General_Properties Comp[NOC] = {ethane, methane};
  parameter Real P  = 101325;
  parameter Real T = 320;
  end testTsat;
  function VapCP
  input Real VapCP[6];
  input Real Ts;
  input Real T;
  output Real Ent;
  protected
  Real Temp;
  algorithm
  Temp := Ts;
    if VapCP[1] == 100 then
      Ent := (VapCP[2] * (T - Ts) + VapCP[3] * (T ^ 2 - Ts ^ 2) / 2 + VapCP[4] * (T ^ 3 - Ts ^ 3) / 3 + VapCP[5] * (T ^ 4 - Ts ^ 4) / 4 + VapCP[6] * (T ^ 5 - Ts ^ 5) / 5) / 1000;
      elseif VapCP[1] == 16 then
      while Temp < T loop
      Ent := Ent + (VapCP[2] + exp(VapCP[3] / Temp + VapCP[4] + VapCP[5] * Temp + VapCP[6] * Temp ^ 2)) / 1000 * 1;
      Temp := Temp + 1;
      end while;
      end if;
  end VapCP;
end Thermodynamic_Functions;