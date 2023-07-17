*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***

@{num}=                    one    two    three
@{Name}=        Ahmed        Samad       Abdul
*** Test Cases ***

working with list <Set List Value>,<Log List>,<Get Length>
    [Tags]  TC0701
    Set List Value    ${Name}    -1    Khaliq   # to set a value at last index position
    Log To Console    {Name}= ${Name}
    Log List    ${Name}     #Log the length and show list item also
    ${len}=  Get Length    ${Name}
    Log to Console      length of {Name} list is ${len}

List things to do
    [Tags]      TC0702
    Append To List    ${num}  Four  Five        #Append the values at end
    Log To Console    Now {LIST} contains= ${num}

To do list
    [Tags]  TC0703
    @{numbers}      Create List
    Append To List  ${numbers}  six  seven
    Log To Console    {numbers}= ${numbers}
    List Should Not Contain Value    ${numbers}    ten
    # to check whether a value exist in List or not
    ${idx1}=  Get Index From List    ${numbers}     sev
    IF  ${idx1}==-1
    Log To Console    Value not found in List variable
    ELSE
        log to console   THis value exist in List value
    END

