from ctypes import cdll
  
lib = cdll.LoadLibrary('./build/helloWorld.so')
  
class HelloWorld(object):
    def __init__(self):
        self.obj = lib.helloWorld()
    def classFunction(self, text):
        lib.helloWorld_classFunction(self.obj, text)
  
helloWorld = HelloWorld()
helloWorld.classFunction(bytes("Hello Python", "utf-8"))
sum = lib.sum(5,5)
print(sum)