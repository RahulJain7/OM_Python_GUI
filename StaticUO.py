"""
    THIS ARE THE BUTTONS PRESENT ON THE UNIT OPERATIONS SHELF
"""
from kivy.uix.button import Button
from kivy.properties import NumericProperty
from UnitOP import UnitOP
from Mixer import Mixer
from MatStrm import Stream
from Flash import Flash
from Splitter import Splitter
from Valve import Valve


class SMixer(Button):
    """
        Mixer button for the unit operations shelf
    """

    included = NumericProperty(0)
    UO = Mixer

    def __init__(self, **kwargs):
        super(SMixer, self).__init__(**kwargs)
        self.size_hint = None, None
        self.width = 150
        self.height = 103
        self.background_normal = 'Images/mixer_new.png'
        self.background_down = 'Images/mixer_new.png'


class SMatStrm(Button):
    """
        Material stream button for the unit operations shelf
    """
    included = NumericProperty(0)
    UO = Stream

    def __init__(self, **kwargs):
        super(SMatStrm, self).__init__(**kwargs)
        self.size_hint = None, None
        self.width = 150
        self.height = 90

        self.background_normal = 'Images/mat_strm_new.png'
        self.background_down = 'Images/mat_strm_new.png'


class SFlash(Button):
    """
        Flash button for the unit operations shelf
    """
    included = NumericProperty(0)
    UO = Flash

    def __init__(self, **kwargs):
        super(SFlash, self).__init__(**kwargs)
        self.width = 150
        self.height = 103
        self.size_hint = None, None
        self.background_normal = 'Images/flash_new.png'
        self.background_down = 'Images/flash_new.png'


class SSplitter(Button):
    """
        Splitter button for the unit operations shelf
    """
    included = NumericProperty(0)
    UO = Splitter

    def __init__(self, **kwargs):
        super(SSplitter, self).__init__(**kwargs)
        self.width = 150
        self.height = 130
        self.size_hint = None, None
        self.background_normal = 'Images/splitter_new.png'
        self.background_down = 'Images/splitter_new.png'

class SValve(Button):
    """
        Valve Button for the unit operations shelf
    """
    included = NumericProperty(0)
    UO = Valve

    def __init__(self, **kwargs):
        super(SValve, self).__init__(**kwargs)
        self.width = 150
        self.height = 130
        self.size_hint = None, None
        self.background_normal = 'Images/valve_new.png'
        self.background_down = 'Images/valve_new.png'

