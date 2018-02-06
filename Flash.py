"""
    THIS IS THE FLASH UNIT OPERATION CLASS CHILD OF A UNITOP CLASS.
"""
import UnitOP


class Flash(UnitOP.UnitOP):


    def __init__(self,**kwargs):
        """
            Initializes all the variables
        """
        super(Flash, self).__init__(**kwargs)
        self.type = 2  # Flash type 2
        self.stream_count = [2, 2]  # Number of input and output streams
        self.input_lines = {1: None, 2: None}  # Input stream objects
        self.output_lines = {1: None, 2: None}  # Output stream objects
        self.input_streams = {1: None, 2: None}  # Input line objects
        self.output_streams = {1: None, 2: None}  # output line objects
        self.size2 = (140, 175)  # Size of wrapper
        self.border = 0, 0, 0, 0

        # Properties of button
        self.size_hint = (None, None)
        self.size = (130, 151.6)
        self.background_normal = 'Images/flash_operator.png'
        self.background_down = 'Images/flash_operator.png'

        self.PropertyListInput = ['INPUT 1', 'INPUT 2']  # Input property list
        self.PropertyListOutput = ['OUTPUT 1', 'OUTPUT 2']  # Output property list
        self.Connecting_Points_Input = []  # Input connecting lines
        self.Connecting_Points_Output = []  # Output connecting lines
        self.upward_connector_input = []  # Upward input connecting line
        self.downward_connector_input = []  # Downward input connecting line
        self.upward_connector_output = []  # Upward output connecting line
        self.downward_connector_output = []  # Downward output connecting line
        self.OM_Model = 'Flash'  # Model name


    def Update_Conn_Pnts(self):
        """
            Update connection points with present position of unit operation.
        """
        self.Connecting_Points_Input = [[self.x+40, self.y+110],[self.x+40,self.y+44]]
        self.Connecting_Points_Output = [ [self.x+90, self.y+110],[self.x+90, self.y+44]]
        self.upward_connector_input = [self.x+20,self.y + 150]
        self.downward_connector_input = [self.x+20,self.y]
        self.upward_connector_output = [self.x+110, self.y + 150]
        self.downward_connector_output = [self.x+110, self.y]


    def on_submit(self, instance):
        """
            Triggered when properties popup is submitted.
        """
        self.Connecting_Points_Input = [[self.x+40, self.y + 110], [self.x+40, self.y + 44]]
        self.Connecting_Points_Output = [[self.x + 90, self.y + 110], [self.x+90, self.y + 44]]
        self.upward_connector_input = [self.x + 20, self.y + 150]
        self.downward_connector_input = [self.x + 20,self.y]
        self.upward_connector_output = [self.x + 110, self.y + 150]
        self.downward_connector_output = [self.x + 110,self.y]

        self.name = self.name_ob.text
        self.text_label.text = self.name
        UnitOP.UnitOP.drop_connections[self.name] = UnitOP.UnitOP.drop_connections[self.bef_name]
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
        val = 1
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






