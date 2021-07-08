from ctypes import *
  
lib = cdll.LoadLibrary('./build/helloWorld.so')
lib.returnMessage.argtypes = [c_char_p]
  
class HelloWorld(object):
    def __init__(self):
        self.obj = lib.helloWorld()
    
    def createBufferString(self, string):
        buf = create_string_buffer(128)
        buf.value = bytes(string, "utf-8")
        return buf

    def displayMessage(self, text):
        lib.displayMessage(self.obj, text)
    
    def returnMessage(self, buf):
        lib.returnMessage(buf)
  
helloWorld = HelloWorld()
helloWorld.displayMessage(bytes("Hello Python", "utf-8"))

text = helloWorld.createBufferString("When Python")
helloWorld.returnMessage(text)
print(text.value.decode("utf-8"))