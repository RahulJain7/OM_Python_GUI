"""
    THIS IS THE MIXER UNIT OPERATION CLASS CHILD OF A UNITOP CLASS.
"""

import UnitOP


class Mixer(UnitOP.UnitOP):

    def __init__(self,**kwargs):
        """
            Initializes all the variables.
        """
        super(Mixer, self).__init__(**kwargs)
        self.type = 1  # Mixer is of type 1
        self.stream_count = [6, 1]  # Input and output number of streams
        self.input_streams = {1: None, 2: None, 3: None, 4: None, 5: None, 6: None}  # Contains all the input stream objects
        self.output_streams = {1: None}  # Contains all the output stream objects
        self.input_lines = {1: None, 2: None, 3: None, 4: None, 5: None, 6: None}  # Contains all the input line objects
        self.output_lines = {1: None}  # Contains all the output line objects
        self.size2 = (140, 150)  # Defines the wrapper size

        # Properties of the Button
        self.check_mixer = 0
        self.size_hint = (None, None)
        self.size = (130, 130)
        self.border = 0, 0, 0, 0
        self.background_normal = 'Images/mixer_operator.png'
        self.background_down = 'Images/mixer_operator.png'

        self.PropertyListInput = ['INPUT 1', 'INPUT 2', 'INPUT 3', 'INPUT 4', 'INPUT 5', 'INPUT 6']  # Input property list
        self.PropertyListOutput = ['OUTPUT']  # Output property list
        self.CalculationMethodList = ['Output Pressure']
        self.CalculationMethods = ['Avg Pressure','max pressure']
        self.upward_connector_input = []  # Upward input connector
        self.downward_connector_input = []  # Downward input connector
        self.upward_connector_output = []  # Upward output connector
        self.downward_connector_output = []  # Downward output connector
        self.Connecting_Points_Input = []  # Input connecting points
        self.Connecting_Points_Output = []  # Output connecting points
        self.OM_Model = 'Mixer'  # Model name

    def Update_Conn_Pnts(self):
        """
            Update connection points with present position of unit operation.
        """
        self.Connecting_Points_Input = [[self.x+40, self.y + 101], [self.x+40, self.y + 86], [self.x+40, self.y + 71], [self.x+40, self.y + 56],[self.x+40, self.y + 41], [self.x+40, self.y + 26]]
        self.Connecting_Points_Output = [[self.x + 100, self.y + 66]]
        self.upward_connector_input = [self.x+20, self.y + 130]
        self.downward_connector_input = [self.x+20, self.y -10]
        self.upward_connector_output = [self.x + 120, self.y + 130]
        self.downward_connector_output = [self.x + 120, self.y - 10]

    def on_submit(self, instance):
        """
            Triggered when properties popup is submitted.
        """
        self.InputStrNames = []
        self.OutputStrNames = ''
        self.Connecting_Points_Input = [[self.x+40, self.y + 101], [self.x+40, self.y + 86], [self.x+40, self.y + 71], [self.x+40, self.y + 56], [self.x+40, self.y + 41], [self.x+40, self.y + 26]]
        self.Connecting_Points_Output = [[self.x + 100, self.y + 66]]
        self.upward_connector_input = [self.x + 20, self.y + 130]
        self.downward_connector_input = [self.x + 20, self.y - 3]
        self.upward_connector_output = [self.x + 120, self.y + 130]
        self.downward_connector_output = [self.x + 120, self.y - 10]
        self.name = self.name_ob.text
        self.text_label.text = self.name
        UnitOP.UnitOP.drop_connections[self.name] = UnitOP.UnitOP.drop_connections[self.bef_name]
        val = 1
        for key in self.input_streams:
            if self.input_streams[key]:
                self.input_streams[key].output_streams[1] = None
                self.input_streams[key].output_lines[1] = None
                self.input_streams[key] = None
        for key in self.output_streams:
            if self.output_streams[key]:
                self.output_streams[key].input_streams[1] = None
                self.output_streams[key].input_lines[1] = None
                self.output_streams[key] = None
        for Property in self.MainButtonInput:
            if Property.text != 'None':
                self.input_streams[val] = self.all_operators[self.drop_connections[Property.text]]
                self.InputStrNames.append(Property.text)
            val += 1

        val = 1
        for Property in self.MainButtonOutput:
            if Property.text != 'None':
                self.output_streams[val] = self.all_operators[self.drop_connections[Property.text]]
                self.OutputStrNames = Property.text
            val += 1

        self.connect += 1





