*** Settings ***
Resource    res_smsorganizer.resource


*** Test Cases ***
TC_read_message
    [Tags]    AP2201
    [Documentation]    this test cases will read an SMS from mobile app com.microsoft.android.smsorganizer
    Set Appium Timeout    10s
    open_sms_app
    ${OTP}  Get_OTP    bdZmBPxea15      #FaveOTP
#    ${OTP}  Get_OTP    random       #non existing/ SMS not received
    log  One time Password is== ${OTP}
    Log To Console    \n One time Password is== ${OTP}

#   TodoDone    Check if elemet id can be wothout Id == yes no need to mention it is id
#   TodoDone    Check if if appium start without base-path parameter == ys possible and working
