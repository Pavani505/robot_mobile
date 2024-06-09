*** Settings ***

Library    AppiumLibrary
Library    DebugLibrary

*** Variables ***
${START}     QAX

*** Keywords ***
Start session
    Open Application  http://localhost:4723
    ...               platformName=Android
    ...               deviceName=Android Emulator
    ...               automationName=UiAutomator2
    ...               app=${EXECDIR}/app/yodapp-beta.apk
    ...               udid=emulator-5554
    ...               autoGrantPermissions=true

Get Started
    Wait Until Page Contains        ${START}            5
    Click Text                      ${START}
    
Navigate to
    [Arguments]    ${itemText}
    ${menuGeral}  Set Variable      xpath=//android.widget.ImageButton[@content-desc="Open navigation drawer"]
    Wait Until Element Is Visible   ${menuGeral}    5
    Click Element                   ${menuGeral}
    ${menuItem}  Set Variable       xpath=//android.widget.TextView[@resource-id="com.qaxperience.yodapp:id/tvItemTitle" and @text="${itemText}"]
    Wait Until Element Is Visible   ${menuItem}     5
    Click Element                   ${menuItem}


Go to item
    [Arguments]    ${item}    ${checkpoint}
    Wait Until Page Contains        ${item}  5
    Click Text                      ${item}
    Wait Until Page Contains        ${checkpoint}

Close session
    Close Application