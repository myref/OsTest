*** Settings ***
Library           collections
Library           SeleniumLibrary
Library           OperatingSystem
Documentation     Smoketesting someApp.

Suite Setup       Open Browser   ${WEBSITE URL}      chrome       remote_url=http://seleniumgchost.internal.provider.test:4444    options=add_argument("--ignore-certificate-errors")
Suite Teardown    Close Browser

*** Test cases ***
Validate smoke
    See if the server is running

*** Variables ***
${DELAY}            0
${WEBSITE URL}      https://gitea.tooling.provider.test:3000/

*** Keywords ***

See if the server is running
    Set Selenium Speed          ${DELAY}
    Gitea Page Should Be Open
    Close Browser

Gitea Page Should Be Open
    Sleep              1
    Title Should Be    Our single source of truth