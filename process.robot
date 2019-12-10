** Settings **
# Descargar chrome driver en el siguiente link https://chromedriver.storage.googleapis.com/index.html?path=78.0.3904.105/
Library     Selenium2Library
Library     OperatingSystem
Library     String
Library     Process

** Variables **

${EOC}               http://100.126.0.138:7005/eoc/login
${ORDER_ID}          10001700112436 
${SERVER}            http://100.126.0.138:7005/eoc/om/v1/order/120001680118870?fields=version,description,orderType,requestedCompletionDate,relatedEntities,relatedParties,orderItems,attrs&expand=orderItems
${BROWSER}           chrome

** Test Cases **

Order Check
    Open Browser    ${EOC}    ${BROWSER}
    Maximize Browser Window
    Input Text      name=isc_I  usertest    
    Input Text      name=isc_N  usertest
    Press Keys      id=isc_T    \\13  
    Sleep   3s
    Press Keys      id=isc_1V   \\13   
    Sleep   3s
    Press Keys      name=isc_Gicon      \\13
    Wait Until Element Is Visible   xpath=//*[@id="isc_1Stable"]/tbody/tr[1]/td[2]/div
    Click Element   xpath=//*[@id="isc_1Stable"]/tbody/tr[1]/td[2]/div
    Wait Until Element Is Visible   xpath=//*[@id="isc_33"]
    Input Text      xpath=//*[@id="isc_33"]     ${ORDER_ID}
    Sleep   3s
    Press Keys      xpath=//*[@id="isc_20"]/table/tbody/tr/td/img     \\13  
    Wait Until Element Is Visible       xpath=//*[@id="isc_4Ktable"]/tbody/tr[2]/td[7]/div
    Click Element       xpath=//*[@id="isc_4Ktable"]/tbody/tr[2]/td[7]/div    
    Click Element       xpath=//*[@id="isc_4Ktable"]/tbody/tr[2]/td[7]/div     


Request Edition
    ${URL}   Catenate   SEPARATOR=      http://100.126.0.138:7005/eoc/om/v1/order/  ${ORDER_ID}?fields=version,description,orderType,requestedCompletionDate,relatedEntities,relatedParties,orderItems,attrs&expand=orderItems
    Open Browser    ${URL}    ${BROWSER}
    ${ELEMENTO}=    Execute Javascript     return window.document.querySelector("body > pre").innerText; 
    Log To Console  ${ELEMENTO}
    run keyword     write_variable_in_file  ${ELEMENTO}
    run process  python  desactivacion.py
    Execute Javascript  alert('Test cases completed')

** Keywords **

write_variable_in_file
  [Arguments]  ${variable}
  Create File  ${EXECDIR}/deactivationGetRequest.json  ${variable}
