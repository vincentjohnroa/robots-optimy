*** Variables ***
### URL ###
${LOGIN_PAGE_URL}                           https://login.optimyapp.com/

### FORMS ###
${LOGIN_FORM}                               css=div#tab-login

### INPUT FIELDS ###
${LOGIN_EMAIL_INPUT_FIELD}                  css=div#tab-login > form > div:nth-of-type(1) > input
${LOGIN_PASSWORD_INPUT_FIELD}               css=div#tab-login > form > div:nth-of-type(2) > input
${RECOVERY_EMAIL_INPUT_FIELD}               css=div#tab-recovery-ask > form > div > input

### BUTTONS ###
${LOGIN_BUTTON}                             css=div#tab-login > form > button
${LOST_PASSWORD_BUTTON}                     css=div#tab-login > form > a
${RECOVER_MY_ACCESS_BUTTON}                 css=div#tab-recovery-ask > form > button

### ERRORS ###
${INVALID_CREDENTIALS_ERROR}                css=div#login-invalid
${EMAIL_INLINE_ERROR}                       css=div#tab-login > form > div > span
${PASSWORD_INLINE_ERROR}                    css=div#tab-login > form > div:nth-of-type(2) > span
${LOCKED_ACCOUNT_INLINE_ERROR}              css=div#login-too-many-attempts
${LOST_PASSWORD_INLINE_ERROR}               css=div#tab-recovery-ask > form > div > span
