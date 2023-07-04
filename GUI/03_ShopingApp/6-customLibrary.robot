*** Settings ***
Library   Libraries/CustomLibrary.py


*** Test Cases ***
TC_test customer lib
    [Tags]
    log  calling the lib
    helloword
