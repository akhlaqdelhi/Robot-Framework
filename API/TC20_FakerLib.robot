*** Settings ***
Library         FakerLibrary        locale=en_IN    seed=1001

*** Test Cases ***
call a keyword
    [Tags]    tag101
    keyword_all
#    keyword_all      abc       xyz
    error here

*** Keywords ***
keyword_all
    [Arguments]    ${val1}=default      ${val2}=somevaue
    Log Many        ${val1}      ${val2}
    IF    "${val1}"=="default"
        ${name}  FakerLibrary.Name
        ${firstName}  FakerLibrary.FirstName
        ${firstName}  FakerLibrary.FirstName
        ${lasttName}  FakerLibrary.LastName
        ${email}      FakerLibrary.Email
        ${mobile}     FakerLibrary.PhoneNumber
        ${address}    FakerLibrary.Address
        ${landmark}    FakerLibrary.City
        ${Boolean}    FakerLibrary.Boolean
        ${BuildingNumber}    FakerLibrary.BuildingNumber
        ${ColorName}    FakerLibrary.ColorName
        ${Company}    FakerLibrary.Company
        ${Date}    FakerLibrary.Date
#        ${DateOfBirth}    FakerLibrary.DateOfBirth      minimum_age=${23}    maximum_age=${95}
        ${DateOfBirth}    FakerLibrary.DateOfBirth      None  ${23}    ${95}
        ${companyIncoperationDate}    FakerLibrary.DateTimeBetween      start_date=-10y, end_date=-1y, tzinfo=None
        ${Paragraph}    FakerLibrary.Paragraph
        ${Password}    FakerLibrary.Password
        ${Sentence}    FakerLibrary.Sentence
    END
    Log Many   ${name}  ${firstName}  ${lasttName}  ${email}  ${address}  ${landmark}  ${mobile}  ${Boolean}  ${BuildingNumber}  ${ColorName}  ${Company}  ${Date}  ${DateOfBirth}  ${companyIncoperationDate}  ${Paragraph}  ${Password}  ${Sentence}
