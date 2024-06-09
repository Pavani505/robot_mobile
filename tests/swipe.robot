*** Settings ***

Resource    ${EXECDIR}/resources/base.resource

Test Setup     Start session
Test Teardown  Close session

*** Test Cases ***
Deve poder remover o Darth Vader
    [Tags]    simple
    Get Started
    Navigate to                     Star Wars
    Go to item                      Lista           Darth Vader

    # ${locatorFinal}         Set Variable                xpath=//android.widget.TextView[@text="@darthvader"]/../../..
    # ${positionsFinal}       Get Element Location        ${locatorFinal}
    # ${locatorInicial}       Set Variable                xpath=//android.widget.TextView[@text="@darthvader"]/../../..//*[@resource-id="com.qaxperience.yodapp:id/indicator"]
    # ${positionsInicial}     Get Element Location        ${locatorInicial}

    # ${startX}     Set Variable    ${positionsInicial}[x]
    # ${startY}     Set Variable    ${positionsInicial}[y]
    # ${offsetX}    Set Variable    ${positionsFinal}[x]
    # ${offsetY}    Set Variable    ${positionsFinal}[y]

    ${locator}       Set Variable                xpath=//android.widget.TextView[@text="@darthvader"]/../../..//*[@resource-id="com.qaxperience.yodapp:id/indicator"]
    ${positions}     Get Element Location        ${locator}

    ${startX}     Set Variable    ${positions}[x]
    ${startY}     Set Variable    ${positions}[y]
    ${offsetX}    Evaluate        ${positions}[x] - 650
    ${offsetY}    Set Variable    ${positions}[y]

    Swipe    ${startX}    ${startY}    ${offsetX}    ${offsetY}    1000
    Click Element                   id=com.qaxperience.yodapp:id/btnRemove
    Wait Until Page Contains        Item removido!