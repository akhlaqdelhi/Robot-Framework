*** Settings ***
Library     JSONLibrary
Library     os
Library     Collections
Library     OperatingSystem

*** Variables ***
#${jsonfile}=    Load From Json File     C:\Users\akhlaq.ahmed\PycharmProjects\pythonAutomationProj\JSON\LeadSample.JSON
${mdrVal}       [{\"tenure\":30,\"rate\":{\"rateType\":1,\"rate\":1.2}},{\"tenure\":90,\"rate\":{\"rateType\":1,\"rate\":1.5}},{\"tenure\":120,\"rate\":{\"rateType\":1,\"rate\":1.8}},{\"tenure\":180,\"rate\":{\"rateType\":1,\"rate\":2.3}}]

*** Test Cases ***
Fetch value from json file
    [Tags]      TC0401

#    ${jsonfile}=    load json from file     ${EXECDIR}\\JSON\\LeadSample.json
    ${jsonfile}=    load json from file     D:\\Official\\gitLMS\\Nova_Automation\\LMS_Automation\\API\\WorkBench\\data\\crmleadRequest.json
    ${xRefId}=     Get Value From Json    ${jsonfile}      $.externalReferenceId
    #   log to console      ${externalReferenceId}
    log to console      ----------------------
    Log         DefaultjsonRequest= ${jsonfile}
    ${vasAcqNode}=    Create Dictionary  vasId=20456   isAggregator=true   quantity=1   settlementCycle=2
    ${jsonfile}=    Add Object To Json    ${jsonfile}    $.vasAcqMapping    ${vasAcqNode}
    Log         AfterAddingNode=${jsonfile}

     ${mdrVal}=    Set Variable     ${mdrVal}      [{\"tenure\":30,\"rate\":{\"rateType\":1,\"rate\":1.2}},{\"tenure\":90,\"rate\":{\"rateType\":1,\"rate\":1.5}},{\"tenure\":120,\"rate\":{\"rateType\":1,\"rate\":1.8}},{\"tenure\":180,\"rate\":{\"rateType\":1,\"rate\":2.3}}]
    Log         {mdrVal}= ${mdrVal}

Debug the code
      [Tags]      TC0402
#     ${mdrVal}=    Set Variable     ${mdrVal}      [{\"tenure\":30,\"rate\":{\"rateType\":1,\"rate\":1.2}},{\"tenure\":90,\"rate\":{\"rateType\":1,\"rate\":1.5}},{\"tenure\":120,\"rate\":{\"rateType\":1,\"rate\":1.8}},{\"tenure\":180,\"rate\":{\"rateType\":1,\"rate\":2.3}}]
#     ${mdrVal}=    Set Variable     ${mdrVal}      [{\"tenure\":30,\"rate\":{\"rateType\":1,\"rate\":1.2}},{\"tenure\":90,\"rate\":{\"rateType\":1,\"rate\":1.5}},{\"tenure\":120,\"rate\":{\"rateType\":1,\"rate\":1.8}},{\"tenure\":180,\"rate\":{\"rateType\":1,\"rate\":2.3}}]

#    ${mdrVal}=      Convert To String    ${mdrVal}
    Log         {mdrVal}= ${mdrVal}
