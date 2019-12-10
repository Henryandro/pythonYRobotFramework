    *** Settings ***
Library     Selenium2Library
Library     OperatingSystem
Library     String
Library     Process

*** Variables ***

${SERVER}            http://100.126.0.138:7005/eoc/om/v1/order/120001680118870?fields=version,description,orderType,requestedCompletionDate,relatedEntities,relatedParties,orderItems,attrs&expand=orderItems
${BROWSER}           chrome


*** Test Cases ***
Open Browser To Login Page
    Open Browser  ${SERVER}   ${BROWSER}
    Maximize Browser Window
    ${ELEMENTO}=    Execute Javascript     return window.document.querySelector("body > pre").innerText; 
    Log To Console    ${ELEMENTO}
    run keyword     write_variable_in_file  ${ELEMENTO}
    run process       python   deactivationProcess.py

*** Keywords ***
write_variable_in_file
  [Arguments]  ${variable}
  Create File  ${EXECDIR}/deactivationGetRequest.json  ${variable}