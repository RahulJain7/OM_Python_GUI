"""
    THIS FILE CONTAINS THE MAIN UNIT OPERATION CLASS.
    ALL THE UNIT OPERATIONS USED IN THE PROJECT ALL CHILDREN OF THIS CLASS.

    THE PROPERTIES POP-UP FOR ANY UNIT OPERATION IS DEFINED AND STYLED HERE.
    WHENEVER ADDING NEW UNIT OPERATION IT DIRECTLY SHOULD BE A CHILD OF UNITOP BUTTON CLASS.
"""

from kivy.app import App
from kivy.clock import Clock
from kivy.uix.widget import Widget
from kivy.uix.button import Button
from kivy.uix.boxlayout import BoxLayout
from kivy.properties import ListProperty
from kivy.properties import NumericProperty
from kivy.graphics.vertex_instructions import Rectangle
from kivy.graphics.vertex_instructions import Line
from kivy.uix.bubble import Bubble
from kivy.uix.popup import Popup
from functools import partial
from kivy.uix.scrollview import ScrollView
from kivy.uix.slider import Slider
from kivy.uix.gridlayout import GridLayout
from kivy.uix.stacklayout import StackLayout
from kivy.uix.label import Label
from kivy.uix.textinput import TextInput
from kivy.uix.floatlayout import FloatLayout
from kivy.graphics.context_instructions import Color
from kivy.graphics.instructions import InstructionGroup
from kivy.lang import Builder
from kivy.uix.dropdown import DropDown
from main import OmWidget
from kivy.factory import Factory
from kivy.uix.checkbox import CheckBox
from kivy.uix.modalview import ModalView

# Link 'popup.kv' with 'UnitOp.py'
Builder.load_file('popup.kv')

class PropCheckBox(CheckBox):
    """
        Custom Checkbox for properties popup
    """
    pass

class PropInputLabel(Label):
    """
        Custom Label for properties popup
    """
    pass


class PropInputTextInput(TextInput):
    """
        Custom TextInput for properties popup
    """
    pass


class c1PopUp(ModalView):
    """
        Properties popup for non material streams
    """
    pass


class c2PopUp(ModalView):
    """
        Properties popup for material streams
    """
    pass


class Select_Button(Button):
    """
        Custom button for connections selection drop-down in properties popup
    """
    pass



class dDown(DropDown):
    """
        Custom Dropdown for connections selection drop-down in properties popup
    """
    DrNumber = NumericProperty(0)



class butt(Button):
    """
        Custom drop_down buttons for connections selection drop-down in properties popup
    """
    DrNumber = NumericProperty(0)
    border = 0,0,0,0



class UnitOPM(Factory.CustButton):
    """
        Wrapper for UnitOP with a Label attached and unit operation as a child
    """
    def __init__(self, **kwargs):
        super(UnitOPM, self).__init__(**kwargs)
        self.child = Button()



class UnitOP(Button):
        """
            Main Unit Operation Class. All the unit operations used are children of this class
        """
        Operators = []
        all_operators = []
        drop_connections = {}
        size_limit = [100, 100]
        unpressed = ListProperty([0, 0])
        double_tap = NumericProperty(0)
        multi_touch = NumericProperty(0)
        current_touch = None
        line_move = NumericProperty(0)
        connect = NumericProperty(0)
        compound_elements = []


        def __init__(self, **kwargs):
            """
                init function initializes all the variables
            """
            super(UnitOP, self).__init__(**kwargs)
            self.type = -1  # Used to different Unit Operation
            self.stream_count = []  # Defines the number of inputs and outputs for a Unit Operation
            self.input_streams = {}  # Contains all the input stream objects
            self.output_streams = {}  # Contains all the output stream objects
            self.input_lines = {}  # Contains all the input lines objects
            self.output_lines = {}  # Contains all the output lines objects
            self.connected = False  # Variable to check if the unit operation is connected or not
            self.PropertyListInput = []  # Input list property names.
            self.PropertyListOutput = []  # Output list property names.
            self.CalculationMethodList = [] # Calculation methods list property names.
            self.PropertyObj = []  # Contains Text Input Objects of all properties
            self.OM_Model = ''  # Object name for OMPython
            self.name = ''  # Actual Unit Operation name
            self.PropInput = []  # Contains text-input objects of all properties
            self.PropLabelStreams = []  # Contains all the label objects of all the properties
            self.conn_point_input = 0  # Defines the connecting point of a material stream on the connected object
            self.conn_point_output = 0  # Defines the connecting point of a material stream on the connected object
            self.check_stm = 1  # Is 0 for material stream and 1 for others
            self.check_mixer=1 # Is 0 for Mixer and 1 for others
            self.check_valve=1 # Is 0 for Valve and 1 for others
            self.DropDownsInput = []  # Contains all the Drop-Down objects of input connections
            self.MainButtonInput = []  # Contains all the select buttons for input connections
            self.DropDownsOutput = []  # Contains all the Drop-Down objects of output connections
            self.CalculationMethods = [[]] # List of Different calculation methods
            self.DropDownsCalc = [] # Contains all the Drop-Down objects of Calculation methods.
            self.MainButtonOutput = []  # Contains all the select buttons for output  connections
            self.MainButtonCalc = [] # Contains all the select buttons for calculation methods.
            self.name_ob = TextInput()  # Name text-input field for properties popup
            self.bef_name = ''  # Stores the previous name
            self.text_label = Label()  # Stores the Label Object visible on the canvas
            self.updated_input_operators = []  # Used to store available material streams for input connections
            self.updated_output_operators = []  # Used to store available material streams for output connections
            self.flash_spec = []  # Used to store flash specifications properties
            self.c = []  # Reference for properties popup
            self.compound_amounts_molar_frac_mix = []  # Contains all the compounds molar fractions
            self.compound_amounts_mass_frac_mix = []  # Contains all the compounds mass fractions
            self.compound_amounts_molar_flow_mix = []
            self.compound_amounts_mass_flow_mix = []
            self.compound_amounts_molar_frac_vap = []  # Contains all the compounds molar fractions
            self.compound_amounts_mass_frac_vap = []  # Contains all the compounds mass fractions
            self.compound_amounts_molar_flow_vap = []
            self.compound_amounts_mass_flow_vap = []

            self.compound_input_molar = []  # Contains all text-input objects for compound molar fraction
            self.compound_input_mass = []  # Contains all text-input objects for compound mass fraction
            self.current_spec = 0  # Defines current specification
            self.current_comp_spec = 0
            self.PhasePropertyMix = {}
            self.PhasePropertyVap = {}
            self.PhaseMixVal = []
            self.PhaseVapVal = []
            self.PhaseMixInput = []
            self.PhaseVapInput = []
            self.compound_spec_prop = []
            self.comp_prop_sph_value = []
            self.comp_prop_meh_value = []
            self.comp_prop_met_value = []
            self.comp_enable = []
            self.prop_enable = []
            self.comp_prop = ["Molar Specific Heat", "Molar Enthalpy", "Molar Entropy"]
            self.status = 0
            self.popup_check = 0
            self.input_prop_unit = []
            self.PhasePropertyMixUnit = []
            self.PhasePropertyVapUnit = []



        def on_multi_touch(self, instance, value):
            """
                Called when double_tapped a Unit Operation. Creates a Popup and opens it.
            """
            self.c = c1PopUp()
            if self.check_stm == 0:
                self.c = c2PopUp()
            self.PropertyObj = []
            self.PropInput = []
            self.DropDownsInput = []
            self.MainButtonInput = []
            self.DropDownsOutput = []
            self.MainButtonOutput = []
            self.c.ids.name_label.text_size = self.c.ids.name.size
            self.bef_name = self.name
            self.c.ids.name.text = self.name
            self.name_ob = self.c.ids.name
            i=0
            self.updated_input_operators = []
            self.updated_output_operators = []

            self.popup_check = 1


            if self.check_stm == 0:
                if self.status == 0:
                    self.c.ids.status.text = "Not Calculated"
                    self.c.ids.status.color = (0.6, 0, 0, 1)
                else:
                    self.c.ids.status.text = "Calculated"
                    self.c.ids.status.color = (0, 0.5, 0, 1)
                self.PropLabelStreams = []
                for Property in self.PropertyList:
                    checkbox = PropCheckBox(size_hint_x=None, width=25, id=str(i), spacing=5)
                    checkbox.bind(active=self.on_active)
                    if self.prop_enable[i] ==1:
                        checkbox.active = True
                    box = BoxLayout(size_hint_y=None, height=25)
                    self.PropLabelStreams.append(PropInputLabel(text=Property))
                    box.add_widget(checkbox)
                    box.add_widget(self.PropLabelStreams[i])
                    self.c.ids.first_tab.add_widget(box)
                    units = PropInputLabel(text=self.input_prop_unit[i], size_hint_x=0.25, color=(0,0,0,1),font_size =11)
                    box2 = BoxLayout(size_hint_y=None, height=25, spacing=5)
                    self.PropInput.append(TextInput(text=str(self.PropertyVal[i]), size_hint_y=None, height=25, valign='middle',font_size=12, multiline=False))
                    self.PropertyObj.append(self.PropInput[i])
                    box2.add_widget(self.PropInput[i])
                    box2.add_widget(units)
                    self.c.ids.first_tab.add_widget(box2)
                    i += 1
                i = 0

                count = 0
                self.compound_input_molar = []
                self.compound_input_mass = []
                for comp in self.compound_elements:
                    # self.c.ids.compound_col_1.add_widget(Label(text=comp,size_hint_x=1, size_hint_y=None, font_size=12,size=(0, 20)))
                    # self.c.ids.compound_col_2.add_widget(TextInput(text="1.0000", size_hint_y=None, font_size=8, size=(0, 20)))
                    if count >= len(self.compound_amounts_molar_frac_mix):
                        self.compound_amounts_molar_frac_mix.append('0')
                        self.compound_amounts_mass_frac_mix.append('0')
                        self.compound_amounts_mass_flow_mix.append('0')
                        self.compound_amounts_molar_flow_mix.append('0')
                        self.compound_amounts_molar_frac_vap.append('0')
                        self.compound_amounts_mass_frac_vap.append('0')
                        self.compound_amounts_mass_flow_vap.append('0')
                        self.compound_amounts_molar_flow_vap.append('0')
                        self.comp_prop_sph_value.append('0')
                        self.comp_prop_meh_value.append('0')
                        self.comp_enable.append(0)
                        self.comp_prop_met_value.append('0')
                    self.c.ids.composition_compound.add_widget(PropInputLabel(text=comp))
                    self.compound_input_molar.append(PropInputTextInput(text=self.compound_amounts_molar_frac_mix[count]))
                    self.compound_input_mass.append(PropInputTextInput(text=self.compound_amounts_mass_frac_mix[count]))
                    self.c.ids.composition_amount.add_widget(self.compound_input_molar[count])
                    count += 1
                    i += 1
                count =0
                self.c.ids.comp_spec_prop.bind(on_press=self.show_compound_spec_prop)

                for comp in self.compound_elements:
                    self.c.ids.compound_prop_label_mix.add_widget(PropInputLabel(text=comp))
                    self.c.ids.compound_prop_input_mix.add_widget(
                        PropInputTextInput(text=self.compound_amounts_molar_frac_mix[count], readonly=True))
                    self.c.ids.compound_prop_label_vap.add_widget(PropInputLabel(text=comp))
                    self.c.ids.compound_prop_input_vap.add_widget(
                        PropInputTextInput(text=self.compound_amounts_molar_frac_vap[count], readonly=True))
                    count += 1
                self.c.ids.comp_prop.bind(on_press=self.show_compound_prop)
                count = 0
                for comp in self.compound_elements:
                    self.c.ids.comp_prop_label.add_widget(PropInputLabel(text=comp))
                    self.c.ids.comp_prop_input.add_widget(
                        PropInputTextInput(text=self.comp_prop_sph_value[count], readonly=True))
                    count += 1

                self.c.ids.PhaseLabelMix.clear_widgets()
                self.c.ids.PhaseLabelVap.clear_widgets()
                label = self.c.ids.PhaseLabelMix
                text_input = self.c.ids.PhaseInputMix
                unit = self.c.ids.PhaseUnitMix
                k = 0
                self.PhaseMixInput = []
                for i in self.PhasePropertyMix:
                    label.add_widget(PropInputLabel(text=i))
                    self.PhaseMixInput.append(PropInputTextInput(text=self.PhaseMixVal[k], readonly=True))
                    text_input.add_widget(self.PhaseMixInput[k])
                    unit.add_widget(PropInputLabel(text=self.PhasePropertyMixUnit[k], padding=(8,0),font_size = 11))
                    k += 1

                label = self.c.ids.PhaseLabelVap
                text_input = self.c.ids.PhaseInputVap
                unit = self.c.ids.PhaseUnitVap
                self.PhaseVapInput = []
                k = 0
                for i in self.PhasePropertyVap:
                    label.add_widget(PropInputLabel(text=i))
                    self.PhaseVapInput.append(PropInputTextInput(text=self.PhaseVapVal[k], readonly=True))
                    text_input.add_widget(self.PhaseVapInput[k])
                    unit.add_widget(PropInputLabel(text=self.PhasePropertyVapUnit[k], padding=(8,0),font_size = 11))
                    k += 1


            i=0
            for Property in self.PropertyListInput:
                PropLabel = PropInputLabel(text=Property)
                self.c.ids.first_tab.add_widget(PropLabel)
                if self.check_stm != 0:
                    self.MainButtonInput.append(Select_Button(text='None', size_hint_y=None, height=25))
                    if self.input_streams[i + 1]:
                        self.MainButtonInput[len(self.MainButtonInput)-1].text = self.input_streams[i+1].name
                    self.DropDownsInput.append(dDown(DrNumber=i))
                    self.MainButtonInput[i].bind(on_release=self.generate_dp_input)
                    self.DropDownsInput[i].bind(on_select=lambda instance, x: setattr(self.MainButtonInput[instance.DrNumber], 'text', x))
                    self.c.ids.first_tab.add_widget(self.MainButtonInput[i])
                i = i+1
            self.c.ids.first_tab.add_widget(Label(text="", size_hint_y=None,  height=25))
            self.c.ids.first_tab.add_widget(Label(text="", size_hint_y=None,height=25))
            i = 0
            for Property in self.PropertyListOutput:
                PropLabel = PropInputLabel(text=Property)
                self.c.ids.first_tab.add_widget(PropLabel)
                if self.check_stm != 0:
                    self.MainButtonOutput.append(Select_Button(text='None', size_hint_y=None, height=25))
                    if self.output_streams[i + 1]:
                        self.MainButtonOutput[len(self.MainButtonOutput) - 1].text = self.output_streams[i + 1].name
                    self.DropDownsOutput.append(dDown(DrNumber=i,auto_dismiss=True))
                    self.MainButtonOutput[i].bind(on_release=self.generate_dp_output)
                    self.DropDownsOutput[i].bind(on_select=lambda instance, x: setattr(self.MainButtonOutput[instance.DrNumber], 'text', x))
                    self.c.ids.first_tab.add_widget(self.MainButtonOutput[i])
                i = i + 1

            i=0
            for Property in self.CalculationMethodList:
                PropLabel = PropInputLabel(text=Property)
                self.c.ids.second_tab.add_widget(PropLabel)
                if self.check_stm != 0 and Property != 'Value' :
                    self.MainButtonCalc.append(Select_Button(text='None', size_hint_y=None, height=25))
                    self.DropDownsCalc.append(dDown(DrNumber=i,auto_dismiss=True))
                    self.MainButtonCalc[i].bind(on_release=self.generate_calc_output)
                    self.DropDownsCalc[i].bind(on_select=lambda instance, x: setattr(self.MainButtonCalc[instance.DrNumber], 'text', x))
                    self.c.ids.second_tab.add_widget(self.MainButtonCalc[i])

                if Property == 'Value':
                    self.CalcMethVal = TextInput()
                    self.c.ids.second_tab.add_widget(self.CalcMethVal)


                i = i + 1




            self.c.ids.submit.bind(on_press=self.on_submit)
            if self.check_stm == 0:
                self.c.ids.compound_spec.bind(on_press=self.show_compound_spec)
            for operator in self.Operators:
                if not operator.output_streams[1]:
                    self.updated_input_operators.append(operator)
                else:
                    for k in self.MainButtonInput:
                        if operator.name == k.text:
                            self.updated_input_operators.append(operator)

            for operator in self.Operators:
                if not operator.input_streams[1]:
                    self.updated_output_operators.append(operator)
                else:
                    for k in self.MainButtonOutput:
                        if operator.name == k.text:
                            self.updated_output_operators.append(operator)

            self.c.open()

        def on_active(self,instance,value):
            if value:
                self.prop_enable[int(instance.id)] = 1
            else:
                self.prop_enable[int(instance.id)] = 0




        def show_compound_spec(self, instance):
            """
                Called to show compound specification. Triggers a drop-down to select.
            """
            dr = DropDown()
            dr.bind(on_select=self.select_compound_spec)
            for i in self.compound_spec:
                btn = butt(text=i, size_hint_y=None, height=25, background_normal='',
                           background_color=(0.4, 0.4, 0.4, 1), font_size=12)
                btn.bind(on_release=lambda btn: dr.select(btn.text))
                dr.add_widget(btn)
            dr.open(instance)


        def select_compound_spec(self, instance, text):
            """
                Called when a compound specification is selected.
            """
            self.c.ids.compound_spec.text = text
            self.c.ids.composition_amount.clear_widgets()
            i=0
            while i < len(self.compound_input_molar):
                if text == "Molar Fractions":
                    self.c.ids.composition_amount.add_widget(self.compound_input_molar[i])
                    self.current_comp_spec = 0
                else:
                    self.c.ids.composition_amount.add_widget(self.compound_input_mass[i])
                    self.current_comp_spec = 1
                i += 1

        def show_compound_prop(self, instance):
            """
                Called to show compound specification. Triggers a drop-down to select.
            """
            dr = DropDown()
            dr.bind(on_select=self.select_compound_prop)
            for i in self.comp_prop:
                btn = butt(text=i, size_hint_y=None, height=25, background_normal='',
                           background_color=(0.4, 0.4, 0.4, 1), font_size=12)
                btn.bind(on_release=lambda btn: dr.select(btn.text))
                dr.add_widget(btn)
            dr.open(instance)

        def select_compound_prop(self, instance, text):
            """
                Called when a compound specification is selected.
            """
            self.c.ids.comp_prop.text = text
            self.c.ids.comp_prop_input.clear_widgets()
            i = 0
            self.comp_prop = ["Molar Specific Heat", "Molar Enthalpy", "Molar Entropy"]
            while i < len(self.compound_amounts_mass_frac_mix):
                if text == "Molar Specific Heat":
                    self.c.ids.comp_prop_input.add_widget(PropInputTextInput(text=self.comp_prop_sph_value[i], readonly=True))
                elif text == "Molar Enthalpy":
                    self.c.ids.comp_prop_input.add_widget(PropInputTextInput(text=self.comp_prop_meh_value[i], readonly=True))
                elif text == "Molar Entropy":
                    self.c.ids.comp_prop_input.add_widget(PropInputTextInput(text=self.comp_prop_met_value[i], readonly=True))
                i += 1

        def show_compound_spec_prop(self, instance):
            """
                Called to show compound specification. Triggers a drop-down to select.
            """
            dr = DropDown()
            dr.bind(on_select=self.select_compound_spec_prop)
            for i in self.compound_spec_prop:
                btn = butt(text=i, size_hint_y=None, height=25, background_normal='',
                           background_color=(0.4, 0.4, 0.4, 1), font_size=12)
                btn.bind(on_release=lambda btn: dr.select(btn.text))
                dr.add_widget(btn)
            dr.open(instance)

        def select_compound_spec_prop(self, instance, text):
            """
                Called when a compound specification is selected.
            """

            self.c.ids.compound_prop_input_mix.clear_widgets()
            self.c.ids.compound_prop_input_vap.clear_widgets()
            self.c.ids.comp_spec_prop.text = text
            i = 0
            while i < len(self.compound_amounts_molar_frac_mix):
                if text == "Molar Fractions":
                    self.c.ids.compound_prop_input_mix.add_widget(
                        PropInputTextInput(text=self.compound_amounts_molar_frac_mix[i], readonly=True))
                    self.c.ids.compound_prop_input_vap.add_widget(
                        PropInputTextInput(text=self.compound_amounts_molar_frac_vap[i], readonly=True))
                elif text == "Mass Fractions":
                    self.c.ids.compound_prop_input_mix.add_widget(
                        PropInputTextInput(text=self.compound_amounts_mass_frac_mix[i], readonly=True))
                    self.c.ids.compound_prop_input_vap.add_widget(
                        PropInputTextInput(text=self.compound_amounts_mass_frac_vap[i], readonly=True))
                elif text == "Molar Flow":
                    self.c.ids.compound_prop_input_mix.add_widget(
                        PropInputTextInput(text=self.compound_amounts_molar_flow_mix[i], readonly=True))
                    self.c.ids.compound_prop_input_vap.add_widget(
                        PropInputTextInput(text=self.compound_amounts_molar_flow_vap[i], readonly=True))
                elif text == "Mass Flow":
                    self.c.ids.compound_prop_input_mix.add_widget(
                        PropInputTextInput(text=self.compound_amounts_mass_flow_mix[i], readonly=True))
                    self.c.ids.compound_prop_input_vap.add_widget(
                        PropInputTextInput(text=self.compound_amounts_mass_flow_vap[i], readonly=True))
                i += 1

        def generate_calc_output(self,instance):
            i = self.MainButtonCalc.index(instance)
            self.DropDownsCalc[i].clear_widgets()
            if instance.text != 'None':
                btn = butt(text='None', size_hint_y=None, height=25, DrNumber=i, background_normal='',
                           background_color=(0.4, 0.4, 0.4, 1))
                btn.bind(on_release=lambda btn: self.DropDownsCalc[btn.DrNumber].select(btn.text))
                self.DropDownsCalc[i].add_widget(btn)
            for method in self.CalculationMethods:
                btn = butt(text=method, size_hint_y=None, height=25, DrNumber=i, background_normal='',
                               background_color=(0.4, 0.4, 0.4, 1))
                btn.bind(on_release=lambda btn: self.DropDownsCalc[btn.DrNumber].select(btn.text))
                self.DropDownsCalc[i].add_widget(btn)
            self.DropDownsCalc[i].bind(on_select=lambda instance, x: setattr(self.MainButtonCalc[instance.DrNumber],'text', x))
            self.DropDownsCalc[i].open(instance)

        def generate_dp_input(self,instance):
            """
                Used to generate input connections drop-down with available material streams.
            """
            i = self.MainButtonInput.index(instance)
            self.DropDownsInput[i].clear_widgets()
            if instance.text != 'None':
                btn = butt(text='None', size_hint_y=None, height=25, DrNumber=i, background_normal='',
                           background_color=(0.4, 0.4, 0.4, 1))
                btn.bind(on_release=lambda btn: self.DropDownsInput[btn.DrNumber].select(btn.text))
                self.DropDownsInput[i].add_widget(btn)
            for item in self.updated_input_operators:
                insert = True
                for button in self.MainButtonInput:
                    if item.name == button.text:
                        insert = False
                if insert:
                    btn = butt(text=item.name, size_hint_y=None, height=25, DrNumber=i, background_normal='',
                               background_color=(0.4, 0.4, 0.4, 1))
                    btn.bind(on_release=lambda btn: self.DropDownsInput[btn.DrNumber].select(btn.text))
                    self.DropDownsInput[i].add_widget(btn)
            # self.MainButtonInput[i].bind(on_release=self.DropDownsInput[i].open)
            self.DropDownsInput[i].bind(on_select=lambda instance, x: setattr(self.MainButtonInput[instance.DrNumber],
                                                                               'text', x))
            self.DropDownsInput[i].open(instance)


        def generate_dp_output(self, instance):
            """
                Used to generate output connections drop-down with available material streams.
            """

            i = self.MainButtonOutput.index(instance)
            self.DropDownsOutput[i].clear_widgets()
            if instance.text != 'None':
                btn = butt(text='None', size_hint_y=None, height=25, DrNumber=i, background_normal='',
                       background_color=(0.4, 0.4, 0.4, 1))
                btn.bind(on_release=lambda btn: self.DropDownsOutput[btn.DrNumber].select(btn.text))
                self.DropDownsOutput[i].add_widget(btn)
            for item in self.updated_output_operators:
                insert = True
                for button in self.MainButtonOutput:
                    if item.name == button.text:
                        insert = False
                if insert:
                    btn = butt(text=item.name, size_hint_y=None, height=25, DrNumber=i, background_normal='',
                               background_color=(0.4, 0.4, 0.4, 1))
                    btn.bind(on_release=lambda btn: self.DropDownsOutput[btn.DrNumber].select(btn.text))
                    self.DropDownsOutput[i].add_widget(btn)
            # self.MainButtonInput[i].bind(on_release=self.DropDownsInput[i].open)
            self.DropDownsOutput[i].bind(on_select=lambda instance, x: setattr(self.MainButtonOutput[instance.DrNumber],
                                                                              'text', x))
            self.DropDownsOutput[i].open(instance)


        def on_submit(self, instance):
            """
                Triggered after submitting a properties popup
            """
            self.PropertyVal = []
            self.PropertyObj = self.PropInput
            self.name = self.name_ob.text
            UnitOP.UnitOP.drop_connections[self.name] = UnitOP.UnitOP.drop_connections[self.bef_name]
            for Property in self.PropertyObj:
                self.PropertyVal.append(Property.text)
            # if self.connected == False:
            self.connect += 1
