*** Settings ***

Resource    ${EXECDIR}/resources/base.resource

Test Setup     Start session
Test Teardown  Close session

*** Keywords ***
Select Level
    [Arguments]    ${level}
    Click Element                   id=com.qaxperience.yodapp:id/spinnerJob
    Wait Until Element Is Visible   class=android.widget.ListView
    Click Text                      ${level}

*** Test Cases ***
Deve escolher o nivel Padawan
		[Tags]    seleniona_padawan
		Get Started
		Navigate to                     Formulários
		Go to item                      Cadastro          Crie sua conta.
    Select Level                    Padawan

Deve escolher o nivel Jedi
		[Tags]    seleniona_jedi
		Get Started
		Navigate to                     Formulários
		Go to item                      Cadastro          Crie sua conta.
    Select Level                    Jedi

Deve escolher o nivel Sith
		[Tags]    seleniona_sith
		Get Started
		Navigate to                     Formulários
		Go to item                      Cadastro          Crie sua conta.
    Select Level                    Sith

Deve escolher o nivel Outros
		[Tags]    seleniona_outros
		Get Started
		Navigate to                     Formulários
		Go to item                      Cadastro          Crie sua conta.
    Select Level                    Outros