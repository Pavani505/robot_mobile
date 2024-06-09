*** Settings ***

Resource    ${EXECDIR}/resources/base.resource

Test Setup     Start session
Test Teardown  Close session

*** Test Cases ***
Deve selecionar a opcao javascript
		[Tags]    radio
		Get Started
		Navigate to                     Check e Radio
		Go to item                      Botões de radio          Escolha sua linguagem preferida
    Click Element                   xpath=//android.widget.RadioButton[contains(@text, "Javascript")]