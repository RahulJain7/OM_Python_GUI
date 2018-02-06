"""
    THIS IS THE MATERIAL STREAM UNIT OPERATION CLASS CHILD OF A UNITOP CLASS.
"""

import UnitOP
from error import Error

class Stream(UnitOP.UnitOP):


    def __init__(self,**kwargs):
        """
            Initializes all the variables.
        """
        super(Stream, self).__init__(**kwargs)
        self.type = 0  # Material Stream type 0
        self.input_streams = {1: None}  # Input stream objects
        self.output_streams = {1: None}  # Output stream objects
        self.input_lines = {1: None}  # Input line objects
        self.output_lines = {1: None}  # Output line objects
        self.size2 = (70, 60)  # Size of the wrapper
        self.current_spec = 0  # Defines current specification
        # Properties of the button
        self.mol_frac_mix = []
        self.mass_frac_mix = []
        self.size_hint = (None, None)
        self.size = (53.33, 40)
        self.background_normal = 'Images/mat_operator.png'
        self.background_down = 'Images/mat_operator.png'
        self.border = 0, 0, 0, 0
        self.PhaseMixVal = ['0', '0','0','0','0','0','0','0','0','0']
        self.PhaseVapVal = ['0', '0','0','0','0','0','0','0','0','0']
        self.PhasePropertyMix = ['Pressure','Temperature','Liq Mole Fraction','Liq Mass Fraction','Total Molar Flow',
                                  'Total Mass Flow','Av. Molecular Weight','Molar Specific Heat','Molar Enthalpy',
                                 'Molar Entropy']

        self.PhasePropertyVap = ['Pressure','Temperature','Vap Mole Fraction','Vap Mass Fraction','Total Molar Flow',
                                 'Total Mass Flow','Av. Molecular Weight','Molar Specific Heat','Molar Enthalpy',
                                 'Molar Entropy']
        self.compound_amounts_molar_frac_mix = []  # Contains all the compounds molar fractions
        self.compound_amounts_mass_frac_mix = []  # Contains all the compounds mass fractions
        self.compound_amounts_molar_flow_mix = []
        self.compound_amounts_mass_flow_mix = []
        self.compound_amounts_molar_frac_vap = []  # Contains all the compounds molar fractions
        self.compound_amounts_mass_frac_vap = []  # Contains all the compounds mass fractions
        self.compound_amounts_molar_flow_vap = []
        self.compound_amounts_mass_flow_vap = []
        self.comp_prop_sph_value = []
        self.comp_prop_meh_value = []
        self.comp_prop_met_value = []
        self.comp_enable = []

        self.PhasePropertyMixDict = {
            # 'Volumetric Flow Rate'
            'Pressure': 'P',
            'Temperature': 'T',
            'Liq Mole Fraction': 'liqPhasMolFrac',
            'Liq Mass Fraction': 'liqPhasMasFrac',
            'Total Molar Flow': 'totMolFlo[1]',
            'Total Mass Flow': 'totMasFlo[1]',
            'Av. Molecular Weight': 'MW[1]',
            'Molar Specific Heat': 'phasMolSpHeat[1]',
            'Molar Enthalpy': 'phasMolEnth[1]',
            'Molar Entropy': 'phasMolEntr[1]'

        }
        self.PhasePropertyMixUnit = ['(Pa)', '(K)', '', '', '(mol/s)', '(kg/s)', '(kg/kmol)', '(kJ/kg)', '(kJ/kmol)', '(kJ/[kmol.K])']
        self.PhasePropertyVapUnit = ['(Pa)', '(K)', '', '', '(mol/s)', '(kg/s)', '(kg/kmol)', '(kJ/kg)', '(kJ/kmol)', '(kJ/[kmol.K])']
        self.PhasePropertyVapDict = {
            # 'Volumetric Flow Rate'
            'Pressure': 'P',
            'Temperature': 'T',
            'Vap Mole Fraction': 'vapPhasMolFrac',
            'Vap Mass Fraction': 'vapPhasMasFrac',
            'Total Molar Flow': 'totMolFlo[3]',
            'Total Mass Flow': 'totMasFlo[3]',
            'Av. Molecular Weight': 'MW[3]',
            'Molar Specific Heat': 'phasMolSpHeat[3]',
            'Molar Enthalpy': 'phasMolEnth[3]',
            'Molar Entropy': 'phasMolEntr[3]'

        }
        self.input_prop_unit = ["(K)","(Pa)","(kg/s)","(mol/s)","(spec)"]
        self.PropertyList = ['Temperature', 'Pressure', 'Mass Flow', 'Molar Flow', 'Vapour Mole Fraction']  # Property list
        self.compound_spec = ['Molar Fractions', 'Mass Fractions']  # Compound specification list
        self.compound_spec_prop= ['Molar Fractions', 'Mass Fractions','Molar Flow', 'Mass Flow']
        self.comp_prop = ["Molar Specific Heat", "Molar Enthalpy", "Molar Entropy"]
        self.prop_enable = [0,0,0,0,0]
        self.Connecting_Points_Input = []  # Input connecting points
        self.Connecting_Points_Output = []  # Output connecting points
        self.upward_connector_input = []  # Upward input connecting point
        self.downward_connector_input = []  # Downward input connecting point
        self.upward_connector_output = []  # Upward output connecting point
        self.downward_connector_output = []  # Downward output connecting point
        self.OM_Model = 'Mat_Stm'  # Model Name
        self.PropertyVal = ['373', '101325', '100', '100', '0']  # Initial property value
        self.check_stm = 0  # used to check if a unit-operation is a material stream.
        self.status = 0
        self.popup_check = 0
        self.error_popup = Error()
        self.error = self.error_popup.ids.error_message


    def Update_Conn_Pnts(self):
        """
            Updates Connection points with present position of the unit operation
        """
        self.Connecting_Points_Input = [self.x+8, self.y+20]
        self.Connecting_Points_Output = [self.x+48, self.y+20]
        self.upward_connector_output = [self.x+55,self.y+40]
        self.downward_connector_output = [self.x+55,self.y+0]
        self.upward_connector_input = [self.x , self.y + 40]
        self.downward_connector_input = [self.x , self.y + 0]


    def on_submit(self, instance):
        """
            Triggered when properties popup is submitted.
        """
        sum = 0
        check = 0
        check2 = 0
        if self.current_comp_spec == 0:
            for i in self.compound_input_molar:
                if i.text != '0':
                    check2 = 1
                    sum += float(i.text)
        else:
            for i in self.compound_input_mass:
                if i.text != '0':
                    check2 = 1
                    sum += float(i.text)

        if sum != 1 and self.current_comp_spec == 0 and check2 == 1:
            self.error.text = "The sum of molar fractions of the compounds should be equal to 1"
            self.error_popup.open()
            check = 1
        elif sum != 1 and self.current_comp_spec == 1 and check2 == 1:
            self.error.text = "The sum of mass fractions of the compounds should be equal to 1"
            self.error_popup.open()
            check = 1


        if check ==0:
            count = 0
            for i in self.compound_input_molar:
                self.compound_amounts_molar_frac_mix[count] = i.text
                self.mol_frac_mix.append(float(i.text))
                count += 1
            count = 0
            for i in self.compound_input_mass:
                self.compound_amounts_mass_frac_mix[count] = i.text
                self.mass_frac_mix.append(float(i.text))
                count += 1


        self.PropertyVal = []
        self.name = self.name_ob.text
        self.text_label.text = self.name
        UnitOP.UnitOP.drop_connections[self.name] = UnitOP.UnitOP.drop_connections[self.bef_name]
        for property in self.PropertyObj:
            self.PropertyVal.append(property.text)





