package Thermodynamic_Packages
function BIPNRTL
input Integer NOC;
input String Comp[NOC];
output Real value[NOC,NOC,2];
constant String underscore = "_";
String c[NOC,NOC];
String d[NOC,NOC];

constant String Comp1_Comp2[352] = 
{"Butane_Methanol","Pentane_Ethanol","Twomethylbutane_Ethanol","Hexane_Ethanol","Hexane_Onepropanol","Cyclohexane_Onepropanol","Methylcyclohexane_Phenol","Isobutylene_Methanol","Twomethyltwobutene_Methanol","Twomethyltwobutene_Ethanol","Onehexene_Methanol","Onehexene_Ethanol","Onethreebutadiene_Methanol","Onethreepentadiene_Methanol","Transonethreepentadiene_Methanol","Isoprene_Methanol","Isoprene_Ethanol","Cyclopentadiene_Methanol", "Benzene_Onepropanol", "Benzene_Chloroform","Benzene_Phenol","Benzene_Toluene","Benzene_Pxylene", "Benzene_Tribromomethane", "Benzene_Nitromethane", "Benzene_Tetrachloroethylene", "Benzene_Trichloroethylene", "Benzene_Pentachloroethane", "Benzene_Oneonetwotwotetrachloroethane", "Benzene_Onetwodibromoethane", "Benzene_Onetwodichloroethane", "Benzene_Nmethylformamide", "Benzene_Nitroethane", "Benzene_Dimethylsulfoxide", "Benzene_Ethylenediamine", "Benzene_Nndimethylformamide", "Benzene_Onenitropropane", "Benzene_Twonitropropane", "Benzene_Thiophene", "Benzene_Pyridine", "Benzene_Hexafluorobenzene", "Benzene_Pdichlorobenzene", "Benzene_Bromobenzene", "Benzene_Chlorobenzene", "Benzene_Fluorobenzene", "Benzene_Nitrobenzene", "Benzene_Aniline", "Benzene_Cyclohexylamine", "Benzene_Triethylamine", "Benzene_Benzonitrile", "Benzene_Toluene", "Benzene_Nmethylcyclohexylamine", "Benzene_Styrene", "Benzene_Ethylbenzene", "Benzene_Mxylene", "Benzene_Pxylene", "Benzene_Nndiethylaniline", "Benzene_Isopropylbenzene", "Benzene_Propylbenzene", "Benzene_Mterphenyl", "Toluene_Chloroform", "Toluene_Pxylene", "Toluene_nitroethane", "Toluene_Dimethylsulfoxide", "Toluene_Ethylenediamine", "Toluene_Nndimethylformamide", "Toluene_Sulfolane", "Toluene_Pyridine", "Toluene_Bromobenzene", "Toluene_Chlorobenzene", "Toluene_Nitrobenzene", "Toluene_Twomethylpyridine", "Toluene_Threemethylpyridien", "Toluene_Benzonitrile", "Toluene_Ethylbenzene", "Toluene_Pxylene", "Ethylbenzene_Styrene", "Ethylbenzene_Nitrobenzene", "Ethylbenzene_Aniline", "Ethylbenzene_Isopropylbenzene", "Ethylbenzene_Butylbenzene", "Oxylene_Nndimethylformamide", "Mxylene_Nndimethylformamide", "Mxylene_Aniline", "Pxylene_Mxylene", "Pxylene_Nndimethylformamide", "Pxylene_Aniline", "Propylbenzene_Nitrobenzene", "Onetwofourtrimethylbenzene_Onetwothreetrimethylbenzene", "Butylbenzene_Nitrobenzene", "Pcymene_Aniline", "Styrene_Propylbenzene", "Twomethylnaphthalene_Onemethylnaphthanlene", "Propionicaldehyde_Methanol", "Isobutyraldehyde_Water", "Acetone_Methanol", "Acetone_Ethanol", "Acetone_Chloroform", "Acetone_Benzene", "Acetone_Phenol", "Acetone_Cyclohexane", "Acetone_Toluene", "Twobutanone_Onepropanol", "Twobutanone_Benzene", "Twobutanone_Cyclohexane", "Twobutanone_Toluene", "Twobutanone_Nheptane", "Twobutanone_Water", "Methanol_Tetrachloromethane", "Methanol_Tribromomethane", "Methanol_Acetonitrile", "Methanol_Onetwodichloroethane", "Methanol_Aceticacid", "Methanol_Ethanol", "Methanol_Dimethylsulfoxide", "Methanol_Propionicacid", "Methanol_Nndimethylformamide", "Methanol_Propanol", "Methanol_Thiophene", "Methanol_Methylacrylate", "Methanol_Twobutanone", "Methanol_Tetrahyrofuran", "Methanol_Onefourdioxane", "Methanol_Ethylacetate", "Methanol_Sulfolane", "Methanol_Onebutanol", "Methanol_Twobutanol", "Methanol_Onefourbutanediol", "Methanol_Pyridine", "Methanol_Methylmethacrylate", "Methanol_Methylisopropylketone", "Methanol_Piperidine", "Methanol_Hexafluorobenzene", "Methanol_Chlorobenzene", "Methanol_Benzene", "Methanol_Aniline", "Methanol_Twomethylpyridine", "Methanol_Threemethylpyridine", "Methanol_Fourmethylpyridine", "Methanol_Cyclohexene", "Methanol_Cyclohexane", "Methanol_Nbutylacetate", "Methanol_Hexane", "Methanol_Triethylamine", "Methanol_Toluene", "Methanol_Two6dimethylpyridine", "Methanol_Oneheptane", "Methanol_Methylcyclohexane", "Methanol_Heptane", "Methanol_Ethylbenzene", "Methanol_Mxylene", "Methanol_Pxylene", "Methanol_Oneoctene", "Methanol_Octane", "Methanol_Twotwofourtrimethylpentane", "Methanol_Water", "Methanol_Chloroform", "Methanol_Ethanol", "Methanol_Acetone", "Methanol_Benzene", "Methanol_Cyclohexane", "Methanol_Toluene", "Methanol_Nheptane", "Ethanol_Tetrachloroethylene", "Ethanol_Acetonitrile", "Ethanol_Onetwodichloroethane", "Ethanol_Aceticacid", "Ethanol_Onetwoethanediol", "Ethanol_Twopropanol", "Ethanol_Thiophene", "Ethanol_Twobutanone", "Ethanol_Onefourdioxane", "Ethanol_Sulfolane", "Ethanol_Twobutanol", "Ethanol_Twomethylonepropanol", "Ethanol_Pyridine", "Ethanol_Methylmethacrylate", "Ethanol_Methylisopropyl", "Ethanol_Propylacetate", "Ethanol_Threemethylonebutanol", "Ethanol_Bromobenzene", "Ethanol_Chlorobezene", "Ethanol_Benzene", "Ethanol_Aniline", "Ethanol_Threemethylpyridine", "Ethanol_Cyclohexane", "Ethanol_Cyclohexanol", "Ethanol_Butylacetate", "Ethanol_Dipropylether", "Ethanol_Triethylamine", "Ethanol_Toluene", "Ethanol_Anisole", "Ethanol_Two6dimethylpyridine", "Ethanol_Pentylacetate", "Ethanol_Heptane", "Ethanol_Ethylbezene", "Ethanol_Pxylene", "Ethanol_Octane", "Ethanol_Twotwofourtrimethylpentane", "Ethanol_Hexadecane", "Ethanol_Oleicacid", "Ethanol_Water", "Ethanol_Chloroform", "Ethanol_Acetone", "Ethanol_Twobutanone", "Ethanol_Benzene", "Ethanol_Cyclohexane", "Ethanol_Toluene", "Ethanol_Nheptane", "Ethanol_Pxylene", "Onepropanol_Tetrachloroethylene", "Onepropanol_Aceticacid", "Onepropanol_Propionicacid", "Onepropanol_Twomethoxyethanol", "Propylamine_Onepropanol", "Onepropanol_Methacrylicacid", "Onepropanol_Twomethylonepropanol", "Onepropanol_Pyridine", "Onepropanol_Methylmethacrylate", "Onepropnaol_Propylacetate", "Onepropanol_Threemethylbutanol", "Onepropnaol_Chlorobenzene", "Onepropanol_Twomethylpyridine", "Onepropanol_Threemethylpyridine", "Onepropanol_Fourmethylpyridine", "Onepropanol_Dipropylamine", "Onepropanol_Hexamethyldisiloxane", "Onepropanol_Toluene", "Onepropnaol_Two6dimethylpyridine", "Onepropanol_Heptane", "Onepropanol_Pxylene", "Onepropanol_Octane", "Onepropanol_Decane", "Onepropanol_Onedecanol", "Twopropanol_Onepropanol", "Isobutanol_Water", "Tertbutanol_Water", "Methylformate_Methanol", "Methylacetate_Methanol", "Methylacetate_Ethanol", "Ethylacetate_Ethanol", "Ethylacetate_Water", "Vinylacetate_Ethanol", "Diethylether_Methanol", "Diethylether_Ethanol", "Diethylether_Water", "Diisopropylether_Water", "Methyltertbutylether_Methanol", "Dimethoxymethane_Methanol", "Dimethoxymethane_Water", "Propyleneoxide_Methanol", "Tetrahydrofuran_Ethanol", "Tetrahydrofuran_Onepropanol", "Tetrahydrofuran_Water", "Tetrachloromethane_Methanol", "Tertachloromethane_Onepropanol", "Tetrachloromethane_Benzene", "Tetrachloromethane_Toluene", "Tetrachloromethane_Ethylbenzene", "Tetrachloromethane_Mxylene", "Tetrachloromethane_Pxylene", "Tetrachloromethane_Isopropylbenzene", "Chloroform_Benzene", "Vinylcloride_Methanol", "Dichloromethane_Methanol", "Dichloromethane_Ethanol", "Chloroform_Methanol", "Chloroform_Ethanol", "Chloroform_Toluene", "Onetwodichloroethane_Onepropanol", "Onetwodichloroethane_Toluene", "Onetwodichloroethane_Oxylene", "Onetwodichloroethane_Pxylene", "Oneoneonetrichloroethane_Benzene", "Trichloroethylene_Onepropanol", "Trichloroethylene_Toluenep", "Chlorobenzene_Ethylbenzene", "Chlorobenzene_Pxylene", "Butylchloride_Onepropanol", "Methyliodide_Benzene", "Ethyliodide_Benzene", "Dimethylamine_Methanol", "Dimethylamine_Ethanol", "Dimethylamine_Onepropanol", "Triethylamine_Onepropanol", "Triethylamine_Water", "Diethylamine_Water", "Diethylamine_Benzene", "Diethylamine_Toluene", "Diethylamine_Ethylbenzene", "Propylamine_Water", "Butylamine_Ethanol", "Butylamine_Onepropanol", "Nbutylamine_Water", "Butylamine_Benzene", "Tertbutylamine_Benzene", "Ethylenediamine_Oxylene", "Acetonitrile_Toluene", "Acetonitrile_Ethylbenzene", "Acetonitrile_Pxylene", "Propionitrile_Toluene", "Acrylontrile_Styrene", "Acrylonitrile_Ethylbenzene", "Pyridine_Mxylene", "Thiophene_Toluene", "Fluorobenzene_Toluene", "Hexafluorobenzene_Onepropnaol", "Hexafluorobenzene_Toluene", "Hexafluorobenzene_Pxylene", "Water_Acetone", "Water_Twobutanone", "Water_Phenol", "Water_Oneonetwotwotetrachloroethane", "Water_Onefourdioxane", "Water_Sulfolane", "Water_Nndimethylacetamide", "Water_Morpholine", "Water_Nbutanol", "Water_Onefourbutanediol", "Water_Twothreebutanediol", "Water_Diethylenegylcol", "Water_Furfural", "Water_Pyridine", "Water_Nmethylpyrrolidone", "Water_Threemethylbutanol", "Water_Twomethyltwobutanol", "Water_Phenol", "Water_Aniline", "Water_Twomethylpyridine", "Water_Threemethylpyridine", "Water_Fourmethylpyridine", "Water_Phenylhydrazine", "Water_Cyclohexanone", "Water_Mesityloxide", "Water_Cyclohexanol", "Water_Nbutylacetate", "Water_Diacetonealcohol", "Water_Onehexanol", "Water_Twohexanol", "Water_Twobutoxyethanol", "Water_Benzylalcohol", "Water_Two6dimethylpyridinr", "Water_Isopentylacetate", "Water_Acetophenone", "Water_Quinoline", "Water_Isopropylbenzene", "Carbondisulfide_Benzene", "Carbondisulfide_Toluene", "Halothane_Methanol", "Oneonetwotrichloroonetwotwotrifluoroethane_Benzene", "Methylisocyanate_Toluene", "Methanol_Formamide"};
constant Real BI_Values[352,3] = 
{{1440.1498,1053.7716,0.4647},{1183.3812,412.7546,0.2886},{1610.2811,935.1426,0.496},{1218.1065,575.2985,0.2882},{1092.147,480.674,0.294},{1707.7883,353.2705,0.5914},{2587.873,-439.4469,0.2836},{1333.6,556.3608,0.3697},{1355.6853,660.9164,0.3381},{1412.7516,674.7726,0.4569},{1222.6032,1145.1085,0.4402},{1399.1806,949.7239,0.5011},{1353.0599,610.8292,0.467},{1545.3339,799.1289,0.4753},{1514.2761,782.1729,0.4657},{1445.6425,543.527,0.426},{1402.5377,653.4866,0.5056},{1541.9324,736.0352,0.4515},{874.2419,285.7774,0.2899},{-227.3671,-86.1025,0.3062},{373.4202,318.1885,0.2986},{60.198,-51.0865,0.3019},{-50.2635,14.218,0.3056},{893.4167,-566.9011,0.255},{273.5119,524.903,0.296},{-94.1122,288.6566,0.302},{140.5075,-127.4605,0.306},{-225.8274,197.746,0.303},{-73.7504,-250.7743,0.305},{-100.924,300.0048,0.304},{58.8289,-39.5526,0.303},{1512.9737,639.2332,0.523},{527.2886,-57.1531,0.3},{810.544,408.5646,0.669},{490.0693,560.0207,0.295},{736.7867,-251.4046,0.307},{-157.3069,595.6615,0.301},{1088.4773,-446.4137,0.306},{-347.2708,503.5971,0.304},{541.0855,-319.8327,0.279},{1085.4557,-715.7662,0.298},{1441.9721,-865.5699,0.283},{1538.3464,-819.5924,0.321},{700.4097,-450.6274,0.325},{277.6641,-292.2391,0.304},{1311.3264,-523.3212,0.311},{776.8671,-178.3464,0.299},{717.4228,-684.6315,0.29},{130.6061,-27.3294,0.303},{1390.488,-636.1853,0.285},{111.1157,-121.2437,0.303},{52.3967,94.0417,0.302},{-643.5999,970.4264,0.311},{-70.8372,57.0902,0.303},{-454.1872,615.2806,0.287},{-50.2635,14.218,0.305},{85.208,104.9548,0.301},{1915.7178,-810.5032,0.369},{-192.1433,141.5054,0.303},{64.1947,78.657,0.302},{-583.6169,629.2214,0.2974},{226.4602,-241.7457,0.2874},{537.4434,21.7626,0.301},{1063.2839,192.0041,0.289},{432.7908,592.5054,0.296},{-2260.2463,3666.1775,0.071},{5175.2573,224.8869,0.46},{264.6428,-60.3423,0.299},{-47.4722,15.063,0.304},{-40.5158,15.0972,0.303},{806.4313,-288.9774,0.296},{396.5492,-97.1224,0.302},{-490.8706,1036.9557,0.296},{-676.6725,1239.9195,0.3},{663.0837,-482.5109,0.3},{226.4602,-241.7457,0.287},{-539.7919,813.9959,0.346},{519.4154,-64.0219,0.3},{243.6463,384.003,0.298},{26.256,-27.6358,0.304},{-789.9294,957.1492,0.302},{559.7795,332.8093,0.294},{308.9034,548.667,0.296},{-259.4169,1034.4099,0.299},{282.0248,-254.9358,0.308},{153.1239,722.4999,0.294},{311.9792,408.2084,0.297},{329.7212,143.3943,0.3},{878.2759,-655.9008,0.326},{370.6529,140.0817,0.3},{-118.3505,885.1196,0.295},{649.8687,-453.4673,0.306},{-615.673,811.3338,0.335},{1046.6524,-865.266,0.3084},{1166.8333,1090.0262,0.2862},{184.2662,226.558,0.3009},{36.2965,434.8228,0.2987},{-651.1909,301.8389,0.3054},{-396.4935,886.5703,0.2971},{-754.9547,-280.383,0.3086},{429.8705,727.649,0.2925},{-247.9492,727.5102,0.295},{148.867,213.3829,0.3016},{-644.8573,898.3999,0.1563},{605.7381,235.4493,0.2963},{503.0737,-181.5533,0.2996},{681.5104,931.4616,0.9809},{674.4614,1809.8868,0.3536},{378.8254,1430.7379,0.2892},{879.0968,1063.6098,0.6381},{343.7042,314.5879,0.2981},{348.6035,1020.1431,0.2921},{16.6465,-217.1261,0.3051},{-327.9991,376.2667,0.3057},{-168.3182,-497.4171,0.3079},{-50.145,-78.0859,0.3056},{-124.0904,0.3428,9.1633},{24.9003,9.5349,0.3011},{-90.1051,1217.1035,0.2976},{676.836,169.9831,0.2958},{307.4271,217.9098,0.3003},{169.4153,383.1579,0.3002},{607.405,76.7683,0.2985},{345.5416,420.7355,0.2962},{1069.2756,906.5741,0.7182},{793.8173,-486.3299,0.2483},{-308.561,285.442,0.3036},{446.952,-450.5858,0.3152},{-45.0888,84.1956,0.3027},{590.279,380.8401,0.2963},{642.3761,-6.2901,0.2987},{590.882,-1169.7242,0.1387},{930.591,1244.1303,0.4701},{857.0852,1348.0903,0.4707},{721.6136,1158.5131,0.4694},{407.744,117.2473,0.3008},{226.082,-385.6823,0.3095},{-163.4505,-86.1482,0.3075},{304.2242,-452.3483,0.3053},{1178.5792,1618.9792,0.4568},{1315.1631,1497.2135,0.4222},{328.2162,453.0017,0.2961},{1619.3829,1622.2911,0.4365},{-476.8503,1126.1143,0.2874},{939.7275,1090.9297,0.4643},{-273.332,59.625,0.3051},{1313.5497,1143.9059,0.4163},{1444.585,1719.4586,0.4397},{1500.2043,1519.3346,0.4277},{1080.1231,1038.1572,0.4251},{991.1609,822.1357,0.291},{974.6545,851.107,0.2921},{1456.3583,1147.8132,0.4396},{1681.6918,1511.4353,0.4381},{1447.0909,1386.4703,0.4313},{-189.0469,792.802,0.2999},{-105.4657,1335.3416,0.2873},{67.2902,-70.5092,0.3009},{296.2432,118.0803,0.3003},{761.7553,1094.8556,0.4893},{1313.9316,1862.4639,0.441},{884.023,1008.0037,0.4064},{1566.439,1598.3126,0.4408},{685.8542,807.5935,0.29},{529.7267,338.1632,0.2964},{333.3502,939.387,0.2926},{-34.1971,-190.7763,0.305},{1644.0484,-203.7691,0.3704},{690.1392,-529.3472,0.3125},{222.3096,1057.7115,0.2918},{64.4957,463.1931,0.301},{505.5637,111.8389,0.2988},{1195.1601,705.0897,0.5676},{-559.8205,802.5411,0.2721},{53.1671,82.0442,0.3023},{163.6655,-169.9802,0.3017},{456.9676,386.5893,0.2963},{-54.0946,639.6806,0.3009},{760.4933,129.397,0.295},{51.1705,-42.8613,0.3009},{820.8023,1349.6853,0.4995},{645.7829,1383.711,0.5229},{516.141,1065.9086,0.4774},{1823.3542,-523.0474,0.3005},{315.6078,-339.0825,0.3056},{876.7933,1390.4162,0.4485},{1719.8644,-833.8389,0.292},{841.9935,-55.3231,0.2958},{442.6124,634.1687,0.2945},{-248.0407,697.9004,0.2996},{713.5653,1147.8607,0.5292},{3458.4788,-1438.8884,0.1704},{-48.2159,-19.6212,0.3016},{552.3897,266.1248,0.2964},{1137.265,1453.5947,0.4786},{801.7191,1006.8831,0.4962},{768.3633,760.08,0.2914},{1206.8097,1385.3721,0.4717},{1091.0432,1500.6711,0.4738},{2359.4082,1509.2033,0.4448},{975.6816,-343.5446,0.2988},{-57.9601,1241.7396,0.2937},{-285.3881,1289.2198,0.2909},{375.3497,45.3706,0.3006},{437.1923,33.6363,0.3022},{255.3591,1047.1959,0.297},{761.7739,1393.7993,0.4376},{542.4128,772.4394,0.2937},{1114.2947,1305.9242,0.4758},{1020.8405,889.3461,0.618},{608.3777,646.0412,0.2913},{256.8999,-327.5173,0.3044},{-189.7856,-32.4657,0.307},{-406.3767,830.8897,0.3013},{-602.9687,-45.3543,0.3061},{276.6356,-423.9162,0.3025},{-2.8139,-13.8657,0.3034},{374.8691,-412.2861,0.311},{504.09,125.6451,0.2993},{340.021,111.7437,0.3005},{12.2207,-31.8303,0.3033},{456.2867,538.5114,0.2946},{529.6444,-608.3163,0.3054},{479.7439,-540.4699,0.3045},{523.8291,-603.0924,0.3084},{617.3558,-459.5845,0.2892},{1615.0711,-498.3638,0.1028},{25.622,922.0009,0.0175},{472.9353,-545.1853,0.296},{1198.972,1377.2975,0.5193},{563.6173,475.5966,0.2921},{1109.304,334.2112,0.2907},{945.3159,520.2926,0.2895},{1068.0694,-588.3325,0.2958},{167.2501,-175.2928,0.3057},{639.8173,2491.0163,0.4385},{471.7718,2030.8877,0.5155},{584.572,298.5567,0.2962},{381.4559,346.536,0.2965},{188.3139,158.0118,0.3013},{305.6041,330.5105,0.2988},{1285.988,1606.082,0.4393},{505.1637,320.7403,0.2959},{705.9989,211.158,0.2953},{763.6707,71.1984,0.2946},{1544.0251,2086.4776,0.3792},{2665.1471,4202.0746,0.5409},{851.4954,465.836,0.8178},{608.9115,712.0226,0.7259},{1608.07,1818.2947,0.4898},{924.8499,-61.1796,0.2986},{661.3708,-200.6915,0.3015},{562.4611,-302.2498,0.3003},{915.745,1725.0977,0.4522},{1339.9,488.6648,0.4622},{1537.6384,537.2439,0.631},{-4.9421,84.0212,0.305},{-69.681,95.3839,0.304},{-172.3762,122.4657,0.303},{-232.4578,163.8924,0.304},{-192.9687,121.7193,0.304},{-106.8166,13.4903,0.303},{176.8791,-288.2136,0.306},{1789.7165,-34.9448,0.2912},{1560.0282,441.3372,0.6234},{1332.8036,-153.0761,0.3057},{1414.2712,-141.803,0.2949},{1438.3602,-327.5518,0.3023},{629.2214,-583.6169,0.297},{636.9927,364.0596,0.2956},{-217.7768,251.5704,0.309},{718.2538,-479.1971,0.287},{848.1184,-557.9036,0.273},{-73.4845,97.5682,0.303},{926.6139,196.0696,0.3007},{185.3799,-250.7688,0.306},{357.7079,-307.8057,0.307},{-395.6312,359.7555,0.305},{1201.9959,506.8982,0.5468},{294.4424,-185.2944,0.301},{394.5891,298.1172,0.3},{-1018.143,-54.3882,0.3134},{-1224.5739,370.7683,0.3105},{81.487,-703.3731,0.2697},{991.6157,-435.2018,0.3067},{-5096.528,28437.138,0.0381},{-169.1652,1372.3121,0.2932},{52.3512,-42.2029,0.281},{91.4853,-153.9388,5.101},{928.9662,-553.9006,0.345},{-455.9152,1301.6396,0.2981},{-612.3956,-5.7834,0.3062},{-698.951,34.7593,0.3001},{160.3429,2104.4002,0.6379},{65.9717,67.1231,0.302},{-344.6666,757.993,0.306},{1357.7269,-110.2727,0.196},{790.725,724.0955,0.935},{1102.5396,5.3234,0.298},{1413.0042,-210.0314,0.293},{-95.6685,717.0741,0.3},{598.0263,-130.4323,0.302},{1304.6073,-338.2481,0.299},{-78.8985,351.0029,0.3},{510.1471,-197.5696,0.301},{386.4643,-304.6112,0.308},{922.5224,528.5894,0.2937},{668.6525,-666.7128,0.241},{1004.5491,-949.1003,0.29},{1324.9767,814.1435,0.5663},{653.9718,1883.6007,0.3607},{2419.3354,1844.3794,0.6308},{2435.8879,102.7658,0.0972},{715.9592,548.8965,0.292},{1160.1372,467.9008,0.5573},{75.5965,328.8977,0.3009},{-803.1654,1732.7268,0.2954},{2633.6951,504.0381,0.4447},{1310.8994,1920.1402,0.5778},{2531.7402,-758.0034,0.302},{1186.7304,-99.9,0.2974},{2602.6374,436.9686,0.395},{1835.0881,419.8087,0.6802},{-239.6197,573.8298,0.3055},{3633.533,-494.8389,0.2816},{19947.2334,-15910.4563,0.0056},{2385.3714,282.697,0.4942},{11965.5274,-7391.5468,0.0235},{1979.5492,197.0009,0.6371},{2559.3708,418.7524,0.5361},{2325.9141,162.3029,0.5622},{1473.9606,-66.4169,0.0811},{2983.8991,-171.666,0.2673},{2121.4973,101.3068,0.1504},{2232.9727,641.3504,0.4399},{3805.0038,918.2419,0.2951},{1323.2731,845.9826,0.678},{2991.1845,-464.8054,0.1563},{1880.1699,489.1746,0.2938},{1914.0077,220.0262,0.4776},{4689.8409,301.3998,0.3168},{2222.596,831.9908,0.5706},{1874.8967,856.9565,0.3734},{725.1364,858.8268,0},{11675.1604,-3887.1802,0.0902},{2986.1161,-84.8485,0.086},{161.2943,431.5524,0.3},{-591.6879,1052.858,0.243},{9870.353,-6982.8569,0.0187},{-53.1528,551.963,0.301},{-167.8974,104.6027,0.302},{617.5847,-153.4695,0.3003}};

algorithm

for i in 1:NOC loop
  for j in 1:NOC loop
   for k in 1:2 loop
    value[i,j,k] := 0;
  end for;
end for;
end for;

for i in 1:NOC loop
  for j in 1:NOC loop
    c[i,j] := Comp[i]+underscore+Comp[j];
    d[i,j] := Comp[j]+underscore+Comp[i];
    for k in 1:353 loop
      if c[i,j] == Comp1_Comp2[k]then
        value[i,j,1] := BI_Values[k,1];
        value[j,i,1] := BI_Values[k,2];
        value[i,j,2] := BI_Values[k,3];
        value[j,i,2] := BI_Values[k,3]; 
      end if;  
     if d[i,j] == Comp1_Comp2[k]then
        value[j,i,1] := BI_Values[k,1];
        value[i,j,1] := BI_Values[k,2];
        value[i,j,2] := BI_Values[k,3];
        value[j,i,2] := BI_Values[k,3];   
     end if;
     end for;    
     
  end for;
end for;  
end BIPNRTL;

model NRTL
  
  constant Real R = 1.9872;
  //  parameter Integer NOC;
    //   parameter Chemsep_Database.General_Properties Comp[NOC];
    parameter Real BIPS[NOC,NOC,2] =  BIPNRTL(NOC,Comp.name);
  parameter Real A[NOC,NOC] = BIPS[:,:,1];
  parameter Real alpha[NOC,NOC] = BIPS[:,:,2];
  //  Real P, T(start = 350, min = 273);
    //  Real x[NOC](each start = 0.5, each min = 0.001, each max = 1);
    //  Real y[NOC](each start = 0.5, each min = 0, each max = 1);
    Real ta[NOC,NOC];
  Real G[NOC,  NOC], sum1[NOC], sum2[NOC];
  Real gamma[NOC](each start = 1) ;
  //  Real HE, H, Hig;
  algorithm
    for i in 1:NOC loop
  for j in 1:NOC loop
    ta[i,j] := A[i,j]/ (R * T);
    G[i,j] := exp(-alpha[i,j]*ta[i,j]);
    end for;
  end for;
 for j in 1:NOC loop
 sum1[j] := sum(x[:] .* G[:, j]);
 sum2[j] := sum(x[:] .* ta[:, j] .* G[:, j]);
 end for;
 for i in 1:NOC loop
  gamma[i] := exp( sum(x[:] .* ta[:, i] .* G[:, i]) / sum(x[:] .* G[:, i]) + sum(x[:] .* G[i, :] ./ sum1[:] .* (ta[i, :] - sum2[:] ./ sum1[:])));
 end for;
 end NRTL;

 model PR
 extends Thermodynamic_Functions.Hid;
    constant Real R = 8.314;
 //parameter Integer NOC;
    //parameter Chemsep_Database.General_Properties Comp[NOC];
    //parameter Real P;
    //parameter Real T;
    //Real y[NOC](each start = 0.5, each min = 0.001, each max = 1);
    //   Real Tr[NOC], aa[NOC, NOC];
    Real fiv[NOC](each start = 1), H;
 protected
    Real Tr[NOC], aa[NOC, NOC];
 protected
    Real Zv[3, 2], ZV, zv[3], sv[NOC];
 protected
    Real a[NOC], b[NOC], amv, aamv, bmv, KPR[NOC, NOC], Av, Bv, Polyv[4], HE[NOC], cappa[NOC], alpha[NOC];
 algorithm
 for i in 1:NOC loop
 Tr[i] := T / Comp[i].Tc;
 a[i] := (1 + (0.37464 + 1.54226 * Comp[i].AF + 0.26992 * Comp[i].AF ^ 2) * (1 - Tr[i] ^ 0.5)) ^ 2 * (0.45724 * R ^ 2 * Comp[i].Tc ^ 2) / Comp[i].Pc;
 b[i] := 0.07780 * (R * Comp[i].Tc) / Comp[i].Pc;
 end for;
 KPR := BIPPR(NOC, Comp.name);
  for j in 1:NOC loop
  aamv := 0;
  for k in 1:NOC loop
  aa[j, k] := (a[j] * a[k]) ^ 0.5 * (1 - KPR[j, k]);
  aamv := aamv + y[j] * y[k] * aa[j, k];
  end for;
  amv := amv + aamv;
  end for;
  for l in 1:NOC loop
  bmv := bmv + y[l] * b[l];
  end for;
  Av := amv * P / (R ^ 2 * T ^ 2);
  Bv := bmv * P / (R * T);
  Polyv[1] := 1;
  Polyv[2] := -(1 - Bv);
  Polyv[3] := Av - 3 * Bv ^ 2 - 2 * Bv;
  Polyv[4] := -(Av * Bv - Bv ^ 2 - Bv ^ 3);
  Zv := Modelica.Math.Vectors.Utilities.roots(Polyv);
  for i in 1:3 loop
  zv[i] := Zv[i, 1];
  end for;
  ZV := max(zv);
  for i in 1:NOC loop
  for j in 1:NOC loop
  sv[i] := sv[i] + y[j] * aa[i, j];
  end for;
  end for;
  for i in 1:NOC loop
  fiv[i] := exp(b[i] / bmv * (ZV - 1) - log(ZV - Bv) - Av / (2 * 2 ^ 0.5 * Bv) * (2 * sv[i] / amv - b[i] / bmv) * log((ZV + 2.414 * Bv) / (ZV - 0.414 * Bv)));
  end for;
  for i in 1:NOC loop
  cappa[i] := 0.37464 + 1.54226 * Comp[i].AF + 0.26992 * Comp[i].AF ^ 2;
    alpha[i] := (1 + cappa[i] * (1 - Tr[i] ^ 0.5)) ^ 2;
    HE[i] := R * Comp[i].Tc * (Tr[i] * (ZV - 1) - 2.078 * (1 + cappa[i]) * alpha[i] ^ 0.5 * log((ZV + 2.414 * b[i] / R) / (ZV - 0.414 * b[i] / R)));
    end for;
    H := sum(y[:] .* (HE[:] + Hideal[:]));
  end PR;
  
  model NRTLtest
  parameter Chemsep_Database.Methanol methanol;
  parameter Chemsep_Database.Ethanol ethanol;
  parameter Chemsep_Database.Water water;
  parameter Real z[3] = {0.3, 0.3, 0.4};
  constant Integer NOC = 3;
  parameter Chemsep_Database.General_Properties Comp[NOC] = {methanol, ethanol, water};
  parameter Real P = 101325;
  Real T(start = 340, min = 300, max = 400);
  Real x[NOC](each start = 0.5, each min = 0.001, each max = 1);
  Real y[NOC](each start = 0.5, each min = 0, each max = 1);
  extends NRTL;
  Real beta(start = 0.455, min = 0, max = 1), K[3](each start = 1, each min = 0), Psat[3];
  algorithm
  for i in 1:NOC loop
  Psat[i] := Thermodynamic_Functions.Psat(Comp[i].VP, T);
  end for;
  equation
  y[1] = 0.38;
  sum(x[:]) - sum(y[:]) = 0;
  K[:] = gamma[:] .* Psat[:] ./ P;
  y[:] = K[:] .* x[:];
  y[:] * beta + x[:] * (1 - beta) = z[:];
  end NRTLtest;
  
  function BIPPR
    input Integer NOC;
  input String Comp[NOC];
  output Real value[NOC,NOC];
  constant String underscore = "_";
  String c[NOC,NOC];
  String d[NOC,NOC];
  constant String Comp1_Comp2[179] = {"Heliumfour_Carbonmonoxide", "Hydrogen_Nitrogen", "Hydrogen_Carbonmonoxide", "Hydrogen_Methane", "Hydrogen_Ethylene", "Hydrogen_Ethane", "Hydrogen_Carbondioxide", "Hydrogen_Propylene", "Hydrogen_Propane", "Hydrogen_Nbutane", "Hydrogen_Nhexane", "Hydrogen_Nheptane", "Hydrogen_Toluene", "Hydrogen_Quinoline", "Hydrogen_Bicyclohexyl", "Hydrogen_Onemethylnaphthalene", "Nitrogen_Carbonmonoxide", "Nitrogen_Argon", "Nitrogen_Oxygen", "Nitrogen_Methane", "Nitrogen_Ethylene", "Nitrogen_Ethane", "Nitrogen_Nitrousoxide", "Nitrogen_Carbondioxide", "Nitrogen_Hydrogensulfide", "Nitrogen_Propylene", "Nitrogen_Propane", "Nitrogen_Ammonia", "Nitrogen_Dichlorodiflouromethane", "Nitrogen_Isobutane", "Nitrogen_Sulfurdioxide", "Nitrogen_Nbutane", "Nitrogen_Isoc5", "Nitrogen_Npentane", "Nitrogen_Methanol", "Nitrogen_Nhexane", "Nitrogen_Benzene", "Nitrogen_Nheptane", "Nitrogen_Noctane", "Nitrogen_Ndecane", "Carbonmonoxide_Methane", "Carbonmonoxide_Ethane", "Carbonmonoxide_Hydrogensulfide", "Carbonmonoxide_Propane", "Argon_Oxygen", "Argon_Methane", "Argon_Ammonia", "Oxygen_Krypton", "Oxygen_Nitrousoxide", "Methane_Ethylene", "Methane_Ethane", "Methane_Nitrousoxide", "Methane_Carbondioxide", "Methane_Carbonylsulfide", "Methane_Propylene", "Methane_Propane", "Methane_Isobutane", "Methane_Sulfurdioxide", "Methane_Nbutane", "Methane_Isoc5", "Methane_Npentane", "Methane_Nhexane", "Methane_Benzene", "Methane_Cyclohexane", "Methane_Nheptane", "Methane_Toluene", "Methane_Noctane", "Methane_Mxylene", "Methane_Nnonane", "Methane_Ndecane", "Methane_Mcresol", "Methane_Tetralin", "Methane_Onemethylnaphthalene", "Methane_Diphenylmethane", "Ethylene_Ethane", "Ethylene_Acetylene", "Ethylene_Carbondioxide", "Ethylene_Nbutane", "Ethylene_Benzene", "Ethylene_Nheptane", "Ethylene_Ndecane", "Carbondioxide_Ethane", "Ethane_Hydrogensulfide", "Ethane_Propylene", "Ethane_Propane", "Ethane_Isobutane", "Ethane_Nbutane", "Ethane_Ethylether", "Ethane_Npentane", "Ethane_Acetone", "Ethane_Methylacetate", "Ethane_Methanol", "Ethane_Nhexane", "Ethane_Benzene", "Ethane_Cyclohexane", "Ethane_Nheptane", "Ethane_Noctane", "Ethane_Ndecane", "Carbondioxide_Nitrousoxidedioxide", "Acetylene_Propylene", "Trifluoromethane_Triflourochloromethane", "Trifluorochloromethane_Dichlorodifluoromethane", "Carbondioxide_Hydrogensulfide", "Carbondioxide_Difluoromethane", "Carbondioxide_Propylene", "Carbondioxide_Propane", "Carbondioxide_Isobutane", "Carbondioxide_Onebutene", "Carbondioxide_Nbutane", "Carbondioxide_Isoc5", "Carbondioxide_Ethylether", "Carbondioxide_Npentane", "Carbondioxide_Methylacetate", "Carbondioxide_Methanol", "Carbondioxide_Nhexane", "Carbondioxide_Benzene", "Carbondioxide_Cyclohexane", "Carbondioxide_Nheptane", "Carbondioxide_Water", "Carbondioxide_Toluene", "Carbondioxide_Ndecane", "Carbondioxide_Nbutylbenzene", "Hydrogensulfide_Propane", "Hydrogensulfide_Isobutane", "Hydrogensulfide_Npentane", "Hydrogensulfide_Water", "Hydrogensulfide_Ndecane", "Propylene_Propane", "Propylene_Isobutane", "Propylene_Onecfour", "Propane_Isobutane", "Propane_Nbutane", "Propane_Isopentane", "Propane_Npentane", "Propane_Nhexane", "Propane_Ethanol", "Propane_Benzene", "Propane_Nheptane", "Propane_Noctane", "Propane_Ndecane", "Pentaflourohloroethane_Difluorochloromethane", "Difluorochloromethane_Dichlorodifluoromethane", "Ammonia_Water", "Ammonia_Watert=two7three.one5k", "Isobutane_Nbutane", "Sulfurdioxide_Benzene", "Onebutene_One", "Onebutene_Nbutane", "One_Threebutadiene", "Nbutane_Npentane", "Nbutane_Nhexane", "Nbutane_Nheptane", "Nbutane_Noctane", "Nbutane_Ndecane", "Npentane_Benzene", "Npentane_Cyclohexane", "Npentane_Nheptane", "Npentane_Noctane", "Two_Twodimethylbutane", "Two_Threedimethylbutane", "Twomethylpentane_Onepentanol", "Onepentanol_Threemethylpentane", "Methanol_Water", "Nhexane_Benzene", "Nhexane_Cyclohexane", "Nhexane_Twopropanol", "Nhexane_Nheptane", "Nhexane_Isopentanol", "Nhexane_Onepentanol", "Cyclohexane_Benzene", "Benzene_Nheptane", "Benzene_Isooctane", "Benzene_Noctane", "Cyclohexene_Cyclohexane", "Cyclohexane_One", "Cyclohexane_Cyclohexanone", "One_Twodichloroethane", "Nheptane_Isooctane", "Nheptane_Twopentanone"};

constant Real BI_Values[179] = {1, 7.1100E-02, 9.1900E-02, 2.6300E-02, 6.3300E-02, -7.5600E-02, 0, 0, 0, 0, -3.00E-02, 0, -1, -1, -1, 0, 3.300E-02, -2.6000E-03, -1.5900E-02, 2.8900E-02, 8.5600E-02, 3.4400E-02, 4.4000E-03, -2.2200E-02, 0, 9.00E-02, 8.7800E-02, 0, 1.0700E-02, 0, 8.00E-02, 7.1100E-02, 9.2200E-02, 0, 0, 0, 0, 0, 0, 0, 3.00E-02, -2.2600E-02, 5.4400E-02, 2.5900E-02, 1.0700E-02, 2.300E-02, 0, 2.5600E-02, 4.7800E-02, 3.7800E-02, -3.3000E-03, 2.5600E-02, 7.9300E-02, 2.8900E-02, 3.300E-02, 1.1900E-02, 2.5600E-02, 0, 2.4400E-02, -5.6000E-03, 2.300E-02, 4.00E-02, 8.0700E-02, 3.8900E-02, 4.0100E-02, 9.700E-02, 4.9600E-02, 8.4400E-02, 4.7400E-02, 4.8900E-02, 0, 0, 0, 8.7400E-02, 1.1900E-02, 6.5200E-02, 5.7800E-02, 9.2200E-02, 3.1100E-02, 1.4400E-02, 2.5300E-02, 0, 8.2200E-02, 8.9000E-03, 1.1000E-03, -6.7000E-03, 8.9000E-03, 1.8100E-02, 7.8000E-03, 0, 0, 2.700E-02, -4.00E-02, 3.2200E-02, 1.7800E-02, 7.4000E-03, 1.8500E-02, 1.4400E-02, 4.8000E-03, 0, 0, 3.3700E-02, 9.7800E-02, 1.700E-02, 9.3300E-02, 0, 0, 5.9300E-02, 0, 0, 4.700E-02, -1.00E-02, -4.9300E-02, 2.200E-02, 0, 7.7400E-02, 0, 0, 6.3000E-03, 0, 0, 0, 6.00E-02, 4.7400E-02, 6.300E-02, 3.9400E-02, 3.3300E-02, 9.6000E-03, -1.4400E-02, 4.0000E-04, -7.8000E-03, 3.3000E-03, 1.1100E-02, 2.6700E-02, 7.0000E-04, 3.1500E-02, 2.3300E-02, 5.6000E-03, 0, 0, 8.7400E-02, 5.2200E-02, 0, 0, -4.0000E-04, 1.5000E-03, 2.2000E-03, 7.0000E-04, 1.4100E-02, 1.7400E-02, -5.6000E-03, 3.3000E-03, 7.4000E-03, 7.8000E-03, 1.8900E-02, 3.7000E-03, 7.4000E-03, 0, 4.5200E-02, 4.6700E-02, 4.6700E-02, 4.7800E-02, -7.7800E-02, 8.9000E-03, -3.000E-03, 8.4400E-02, -7.8000E-03, 4.8500E-02, 4.5600E-02, 1.2600E-02, 1.1000E-03, 4.0000E-04, 3.000E-03, 1.1000E-03, 7.300E-02, 6.5900E-02, 4.300E-02, 4.0000E-04, 6.9300E-02};

algorithm

for i in 1:NOC loop
  for j in 1:NOC loop
    value[i,j] := 0;
  end for;
end for;
    
for i in 1:NOC loop
  for j in 1:NOC loop
    c[i,j] := Comp[i]+underscore+Comp[j];
    d[i,j] := Comp[j]+underscore+Comp[i];
    for k in 1:180 loop
      if c[i,j] == Comp1_Comp2[k] or d[i,j] == Comp1_Comp2[k] then
        value[i,j] := BI_Values[k];
      end if;
    end for;
  end for;  
 end for;
 end  BIPPR;
  //  Real x[NOC] (each start = 0.5, each min = 0, each max = 1);

  
  model UNIQUAC
  constant Real R = 1.9872;
    parameter Integer NOC;
  parameter Integer Z = 5;
  parameter Chemsep_Database.General_Properties Comp[NOC];
  parameter Real A[NOC, NOC] = BIP_UNIQUAC(NOC, Comp.name);
  parameter Real r[NOC] = Comp.UniquacR;
  parameter Real q[NOC] = Comp.UniquacQ;
  Real P, T (start = 351.21, min = 350, max = 380);
  Real x[NOC](each start = 0.5, each min = 0.0001, each max = 1);
  Real y[NOC](each start = 0.5, each min = 0.0001, each max = 1);
  Real tau[NOC, NOC];
  Real V[NOC] , F[NOC] , sum1[NOC], sum2[NOC];
  Real gamma[NOC](each start = 1 ), gammaC[NOC](each start = 1.01 ), gammaR[NOC](each start = 1.01 );
  algorithm
  V := r / sum(r[:] .* x[:]);
  F  := q / sum(q[:] .* x[:]);
  for i in 1:NOC loop
  for j in 1:NOC loop
  tau[i, j] := exp(-A[i, j] / (R * T));
  end for;
  end for;
  for i in 1:NOC loop
      gammaC[i] := exp(1 - V[i] + log(V[i]) - Z * q[i] * (1 - V[i] / F[i] + log(V[i] / F[i])));
      end for;
  for j in 1:NOC loop
  sum1[j] := sum(q[:] .* x[:] .* tau[:, j]) / sum(x[:] .* q[:]);
  sum2[j] := sum(q[:] .* x[:] .* tau[:, j]);
    end for;
  for i in 1:NOC loop
  gammaR[i] := exp(q[i] * (1 - log(sum1[ i] ) - sum(q[:] .* x[:] .* tau[i, :] ./ sum2[:])));
  end for;
  gamma := exp(log(gammaC) + log(gammaR));
  end UNIQUAC;




  
  model UNIQUAC_test
  parameter Chemsep_Database.Methanol methanol;
  parameter Chemsep_Database.Ethanol ethanol;
  //  parameter Chemsep_Database.Water water;
    parameter Real z[2] = {0.5, 0.5};
  extends UNIQUAC(NOC = 2, Comp = {methanol, ethanol}, P = 101325, T = 340);
  Real beta(start = 0.5, min = 0, max = 1), K[2](each start = 1, each min = 0), Psat[2];
  algorithm
  for i in 1:NOC loop
  Psat[i] := Thermodynamic_Functions.Psat(Comp[i].VP, T);
  end for;
  equation
  sum(x[:]) - sum(y[:]) = 0;
  K[:] = gamma[:] .* Psat[:] ./ P;
  y[:] = K[:] .* x[:];
  y[:] * beta + x[:] * (1 - beta) = z[:];
  end UNIQUAC_test;
  
  function BIP_UNIQUAC
  input Integer NOC;
  input String Comp[NOC];
  output Real value[NOC, NOC];
  constant String underscore = "_";
  String c[NOC, NOC];
  String d[NOC, NOC];
  constant String Comp1_Comp2[440] = {"Butane_Methanol", "Pentane_Ethanol", "Twomethylbutane_Ethanol", "Hexane_Ethanol", "Hexane_Onepropanol", "Cyclohexane_Onepropanol", "Methylcyclohexane_Phenol", "Isobutylene_Methanol", "Twomethyltwobutene_Methanol", "Twomethyltwobutene_Ethanol", "Onehexene_Methanol", "Onehexene_Ethanol", "Onethreebutadiene_Methanol", "Onethreepentadiene_Methanol", "Transonethreepentadiene_Methanol", "Isoprene_Methanol", "Isoprene_Ethanol", "Cyclopentadiene_Methanol", "Benzene_Chloroform", "Benzene_Phenol", "Benzene_Toluene", "Benzene_Pxylene", "Benzene_Onepropanol", "Toluene_Chloroform", "Toluene_Pxylene", "Acetaldehyde_Water", "Propionicaldehyde_Water", "Propionicaldehyde_Methanol", "Isobutyraldehyde_Water", "Acetone_Chloroform", "Acetone_Benzene", "Acetone_Phenol", "Acetone_Cyclohexane", "Acetone_Toluene", "Acetone_Ethanol", "Twobutanone_Benzene", "Twobutanone_Cyclohexane", "Twobutanone_Toluene", "Twobutanone_Nheptane", "Twobutanone_Water", "Twobutanone_Onepropanol", "Methanol_Water", "Methanol_Chloroform", "Methanol_Ethanol", "Methanol_Acetone", "Methanol_Benzene", "Methanol_Cyclohexane", "Methanol_Toluene", "Methanol_Nheptane", "Methanol_Tetrachloromethane", "Methanol_Tribromomethane", "Methanol_Acetonitrile", "Methanol_Onetwodichloroethane", "Methanol_Aceticacid", "Methanol_Dimethylsulfoxide", "Methanol_Propionicacid", "Methanol_Nndimethylformamide", "Methanol_Propanol", "Methanol_Thiophene", "Methanol_Methylacrylate", "Methanol_Twobutanone", "Methanol_Tetrahyrofuran", "Methanol_Onefourdioxane", "Methanol_Ethylacetate", "Methanol_Sulfolane", "Methanol_Onebutanol", "Methanol_Twobutanol", "Methanol_Tertbutanol", "Methanol_Onefourbutanediol", "Methanol_Pyridine", "Methanol_Methylmethacrylate", "Methanol_Methylisopropylketone", "Methanol_Threepentanone", "Methanol_Piperidine", "Methanol_Hexafluorobenzene", "Methanol_Chlorobenzene", "Methanol_Aniline", "Methanol_Twomethylpyridine", "Methanol_Threemethylpyridine", "Methanol_Fourmethylpyridine", "Methanol_Cyclohexene", "Methanol_Nbutylacetate", "Methanol_Hexane", "Methanol_Triethylamine", "Methanol_Twomethylphenol", "Methanol_Two6dimethylpyridine", "Methanol_Oneheptane", "Methanol_Methylcyclohexane", "Methanol_Heptane", "Methanol_Ethylbenzene", "Methanol_Mxylene", "Methanol_Pxylene", "Methanol_Oneoctene", "Methanol_Octane", "Methanol_Twotwofourtrimethylpentane", "Methanol_Onedodecanol", "Methanol_Oleic acid", "Ethanol_Water", "Ethanol_Chloroform", "Ethanol_Acetone", "Ethanol_Twobutanone", "Ethanol_Benzene", "Ethanol_Cyclohexane", "Ethanol_Toluene", "Ethanol_Nheptane", "Ethanol_Pxylene", "Ethanol_Tetrachloroethylene", "Ethanol_Acetonitrile", "Ethanol_Onetwodichloroethane", "Ethanol_Acetic acid", "Ethanol_Onetwoethanediol", "Ethanol_Twopropanol", "Ethanol_Onetwopropanediol", "Ethanol_Thiophene", "Ethanol_Onefourdioxane", "Ethanol_Sulfolane", "Ethanol_Morpholine", "Ethanol_Twobutanol", "Ethanol_Twomethylonepropanol", "Ethanol_Pyridine", "Ethanol_Methylmethacrylate", "Ethanol_Methylisopropyl", "Ethanol_Propylacetate", "Ethanol_Threemethylonebutanol", "Ethanol_Bromobenzene", "Ethanol_Chlorobezene", "Ethanol_Aniline", "Ethanol_Twomethylpyridine", "Ethanol_Threemethylpyridine", "Ethanol_Cyclohexanol", "Ethanol_Butylacetate", "Ethanol_Dipropylether", "Ethanol_Triethylamine", "Ethanol_Anisole", "Ethanol_Two6dimethylpyridine", "Ethanol_Pentylacetate", "Ethanol_Heptane", "Ethanol_Ethylbezene", "Ethanol_Octane", "Ethanol_Twotwofourtrimethylpentane", "Ethanol_Hexadecane", "Ethanol_Oleicacid", "Onepropanol_Water", "Onepropanol_Tetrachloroethylene", "Onepropanol_Aceticacid", "Onepropanol_Propionicacid", "Onepropanol_Twomethoxyethanol", "Propylamine_Onepropanol", "Onepropanol_Methacrylicacid", "Onepropanol_Twomethylonepropanol", "Onepropanol_Pyridine", "Onepropanol_Methylmethacrylate", "Onepropnaol_Propylacetate", "Onepropanol_Threemethylbutanol", "Onepropnaol_Chlorobenzene", "Onepropanol_Twomethylpyridine", "Onepropanol_Threemethylpyridine", "Onepropanol_Fourmethylpyridine", "Onepropanol_Propylpropionate", "Onepropanol_Dipropylamine", "Onepropanol_Hexamethyldisiloxane", "Onepropanol_Toluene", "Onepropnaol_Two6dimethylpyridine", "Onepropanol_Heptane", "Onepropanol_Pxylene", "Onepropanol_Octane", "Onepropanol_Decane", "Onepropanol_Onedecanol", "Twopropanol_Water", "Twopropanol_Onepropanol", "Isobutanol_Water", "Tertbutanol_Water", "Allylalcohol_Water", "Methylformate_Methanol", "Methylacetate_Water", "Methylacetate_Methanol", "Methylacetate_Ethanol", "Ethylacetate_Water", "Ethylacetate_Ethanol", "Vinylacetate_Ethanol", "Diethylether_Water", "Diethylether_Methanol", "Diethylether_Ethanol", "Diisopropylether_Water", "Methyltertbutylether_Methanol", "Dimethoxymethane_Water", "Dimethoxymethane_Methanol", "Ethyleneoxide_Water", "Propyleneoxide_Methanol", "Tetrahydrofuran_Water", "Tetrahydrofuran_Ethanol", "Tetrahydrofuran_Onepropanol", "Tetrachloromethane_Methanol", "Tertachloromethane_Onepropanol", "Vinylcloride_Methanol", "Dichloromethane_Methanol", "Dichloromethane_Ethanol", "Chloroform_Methanol", "Chloroform_Ethanol", "Onetwodichloroethane_Onepropanol", "Trichloroethylene_Onepropanol", "Threechloroonepropene_Water", "Butylchloride_Onepropanol", "Dimethylamine_Water", "Dimethylamine_Methanol", "Dimethylamine_Ethanol", "Dimethylamine_Onepropanol", "Ethylamine_Water", "Triethylamine_Water", "Triethylamine_Onepropanol", "Diethylamine_Water", "Diethylamine_Ethanol", "Propylamine_Water", "Nbutylamine_Water", "Butylamine_Ethanol", "Butylamine_Onepropanol", "Isopropylamine_Water", "Acetonitrile_Water", "Propionitrile_Water", "Acrylonitrile_Water", "Hexafluorobenzene_Onepropnaol", "Water_Acetone", "Water_Twobutanone", "Water_Phenol", "Water_Aceticacid", "Water_Nmethylformamide", "Water_Dimethylsulfoxide", "Water_Ethylenediamine", "Water_Acrylicacid", "Water_Propionicacid", "Water_Onethreefivetrioxane", "Water_Nndimethylformamide", "Water_Onefourdioxane", "Water_Sulfolane", "Water_Nndimethylacetamide", "Water_Morpholine", "Water_Nbutanol", "Water_Onefourbutanediol", "Water_Twothreebutanediol", "Water_Diethylenegylcol", "Water_Furfural", "Water_Pyridine", "Water_Nmethylpyrrolidone", "Water_Threemethylbutanol", "Water_Twomethyltwobutanol", "Water_Aniline", "Water_Twomethylpyridine", "Water_Threemethylpyridine", "Water_Fourmethylpyridine", "Water_Phenylhydrazine", "Water_Cyclohexanone", "Water_Mesityloxide", "Water_Cyclohexanol", "Water_Nbutylacetate", "Water_Diacetonealcohol", "Water_Onehexanol", "Water_Twohexanol", "Water_Twobutoxyethanol", "Water_Benzylalcohol", "Water_Two6dimethylpyridinr", "Water_Isopentylacetate", "Water_Acetophenone", "Water_Quinoline", "Water_Isopropylbenzene", "Halothane_Methanol", "Methanol_Formamide", "Methane_Acetone", "Methane_Propane", "Methane_Nbutane", "Methane_Npentane", "Methane_Benzene", "Methane_Nhexane", "Methane_Ndecane", "Ethane_Nheptane", "Ibutane_Nbutane", "Npentane_Acetone", "Nhexane_Nitroethane", "Nhexane_Aniline", "Nhexane_Methylcyclop", "Nhexane_Toluene", "Nheptane_Benzene", "Nheptane_Toluene", "Noctane_Nitroethane", "Noctane_Ipropanol", "Twotwofourtrimethylpentane_Nitroethane", "Twotwofourtrimethylpentane_Furfural", "Twotwofourtrimethylpentane_Benzene", "Twotwofourtrimethylpentane_Cyclohexane", "Twotwofourtrimethylpentane_Toluene", "Ndecane_Npropanol", "Ndecane_Nbutanol", "Ndecane_Ipropanol", "Cyclopentane_Benzene", "Methylcyclopentane_Benzene", "Methylcyclopentane_Toluene", "Cyclohexane_Nitromethan", "Cyclohexane_Npropanol", "Cyclohexane_Nbutanol", "Cyclohexane_Benzene", "Cyclohexane_Methylcyclop", "Cyclohexane_Nhexane", "Cyclohexane_Toluene", "Cyclohexane_Heptane", "Methylcyclohexane_Toluene", "Onebutene_Ibutane", "Onebutene_Propane", "Onebutene_Nbutane", "Benzene_Twobutanone", "Benzene_Nbutanol", "Benzene_Nhexane", "Benzene_Water", "Toluene_Furfural", "Hydrogen_Methanol", "Hydrogen_Acetone", "Hydrogen_Benzene", "Hydrogen_Nhexane", "Hydrogen_Mxylene", "Hydrogen_Noctane", "Hydrogen_Water", "Hydrogen_Ammonia", "Nitrogen_Nbutane", "Nitrogen_Nhexane", "Nitrogen_Water", "Nitrogen_Ammonia", "Carbonmonoxide_Methanol", "Carbonmonoxide_Acetone", "Carbonmonoxide_Benzene", "Carbonmonoxide_Noctane", "Acetaldehyde_Aceticacid", "Acetaldehyde_Vinylacetat", "Acetone_Carbontetra", "Acetone_Acetonitrile", "Acetone_Methanol", "Acetone_Aceticacid", "Acetone_Furfural", "Acetone_Nhexane", "Acetone_Water", "Acetone_Vinylacetat", "Methanol_Carbontetra", "Methanol_Ipropanol", "Methanol_Ethylacetat", "Methanol_Diethylamin", "Methanol_Methylisobut", "Methanol_Nhexane", "Methanol_Two.threedimethyl", "Methanol_Triethylamin", "Methanol_Anisole", "Ethanol_One.twodichloro", "Ethanol_Aceticacid", "Ethanol_Npropanol", "Ethanol_Tertbutanol", "Ethanol_Methylcyclop", "Ethanol_Nhexane", "Ethanol_Methylcyclo", "Ethanol_Noctane", "Ethanol_Twotwofourtrimethyl", "Ethanol_Ndecane", "Npropanol_Carbontetra", "Npropanol_Aceticacid", "Npropanol_Benzene", "Npropanol_Nhexane", "Npropanol_Toluene", "Npropanol_Nheptane", "Npropanol_Water", "Ipropanol_Ethylacetat", "Ipropanol_Benzene", "Ipropanol_Nheptane", "Ipropanol_Water", "Ipropanol_Twotwofourtrimethyl", "Nbutanol_Carbontetra", "Nbutanol_Aceticacid", "Nbutanol_Nhexane", "Nbutanol_Nheptane", "Nbutanol_Noctane", "Ibutanol_Benzene", "Secbutanol_Benzene", "Tertbutanol_Benzene", "Formicacid_Aceticacid", "Aceticacid_Toluene", "Aceticacid_Nheptane", "Propionicacid_Methylisobut", "Propionicacid_Noctane", "Methylacetate_Chloroform", "Methylacetate_Benzene", "Ethylacetate_Aceticacid", "Ethylacetate_Npropanol", "Ethylacetate_Furfural", "Ethylacetate_Benzene", "Ethylacetate_Toluene", "Ethylacetate_Ethylbenzen", "Vinylacetate_Aceticacid", "Vinylacetate_Water", "Dioxane_Benzene", "Carbontetrachloride_Acetonitrile", "Carbontetrachloride_Ethanol", "Carbontetrachloride_Furfural", "Carbontetrachloride_Benzene", "Carbontetrachloride_Cyclohexane", "Carbontetrachloride_Methylcyclop", "Carbontetrachloride_Toluene", "Carbontetrachloride_Nheptane", "Dichloromethane_Dichloroetan", "Chloroform_Carbontetra", "Chloroform_Formicacid", "Chloroform_Aceticacid", "Chloroform_Ethylacetate", "Chloroform_Benzene", "Nitromethane_Carbontetra", "Nitromethane_Benzene", "Nitroethane_Carbontetra", "Nitroethane_Npropanol", "Nitroethane_Benzene", "Onenitropropane_Carbontetra", "Onenitropropane_Benzene", "Twonitropropane_Carbontetra", "Twonitropropane_Benzene", "Twonitropropane_Nhexane", "Acetonitrile_Benzene", "Acetonitrile_Nheptane", "Acrylonitrile_Acetonitrile", "Aniline_Methylcyclop", "Furfural_Onebutene", "Furfural_Nbutane", "Furfural_Ibutane", "Furfural_Benzene", "Furfural_Cyclohexane", "Water_Formicacid", "Water_Acetonitrile", "Water_Nitroethane", "Water_Dioxane", "Water_Onebutene", "Water_Ibutane", "Water_Toluene", "Water_Acrylonitril", "Water_Cisbutenetwo", "Water_Transbutene", "Water_Isobutene", "Water_Butadiene", "Carbondisulfide_Methanol", "Carbondisulfide_Acetone"};
  constant Real BI_Values[440, 2] = {{1289.4881, 6.7114}, {938.0838, -112.7209}, {849.013, -56.7699}, {1056.8977, -135.5484}, {743.1034, -127.2476}, {1251.6417, -391.9511}, {1525.5351, -516.0584}, {1403.5125, -70.3003}, {1499.6766, -66.3796}, {983.1208, -123.8651}, {1329.9294, -21.5842}, {970.6914, -128.7022}, {1300.2481, -72.9715}, {1489.1438, -97.747}, {1477.5985, -92.9294}, {1514.3534, -144.3088}, {912.9208, -118.3758}, {1410.4509, -61.3753}, {-119.7224, -29.4499}, {72.2429, 197.453}, {70.7224, -58.3017}, {5.7397, 0.5699}, {378.6125, 20.5261}, {860.8206, -554.8868}, {121.3912, -119.706}, {-1132.16, -231.7521}, {735.9692, 208.343}, {416.3831, -377.9488}, {1263.005, -81.883}, {1566.0069, -781.5877}, {-358.9226, 604.28}, {-468.3882, 27.3851}, {-77.5361, 543.595}, {-315.279, 555.7418}, {94.5536, 117.867}, {-300.8429, 385.863}, {146.0313, 100.2596}, {366.3689, -250.2784}, {-184.485, 559.8999}, {775.153, 30.4806}, {147.6576, -8.2705}, {-337.1298, 549.2958}, {-271.0633, 1304.9835}, {-474.7791, 762.8153}, {-84.2364, 403.8524}, {-67.7213, 1117.8797}, {-32.2887, 1703.2055}, {-58.1103, 1190.6454}, {17.9144, 1360.0217}, {-95.2921, 1463.4548}, {-92.0642, 984.2538}, {101.9628, 334.9587}, {-80.7067, 1094.1304}, {-40.7254, -51.0491}, {-366.7607, 84.4189}, {7.1816, 0.3295}, {-156.3839, 103.9406}, {-26.2861, 113.5565}, {-265.3781, 1099.9741}, {-25.1614, 600.3028}, {-136.0158, 584.0634}, {-153.2518, 629.7314}, {-19.0988, 451.089}, {-138.9829, 770.3047}, {-28.6882, 675.1045}, {40.3898, 121.5049}, {471.807, -279.7321}, {-291.983, 403.6892}, {-286.6527, 490.8909}, {425.4563, -393.3415}, {-98.6602, 843.2593}, {-100.1669, 594.2312}, {-83.8392, 609.2057}, {-383.9791, 153.8253}, {-90.0876, 1245.166}, {-118.0717, 1402.7818}, {-144.7753, 517.8626}, {-603.5633, 950.103}, {-206.2407, 81.4664}, {-78.8509, -53.173}, {-38.5257, 1529.9926}, {-174.2617, 892.9417}, {38.3254, 1391.4917}, {-318.8007, 905.0708}, {-502.2428, 548.3889}, {-272.5909, 272.4921}, {-12.605, 1363.9261}, {1.0023, 1552.7297}, {-27.9877, 1578.6097}, {-57.095, 1259.4286}, {-41.7377, 1208.1529}, {-47.6694, 1231.2086}, {-32.2567, 1396.3019}, {-32.7911, 1561.8955}, {-59.6929, 1577.3145}, {18.9334, 484.2757}, {-149.1808, 952.0283}, {173.801, 109.8687}, {-305.3246, 881.3549}, {94.2417, 98.7523}, {-25.7234, 250.3958}, {-127.9893, 744.8826}, {-153.0128, 1100.3231}, {-97.5633, 698.6183}, {-150.277, 1127.5232}, {-63.9673, 664.259}, {-61.6485, 783.4873}, {392.2083, 91.3933}, {-39.1051, 669.688}, {-25.2901, -86.9343}, {818.093, -200.1567}, {437.5184, -324.6275}, {181.0206, -57.8238}, {-77.9585, 662.4746}, {50.8172, 212.2982}, {177.7675, 306.35}, {-712.473, 1116.7138}, {-311.9029, 474.5511}, {-117.4292, 220.9133}, {378.8209, -378.8991}, {-105.4041, 544.4089}, {-260.5944, 652.4019}, {-13.0186, 405.1733}, {82.3751, -18.3336}, {-169.9204, 998.8196}, {-205.6039, 1032.724}, {1262.584, -446.4834}, {139.4905, -225.4203}, {-578.9542, 942.9023}, {634.1484, -339.732}, {-38.4912, 384.6715}, {-177.4837, 780.0513}, {-305.4069, 674.3341}, {928.9185, -379.9781}, {-432.4206, 583.2958}, {-161.4264, 631.1662}, {-115.7807, 1040.2891}, {-127.6343, 841.5199}, {-152.8323, 1156.688}, {-165.9382, 1120.4853}, {-401.4408, 1783.7857}, {-180.7604, 627.9668}, {190.5947, 290.554}, {-13.5513, 473.6899}, {-729.0848, 1660.0903}, {-83.3064, -4.418}, {-300.7498, 511.0851}, {-274.4208, 15.9476}, {114.789, -169.5098}, {47.0059, -46.6524}, {423.4439, -423.9207}, {-27.435, 256.1456}, {-91.8942, 278.7259}, {-19.2402, 27.9161}, {1.3035, 311.4544}, {163.7157, -281.9383}, {199.1862, -290.3666}, {180.7309, -293.8268}, {-585.5214, 1186.3162}, {-1.1304, 48.1557}, {-218.4928, 677.0367}, {-1.7464, 340.4905}, {-595.2165, 936.7248}, {-91.2018, 743.266}, {-74.7475, 427.6292}, {-48.752, 525.9933}, {-175.9432, 744.763}, {89.4506, 31.0832}, {327.443, 64.4408}, {103.5993, -103.7179}, {350.1707, 309.5428}, {230.5098, 271.3048}, {281.7442, 47.6526}, {623.2636, -2.0107}, {830.7943, 47.5023}, {611.2312, -70.982}, {267.0169, -79.2922}, {1441.5619, -205.7336}, {436.0416, -98.562}, {483.9533, -67.6116}, {1198.9207, 102.271}, {906.3646, -157.3556}, {642.6982, -171.8091}, {1415.2748, 81.2811}, {1024.985, -203.711}, {1098.9416, -44.1418}, {657.2765, -4.6934}, {10542.2026, -344.1682}, {791.0185, -210.2403}, {835.2626, 10.5163}, {559.1539, -260.1951}, {381.8256, -244.669}, {1029.3332, -171.0842}, {957.274, -252.3762}, {7661.2894, -187.7083}, {1516.5558, -229.3734}, {796.2935, -172.0713}, {1295.4282, -271.461}, {981.7658, -335.4504}, {272.4952, 107.634}, {538.1802, -90.5235}, {1260.1312, 81.3308}, {748.22, -172.7007}, {-1070.3252, 1057.3916}, {-520.5358, -200.8021}, {-1071.4286, 1018.5371}, {-71.2521, -231.1124}, {149.3345, -412.065}, {242.4137, 2458.766}, {701.924, -371.1197}, {721.1889, -312.3228}, {-613.4553, 1006.1474}, {426.0894, -302.8076}, {-379.6694, 874.815}, {-17.1391, -220.6087}, {-188.4751, -68.9772}, {-553.685, 1001.0323}, {266.3109, 332.5988}, {367.0686, 510.5582}, {395.4004, 537.1531}, {535.7543, -38.2344}, {-110.3829, 698.7989}, {752.9217, 39.6746}, {934.8834, -501.3763}, {-251.6868, 407.0073}, {-867.7066, 2091.772}, {-292.3021, -523.6271}, {-175.0216, -724.876}, {-417.4722, 1189.9025}, {486.4688, -146.6582}, {-210.5536, 915.1339}, {639.5742, -556.8715}, {-444.013, 1302.0378}, {-397.8616, 997.3999}, {453.4841, -463.0383}, {933.6195, -802.5279}, {548.2453, 89.0444}, {-370.3689, 1635.7568}, {489.1312, -286.7611}, {-346.2827, 900.5916}, {537.7334, -36.221}, {-56.5403, -97.5005}, {-801.2765, 1402.6755}, {819.6231, -223.7898}, {-178.9352, 1021.7979}, {-91.7122, 485.3384}, {-657.2675, 1253.468}, {1280.6209, -655.1387}, {-358.5748, 333.911}, {-334.1695, 857.6208}, {316.6082, 95.0342}, {-56.9399, 1043.7692}, {-286.8493, 1023.7144}, {394.2396, 756.4163}, {-351.0861, 1188.5242}, {-9.7248, 802.6348}, {-172.0599, 1138.3704}, {-178.571, 670.1422}, {83.4921, 304.0167}, {-497.9465, 893.7955}, {-250.5667, 1438.236}, {234.4706, 641.1422}, {-847.2235, 663.5428}, {-310.5637, 1655.4649}, {1653.8373, -379.2679}, {319.3243, -34.2606}, {-0.26, 471}, {-2.01, 604}, {-2.05, 731}, {-1.32, 509}, {-0.38, 473}, {-0.06, 94}, {-0.24, 150}, {264.89, -112.61}, {1, 1}, {266.31, -22.83}, {230.64, -5.86}, {283.76, 34.82}, {-138.84, 162.13}, {34.27, 4.3}, {245.42, -135.93}, {108.24, -72.96}, {333.48, -30.98}, {1107.44, -166.18}, {236.48, 10.66}, {410.08, -4.98}, {80.91, -27.13}, {141.01, -112.66}, {141.11, -94.6}, {1137.2, -201.82}, {1430.77, -259.67}, {1074.76, -207.27}, {15.19, 33.15}, {56.47, -6.47}, {89.77, -48.05}, {517.19, 105.01}, {1284.75, -173.42}, {1393.11, -196.9}, {-32.57, 88.26}, {144.37, -118.82}, {172.73, -145.56}, {83.67, -44.04}, {-76.36, 98.22}, {210.35, -134.19}, {-23.03, 35.11}, {126.71, -98.63}, {-23.03, 35.11}, {350.47, -226.16}, {928.9, -181.24}, {-77.13, 132.43}, {2057.42, 115.13}, {74.87, 244.12}, {3.94, 218}, {3.23, 218}, {1.97, 810}, {2.99, -4}, {2.09, 765}, {-0.05, 1646}, {9.97, -880}, {0.68, 1344}, {-1.67, 814}, {0.07, 336}, {3.76, 913}, {-3.35, 2098}, {0.83, 552}, {0.48, 408}, {-1.04, 1062}, {-3.38, 1878}, {458.43, -212.77}, {-117.74, 243.51}, {-92.32, 246.68}, {-176.38, 261.53}, {359.1, -96.9}, {461.81, -262.3}, {-101.3, 195.63}, {-33.08, 261.51}, {530.99, -100.71}, {-82.48, 110.6}, {-29.64, 1127.95}, {-24.85, 31.22}, {-107.54, 579.61}, {-374.88, 676.42}, {-105.94, 688.03}, {-2.66, 1636.05}, {-7.18, 1463.9}, {-186.66, 664.29}, {-48.39, 782.28}, {-105.66, 929.71}, {-210.53, 244.67}, {210.95, -67.7}, {-2.62, 9.24}, {-118.27, 1383.93}, {-108.93, 1441.57}, {-117.57, 1340.56}, {-109.08, 1385.91}, {-120.42, 1449.61}, {-127.48, 1254.65}, {-166.93, 1336.03}, {299.33, 445.77}, {-155.1, 928.5}, {-144.11, 1326.05}, {-195.4, 818.34}, {-160.43, 1306.22}, {78.37, 583.03}, {-190.57, 522.07}, {-145.52, 854.75}, {-162.54, 1295.6}, {217.23, 11.59}, {-198.06, 994}, {-188.77, 1248.17}, {-296.3, 546.68}, {-159.24, 1370.74}, {-251.11, 1291.98}, {-236.21, 1098.91}, {-162.39, 861.06}, {784.99, -168.83}, {744.89, -165.4}, {-144.58, 241.64}, {-67.91, 298.09}, {-8.49, 342.57}, {-78.49, 136.46}, {-183.2, 556.12}, {-187.87, 121.17}, {203.46, -143.88}, {-214.39, 63.04}, {539.64, -190.31}, {-19.15, 48.52}, {233.81, -181.49}, {309.41, -214.26}, {137.11, -105.5}, {330.03, -124.12}, {1557.23, 131.36}, {363.78, -197.65}, {458.86, -40.18}, {1192.49, -135.27}, {476.85, -100.42}, {-37.52, 43.39}, {98.18, -84.82}, {161.96, -129.21}, {-168.53, 203.67}, {88.3, -59.13}, {1, 1}, {-14.74, 38.19}, {461.38, 90.36}, {346.43, -98.44}, {24.16, -119.49}, {4.98, -50.53}, {0.59, 398.4}, {73.79, 82.2}, {73.06, 295.06}, {574.22, -94.39}, {16.61, 46.05}, {-95.68, 267.13}, {535.16, -246.81}, {-134.32, 307.25}, {794.91, -344.15}, {-32.95, 252.2}, {60.28, 89.57}, {23.71, 545.79}, {183.65, -142.35}, {54.36, 228.71}, {49.12, 242.1}, {88.87, 257.71}, {97.14, 268}, {71, 12}, {41.17, 354.83}, {-508.85, 1019.29}, {122.02, 122.07}, {138.44, 920.08}, {-328.7, 927.26}, {590.17, 777.95}, {646.79, 1173.23}, {305.71, 1371.36}, {155.78, 471.21}, {356.45, -18.31}, {356.45, -18.31}, {346.74, 657.5}, {496.1, 270.6}, {1166.49, 138.15}, {157.31, 103.91}};
  algorithm
  for i in 1:NOC loop
  for j in 1:NOC loop
  for k in 1:2 loop
  value[i, j] := 0;
  end for;
  end for;
  end for;
  for i in 1:NOC loop
  for j in 1:NOC loop
  c[i, j] := Comp[i] + underscore + Comp[j];
  d[i, j] := Comp[j] + underscore + Comp[i];
  for k in 1:440 loop
  if c[i, j] == Comp1_Comp2[k] then
  value[i, j] := BI_Values[k, 1];
  value[j, i] := BI_Values[k, 2];
  end if;
  if d[i, j] == Comp1_Comp2[k] then
  value[j, i] := BI_Values[k, 1];
  value[i, j] := BI_Values[k, 2];
  end if;
  end for;
  end for;
  end for;
  end BIP_UNIQUAC;
  
model bubblepnt
Real  Psat[2];
algorithm
for i in 1:NOC loop
Psat[i] := Thermodynamic_Functions.Psat(Comp[i].VP, T);
end for;
equation
x[1] = time;
x[2] = 1 - x[1];
P = sum(gamma[:] .* x[:] .* Psat[:]);
y[1] = 0;
y[2] = 0;
end bubblepnt;




  
  model DewPnt
  //parameter Chemsep_Database.Methanol methanol;
    parameter Chemsep_Database.Ethanol ethanol;
  parameter Chemsep_Database.Water water;
  parameter Real z[2] = {0.5, 0.5};
  extends UNIQUAC(NOC = 2, Comp = {ethanol, water}, P = 101325);
  Real Psat[2], K[2];
  algorithm
  for i in 1:NOC loop
  Psat[i] := Thermodynamic_Functions.Psat(Comp[i].VP, T);
  end for;
  equation
  y[1] = time;
  K = gamma[:] .* Psat[:] ./ P;
    y[2] = 1 - y[1];
  x[1] = y[1] / K[ 1];
  x[2] = 1 - x[1];
  x[2] = y[2] / K[2];
  end DewPnt;
  
  function BIPSRK
  input Integer NOC;
  input String Comp[NOC];
  output Real value[NOC, NOC];
  constant String underscore = "_";
  String c[NOC, NOC];
  String d[NOC, NOC];
  constant String Comp1_Comp2[39] = {"Methanol_Water", "Methane_Ethane", "Methane_Propane", "Methane_Nbutane", "Methane_Npentane", "Methane_Nhexane", "Methane_Nheptane", "Methane_M-xylene", "Methane_Noctane", "Methane_Nnonane", "Ethane_Propane", "Ethane_Nbutane", "Ethane_Npentane", "Ethane_Benzene", "Ethane_Cyclohexane", "Ethane_Nhexane", "Ethane_Nheptane", "Ethane_Noctane", "Propane_Ethanol", "Propane_Nbutane", "Propane_Npentane", "Propane_Benzene", "Propane_Nhexane", "Propane_Nheptane", "Propane_Noctane", "Nbutane_Npentane", "Nbutane_Nhexane", "Nbutane_Nheptane", "Nbutane_Noctane", "Npentane_Benzene", "Npentane_Cyclohexane", "Npentane_Nheptane", "Npentane_Noctane", "Benzene_Nheptane", "Benzene_Noctane", "Cyclohexane_Benzene", "Nhexane_Benzene", "Nhexane_Cyclohexane", "Nhexane_Nheptane"};
  constant Real BI_Values[39] = {-0.0789, -0.0089, 0.018, 0.0215, 0.018, 0.0378, 0.0274, 0.09, 0.0448, 0.0448, -0.0022, 0.0052, 0.0056, 0.0278, 0.0122, -0.0433, 0.0041, 0.017, 0.0256, 0, 0.0233, 0.02, -0.0022, 0.0044, 0.0074, 0.0204, -0.0111, -0.0004, 0.0044, 0.0244, 0.0041, 0.0019, -0.0022, 0.0048, 0.007, 0.0322, 0.0156, -0.0011, -0.0011};
  algorithm
  for i in 1:NOC loop
  for j in 1:NOC loop
  value[i, j] := 0;
  end for;
  end for;
  for i in 1:NOC loop
  for j in 1:NOC loop
  c[i, j] := Comp[i] + underscore + Comp[j];
  d[i, j] := Comp[j] + underscore + Comp[i];
  for k in 1:39 loop
  if c[i, j] == Comp1_Comp2[k] or d[i, j] == Comp1_Comp2[k] then
  value[i, j] := BI_Values[k];
  end if;
  end for;
  end for;
  end for;
  end BIPSRK;
  
  model SRK
  constant Real R = 8.314;
  parameter Integer NOC;
  parameter Chemsep_Database.General_Properties Comp[NOC];
  parameter Real KSRK[NOC, NOC] = BIPSRK(NOC, Comp.name);
  Real Tr[NOC],  aa[NOC, NOC];
  Real fiv[NOC](each start = 1);
 Real Zv[3, 2], ZV, zv[3] ;
  Real a[NOC], b[NOC], amv, aamv, bmv, Av, Bv, Polyv[4];
  Real fil[NOC](each start = 1);
  Real Zl[3, 2], ZL, zl[3] ;
  Real aml, aaml, bml, Al, Bl, Polyl[4];
  algorithm
  for i in 1:NOC loop
  Tr[i] := T / Comp[i].Tc;
  a[i] := (1 + (0.48 + 1.574 * Comp[i].AF - 0.176 * Comp[i].AF ^ 2) * (1 - Tr[i] ^ 0.5)) ^ 2 * (0.42747 * R ^ 2 * Comp[i].Tc ^ 2) / Comp[i].Pc;
  b[i] := 0.08664 * (R * Comp[i].Tc) / Comp[i].Pc;
  end for;
  for j in 1:NOC loop
  aamv := 0;
  aaml := 0;
      for k in 1:NOC loop
  aa[j, k] := (a[j] * a[k]) ^ 0.5 * (1 - KSRK[j, k]);
  aamv := aamv + y[j] * y[k] * aa[j, k];
  aaml := aaml + x[j] * x[k] * aa[j, k];
      end for;
  amv := amv + aamv;
  aml := aml + aaml;
    end for;
  bmv := sum(y[:] .* b[:]);
  bml := sum(x[:] .* b[:]);
  Av := amv * P / (R ^ 2 * T ^ 2);
  Bv := bmv * P / (R * T);
  Al := aml * P / (R ^ 2 * T ^ 2);
  Bl := bml * P / (R * T);
    Polyv[1] := 1;
  Polyv[2] := -1;
  Polyv[3] := Av - Bv - Bv ^ 2;
  Polyv[4] := -Av * Bv;
  Polyl[1] := 1;
  Polyl[2] := -1;
  Polyl[3] := Al - Bl - Bl ^ 2;
  Polyl[4] := -Al * Bl;
  Zl := Modelica.Math.Vectors.Utilities.roots(Polyl);
  Zv := Modelica.Math.Vectors.Utilities.roots(Polyv);
  for i in 1:3 loop
  zv[i] := Zv[i, 1];
  zl[i] := Zl[i, 1];
    end for;
  ZV := max(zv);
  ZL := zl[2];
    for i in 1:NOC loop
  fiv[i] := exp(b[i] / bmv * (ZV - 1) - log(ZV - Bv) - Av / Bv * (sum(y[:] .* aa[:, i]) / amv - b[i] / bmv) * log((ZV + Bv) / ZV));
  fil[i] := exp(b[i] / bml * (ZL - 1) - log(ZL - Bl) - Al / Bl * (sum(x[:] .* aa[:, i]) / aml - b[i] / bml) * log((ZL + Bl) / ZL));
  end for;
  end SRK;
  
  model SRK_test
  parameter Chemsep_Database.Propane propane;
  parameter Chemsep_Database.Benzene benzene;
  parameter Real z[2] = {0.5, 0.5};
  extends SRK(NOC = 2, Comp = {propane, benzene});
  parameter Real P = 101325, T = 303;
  Real x[2](each start = 0.5, each min = 0, each max = 1);
  Real y[2](each start = 0.5, each min = 0, each max = 1);
  Real beta(start = 0.5, min = 0, max = 1), K[2](each start = 1, each min = 0), Psat[2];
  algorithm
  for i in 1:2 loop
  Psat[i] := Thermodynamic_Functions.Psat(Comp[i].VP, T);
  end for;
  equation
  sum(x[:]) - sum(y[:]) = 0;
  K[:] = fil[:] .* Psat[:] ./ (P .* fiv[:]);
  y[:] = K[:] .* x[:];
  y[:] * beta + x[:] * (1 - beta) = z[:];
  end SRK_test;
  model EnthalpyTest
  constant Integer NOC = 2;
  extends Thermodynamic_Packages.PR;
  parameter Real P = 101325, T = 300;
  parameter Chemsep_Database.Methane methane;
  parameter Chemsep_Database.Ethane ethane;
  parameter Real y[2] = {0.5, 0.5};
  parameter Chemsep_Database.General_Properties Comp[NOC] = {methane, ethane};
  end EnthalpyTest;

  model GUi_BBL
  parameter Chemsep_Database.Ethanol C1;
  parameter Chemsep_Database.Water C2;
  parameter Real Pressure = 101.325;
  extends Thermodynamic_Packages.bubblepnt;
  extends Thermodynamic_Packages.UNIQUAC(NOC = 2, Comp = {C1,C2}, P = Pressure);
  end GUi_BBL;



end Thermodynamic_Packages;
