*** Settings ***
Library    Selenium2Library
Suite Teardown    Close All Browsers

*** Variables ***
${url}    https://login.optimyapp.com/
${LOGIN_FORM}   css=div#tab-login
${LOGIN_EMAIL_INPUT_FIELD}    css=div#tab-login > form > div:nth-of-type(1) > input
${LOGIN_PASSWORD_INPUT_FIELD}    css=div#tab-login > form > div:nth-of-type(2) > input
${LOGIN_BUTTON}    css=div#tab-login > form > button

${EMAIL_EMPTY_INPUT_ERROR}    css=div#tab-login > form > div > span
${PASSWORD_EMPTY_INPUT_ERROR}    css=div#tab-login > form > div:nth-of-type(2) > span

${LOST_PASSWORD_BUTTON}    css=div#tab-login > form > a
${LOST_PASSWORD_ERROR_MESSAGE_CONTAINER}    css=div#tab-recovery-ask > form > div > span
${LOST_PASSWORD_CANCEL_BUTTON}    css=div#tab-recovery-ask > form > a

${LOCALHOST}    http://3.150.1.0/


*** Test Cases ***
Optimy Login Page
    Open Browser    ${url}    chrome
    Location Should Contain    ${url}
    Element Should Be Visible    ${LOGIN_FORM}
    Input Text    ${LOGIN_EMAIL_INPUT_FIELD}    ${EMPTY}
    Input Text    ${LOGIN_PASSWORD_INPUT_FIELD}    ${EMPTY}
    Click Element    ${LOGIN_BUTTON}
    Element Should Contain    ${EMAIL_EMPTY_INPUT_ERROR}    This field is required.
    Element Should Contain    ${PASSWORD_EMPTY_INPUT_ERROR}    This field is required.

*** Keywords ***



