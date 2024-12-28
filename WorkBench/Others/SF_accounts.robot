*** Settings ***
Documentation     A Robot script with a single task for undefined
...               Created by Robot recorder"
Library           SeleniumLibrary    timeout=10
#Test Teardown     Close Browser
*** Variables ***
${BROWSER}    chrome
${SLEEP}    3

*** Test Cases ***
Create Account test
    [Tags]    account       salesforce      SF01
    Open Browser    https://pinelabs--qa.sandbox.my.salesforce.com/    ${BROWSER}
    Input Text    //input[@id='username']    akhlaq.ahmed@pinelabs.com.qa
    Input Text    //input[@name="pw"]    bismI10-1444
    Click Element    //input[@name="Login"]
    Sleep    5s
    Click Element    //svg[@class="slds-icon slds-icon-text-default slds-icon_xx-small"]
    Click Element    xpath=(//span)[44]
    Click Element    //span[@class="slds-radio--faux"]
    Click Element    xpath=(//span[@class=" label bBody"])[4]
    Input Text    //input[@name="Name"]    aq1 ahmed
    Click Element    xpath=(//slot)[8]
    Input Text    //input[@name="Legal_Name__c"]    Ahmed enterprizes
    Click Element    xpath=(//slot)[8]
    Click Element    //button[@id="combobox-button-192"]
    Click Element    xpath=(//span[@class="slds-media__body"])[3]
    Click Element    //button[@id="combobox-button-214"]
    Click Element    //lightning-base-combobox-item[@id="combobox-button-214-1-214"]
    Click Element    //button[@id="combobox-button-231"]
    Click Element    //lightning-base-combobox-item[@id="combobox-button-231-2-231"]
    Click Element    //button[@id="combobox-button-253"]
    Click Element    //span[@title="Non-Government Merchant"]
    Click Element    xpath=(//lightning-combobox[@class="slds-form-element slds-form-element_horizontal"])[9]
    Click Element    //button[@id="combobox-button-284"]
    Click Element    xpath=(//span[@class="slds-media__body"])[16]
    Input Text    //input[@name="Corporate_Email__c"]    akhlaq1-06@yahoo.com
    Click Element    xpath=(//div[@class="slds-form-element__control"])[8]
    Input Text    //input[@name="Address_Line_1__c"]    Address line 1 goes here
    Input Text    //input[@name="Address_Line_2__c"]    address lline 2 going here
    Click Element    xpath=(//slot)[91]
    Input Text    //input[@name="Landmark__c"]    new masjid badi wali
    Input Text    //input[@name="Pin_Code__c"]    110026
    Click Element    //button[@id="combobox-button-401"]
    Click Element    xpath=(//span[@class="slds-media__body"])[30]
    Input Text    //input[@id="combobox-input-576"]    delhi
    Click Element    xpath=(//strong)[2]
    Click Element    xpath=(//h3[@class="test-id__section-header-container slds-section__title slds-theme--shade"])[5]
    Input Text    //input[@name="No_of_Outlets__c"]    2
    Click Element    xpath=(//lightning-combobox[@class="slds-form-element slds-form-element_horizontal"])[14]
    Click Element    //button[@id="combobox-button-441"]
    Click Element    //span[@title="Limited Liability Partnership Firms"]
    Click Element    //button[@id="combobox-button-449"]
    Click Element    //span[@title="Residence"]
    Click Element    xpath=(//records-record-layout-item[@class="slds-form__item slds-no-space"])[72]
    Click Element    //button[@id="combobox-button-432"]
    Click Element    //span[@title="Rented"]
    Click Element    xpath=(//div[@class="test-id__section slds-m-vertical_none slds-section has-header slds-p-bottom_medium slds-is-open"])[5]
    Input Text    //input[@name="PAN_No__c"]    AQzaq1234Z
    Click Element    xpath=(//slot)[116]
    Select From List By Value    //select[@id="select-779"]    2004
    Click Element    xpath=(//span[@class="slds-day"])[2]
    Click Element    xpath=(//h3[@class="test-id__section-header-container slds-section__title slds-theme--shade"])[7]
    Click Element    //grammarly-mirror[@class="cGcvT"]
    Click Element    //grammarly-mirror[@class="cGcvT"]
    Input Text    //textarea[@id="input-538"]    test account using Robo script
    Click Element    //button[@name="SaveEdit"]
    Click Link    //a[@href="javascript:void(0)"]
    Input Text    //input[@name="PAN_No__c"]    AQASX1234X
    Click Element    xpath=(//span[@class="test-id__field-value slds-size_1-of-1"])[53]
    Click Element    //button[@name="SaveEdit"]