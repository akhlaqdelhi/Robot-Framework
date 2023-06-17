*** Test Cases ***
Test cases printing logs
    #  This mesage will be printed at command line
    Log To Console    Hello word @ console output
    # this is goig to be in log file
    Log  Hellow word in Report log files
    # belo line will print meltiile messages
    Log Many    Message-One     Message-Two   Message-threee

Test Case: Tags and Documents
    [Documentation]    This section contains a brief description of Tescases
    ...  this is cotinutaion of Documnentaion section usefull for multiple line description
    [Tags]    Sanity_testing    TC001
    Log To Console    this testcase contains uses of [Documentation] and [Tags]

