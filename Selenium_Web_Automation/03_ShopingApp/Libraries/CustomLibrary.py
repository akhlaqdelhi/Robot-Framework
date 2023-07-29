from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class CustomLibrary:

    def __int__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def helloword(self):
        print("Hello there!")

    @keyword
    def sample_selenium(self):
        var = self.selLib.create_webdriver(self, driver_name:"Firefox")