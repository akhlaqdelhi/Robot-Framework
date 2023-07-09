*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Resource    ../../Resources/GlobalKeywords.resource

*** Variables ***
${portal_url}       https://www.naukri.com/
${el_last_update}     //div[@class='user-details-inner fixed']/div[@class='other-info-wrapper']/p
${profile_url}     https://www.naukri.com/mnjuser/homepage
${el_btn_login}     id:login_Layer
${el_txt_username}     xpath://form[@name='login-form']/div[@class='form-row']/input[@placeholder='Enter your active Email ID / Username']
${el_txt_password}     xpath://form[@name='login-form']/div[@class='form-row']/input[@placeholder='Enter your password']
${el_btn_submit_login}     xpath://form[@name='login-form']//button[@class='btn-primary loginButton']
${el_link_view_profile}     link:View profile
${el_image_profile}     xpath://div[@class='img-wrapper col s2 center']/div[@class='photoTrigger']/img
#${file_path_resume}     C:\\Users\\akhlaq.ahmed\\OneDrive\\Desktop\\Resume-Akhlaq_Ahmed.docx
${file_path_resume}     C:\\Users\\Lenovo\\OneDrive\\Desktop\\Resume-Akhlaq_Ahmed.docx

*** Keywords ***
login_to_job_portal
    Create Webdriver    Chrome
    Maximize Browser Window
    Go To    ${portal_url}
    Wait Until Element Is Enabled        ${el_btn_login}
    Click Element    ${el_btn_login}
    Wait Until Element Is Enabled        ${el_txt_username}
    ${nk_username}      Get_field_from_config      nk_username
    ${nk_password}      Get_field_from_config       nk_password
    Sleep    2s
    Input Text    ${el_txt_username}        ${nk_username}[0]
    Input Password    ${el_txt_password}        ${nk_password}[0]
    Click Button    ${el_btn_submit_login}
    Wait Until Element Is Enabled       ${el_link_view_profile}
    Element Should Be Enabled    ${el_link_view_profile}
    Capture Element Screenshot      ${el_link_view_profile}     filename=EMBED


navigate_edit_profile
    Click Element    ${el_link_view_profile}
    Wait Until Element Is Visible    ${el_image_profile}
    Element Should Be Visible    ${el_image_profile}
    Capture Page Screenshot     filename=ScreenShot_edit_prfile_{index}.png

update_profile_and_resume
    Choose File     id:attachCV     ${file_path_resume}
    Sleep    3s


Verify_profiled_successfully
    Reload Page
    ${curr_date}        Get Current Date    time_zone=local  result_format=%b %d, %Y
    Wait Until Element Is Visible    xpath://div[@class='attachCV']//div[@class='cvPreview']//div[@class='updateOn typ-14Regular']
    Element Text Should Be    xpath://div[@class='attachCV']//div[@class='cvPreview']//div[@class='updateOn typ-14Regular']     Uploaded on ${curr_date}
    Capture Page Screenshot     filename=ScreenShot_edit_prfile_{index}.png



