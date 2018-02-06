"""
    THIS IS THE SPLITTER UNIT OPERATION CLASS CHILD OF A UNITOP CLASS.
"""
import UnitOP


class Splitter(UnitOP.UnitOP):


    def __init__(self,**kwargs):
        """
            Initializes all the variables.
        """
        super(Splitter, self).__init__(**kwargs)
        self.type = 3  # Splitter type 3
        self.stream_count = [1, 3]  # Input and output stream count
        self.input_streams = {1: None}  # Contains all the input stream objects
        self.output_streams = {1: None, 2: None, 3: None}  # Contains all the output stream objects
        self.input_lines = {1: None}  # Contains all the input line objects.
        self.output_lines = {1: None, 2: None, 3: None}  # Contains all the output line objects.
        self.size2 = (140, 150)  # Defines the size of Wrapper.

        # Properties of the button
        self.size_hint = (None, None)
        self.size = (130,130)
        self.background_normal = 'Images/splitter_operator.png'
        self.background_down = 'Images/splitter_operator.png'
        self.border = 0, 0, 0, 0

        self.PropertyListInput = ['INPUT 1']  # Input property list
        self.PropertyListOutput = ['OUTPUT 1', 'OUTPUT 2', 'OUTPUT 3']  # Output property list
        self.Connecting_Points_Input = []  # Input connecting points
        self.Connecting_Points_Output = []  # Output connecting points
        self.upward_connector_input = []  # Upward input connecting point
        self.downward_connector_input = []  # Downward input connecting point
        self.upward_connector_output = []  # Upward output connecting point
        self.downward_connector_output = []  # Downward output connecting point
        self.OM_Model = 'Splitter'  # Model name


    def Update_Conn_Pnts(self):
        """
            Update connection points with present position of unit operation.
        """
        self.Connecting_Points_Input = [[self.x+22, self.y + 65]]
        self.Connecting_Points_Output = [[self.x + 100, self.y + 108], [self.x + 100, self.y + 65] ,[self.x + 100, self.y + 24]]
        self.upward_connector_input = [self.x + 2, self.y + 130]
        self.downward_connector_input = [self.x + 2 ,self.y ]
        self.upward_connector_output = [self.x + 120, self.y + 130]
        self.downward_connector_output = [self.x + 120, self.y]


    def on_submit(self, instance):
        """
            Triggered when properties popup is submitted.
        """
        self.Connecting_Points_Input = [[self.x + 16, self.y + 65]]
        self.Connecting_Points_Output = [[self.x + 100, self.y + 108], [self.x + 100, self.y + 65],[self.x + 100, self.y + 24]]
        self.upward_connector_input = [self.x + 2, self.y + 130]
        self.downward_connector_input = [self.x + 2, self.y]
        self.upward_connector_output = [self.x + 120, self.y + 130]
        self.downward_connector_output = [self.x + 120, self.y]
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
            val += 1

        val = 1
        for Property in self.MainButtonOutput:
            if Property.text != 'None':
                self.output_streams[val] = self.all_operators[self.drop_connections[Property.text]]
            val += 1

        self.connect += 1
