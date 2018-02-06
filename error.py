from kivy.app import App
from kivy.clock import Clock
from kivy.uix.widget import Widget
from kivy.uix.button import Button
from kivy.uix.boxlayout import BoxLayout
from kivy.properties import ListProperty
from kivy.properties import NumericProperty
from kivy.graphics.vertex_instructions import Rectangle
from kivy.graphics.vertex_instructions import Line
from kivy.uix.bubble import Bubble,BubbleButton
from kivy.uix.popup import Popup
from kivy.uix.modalview import ModalView
from functools import partial
from kivy.properties import ObjectProperty
from kivy.uix.scrollview import ScrollView
from kivy.uix.slider import Slider
from kivy.uix.gridlayout import GridLayout
from kivy.uix.stacklayout import StackLayout
from kivy.uix.label import Label
from kivy.uix.textinput import TextInput
from kivy.uix.floatlayout import FloatLayout
from kivy.graphics.context_instructions import Color
from kivy.graphics.instructions import InstructionGroup
from kivy.uix.actionbar import ActionBar
from kivy.uix.actionbar import ActionView
from kivy.uix.actionbar import ActionButton
from kivy.uix.actionbar import ActionPrevious
from kivy.uix.dropdown import DropDown
from kivy.uix.progressbar import ProgressBar
from kivy.lang import Builder
from kivy.lang import Builder
from textwrap import dedent
from kivy.garden.graph import Graph, MeshLinePlot
from math import sin
import os
import random
import StaticUO
from OMPython import OMCSession
import UnitOP
Builder.load_file('error.kv')

class Error(ModalView):
    pass