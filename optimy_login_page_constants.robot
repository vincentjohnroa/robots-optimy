*** Variables ***
${LOGIN_PAGE_URL}                           https://login.optimyapp.com/
${LOGIN_FORM}                               css=div#tab-login
${LOGIN_EMAIL_INPUT_FIELD}                  css=div#tab-login > form > div:nth-of-type(1) > input
${LOGIN_PASSWORD_INPUT_FIELD}               css=div#tab-login > form > div:nth-of-type(2) > input
${LOGIN_BUTTON}                             css=div#tab-login > form > button

${INVALID_CREDENTIALS_ERROR}                css=div#login-invalid
${EMAIL_INLINE_ERROR}                       css=div#tab-login > form > div > span
${PASSWORD_INLINE_ERROR}                    css=div#tab-login > form > div:nth-of-type(2) > span

${LOST_PASSWORD_BUTTON}                     css=div#tab-login > form > a
${RECOVERY_EMAIL_INPUT_FIELD}               css=div#tab-recovery-ask > form > div > input
${LOST_PASSWORD_INLINE_ERROR}               css=div#tab-recovery-ask > form > div > span
${RECOVER_MY_ACCESS_BUTTON}                 css=div#tab-recovery-ask > form > button