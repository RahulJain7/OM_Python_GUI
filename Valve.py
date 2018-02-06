"""
    THIS IS THE VALVE UNIT OPERATION CLASS CHILD OF A UNITOP CLASS.
"""
import UnitOP


class Valve(UnitOP.UnitOP):


    def __init__(self,**kwargs):
        """
            Initializes all the variables
        """
        super(Valve, self).__init__(**kwargs)
        self.type = 4  # valve type 4
        self.stream_count = [1, 1]  # Input and output streams count
        self.input_streams = {1: None}  # Input Stream objects
        self.output_streams = {1: None}  # Output stream objects
        self.input_lines = {1: None}  # Input line objects
        self.output_lines = {1: None}  # Output line objects
        self.size2 = (110, 80)  # Size of wrapper

        # Properties of Button
        self.check_valve = 0
        self.size_hint = (None, None)
        self.size =(90, 54)
        self.background_normal = 'Images/valve_operator.png'
        self.background_down = 'Images/valve_operator.png'
        self.border = 0, 0, 0, 0

        self.PropertyListInput = ['INPUT 1']  # Input property list
        self.PropertyListOutput = ['OUTPUT 1'] # Output property list
        self.CalculationMethodList = ['Pressure Spec','Value']
        self.CalculationMethods = ['Pressure Drop', 'Output Pressure']
        self.Connecting_Points_Input = []  # Input connecting points
        self.Connecting_Points_Output = []  # Output connecting points
        self.upward_connector_input = []  # Upward input connecting point
        self.downward_connector_input = []  # Downward input connecting point
        self.upward_connector_output = []  # Upward output connecting point
        self.downward_connector_output = []  # Downward output connecting point
        self.OM_Model = 'Valve'  # Model name
        self.CalcMethVal = ''
        self.CalcMethValNo = ''
        self.SelCalcParam = ''


    def Update_Conn_Pnts(self):
        """
            Update connection points with present position of unit operation.
        """
        self.Connecting_Points_Input = [[self.x + 10, self.y + 28]]
        self.Connecting_Points_Output = [[self.x + 80, self.y + 28]]
        self.upward_connector_input = [self.x, self.y+50]
        self.downward_connector_input = [self.x, self.y]
        self.upward_connector_output = [self.x + 90, self.y + 50]
        self.downward_connector_output = [self.x + 90, self.y]


    def on_submit(self, instance):
        """
            Triggered when properties popup is submitted.
        """
        self.CalcMethValNo = float(self.CalcMethVal.text)
        self.SelCalcParam = self.MainButtonCalc[0].text
        self.Connecting_Points_Input = [[self.x + 10, self.y + 28]]
        self.Connecting_Points_Output = [[self.x + 80, self.y + 28]]
        self.upward_connector_input = [self.x, self.y + 50]
        self.downward_connector_input = [self.x, self.y]
        self.upward_connector_output = [self.x + 90, self.y + 50]
        self.downward_connector_output = [self.x + 90, self.y]
        self.name = self.name_ob.text
        self.text_label.text = self.name
        # print self.CalcMethValNo
        # print self.MainButtonCalc[0].text
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





