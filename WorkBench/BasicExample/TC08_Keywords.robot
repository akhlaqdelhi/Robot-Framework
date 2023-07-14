*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***

@{num}=                    one    two    three
@{Name}=        Ahmed        Samad       Abdul

*** Keywords ***

Do welcome to visitors
    [Arguments]     ${name}
    Log To Console    Welcome guest= ${name}


*** Test Cases ***

Visitor Arrived at reception
    [Tags]      TC0801
    Log To Console    this is the reception of park
    Do welcome to visitors      Abdul Malik
