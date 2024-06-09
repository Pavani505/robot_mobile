*** Settings ***

Resource    ${EXECDIR}/resources/base.resource

Test Setup     Start session
Test Teardown  Close session

*** Test Cases ***
Deve logar com sucesso
		[Tags]    login_valido
		Get Started
		Navigate to                     Formulários
		Go to item                      Login          Olá Padawan, vamos testar o login?
    Input Text                      id=com.qaxperience.yodapp:id/etEmail        yoda@qax.com
    Input Text                      id=com.qaxperience.yodapp:id/etPassword     jedi
    Click Element                   id=com.qaxperience.yodapp:id/btnSubmit
    Wait Until Page Contains        Boas vindas, logado você está

Não deve logar com sucesso
		[Tags]    login_invalido
		Get Started
		Navigate to                     Formulários
		Go to item                      Login          Olá Padawan, vamos testar o login?
    Input Text                      id=com.qaxperience.yodapp:id/etEmail        yoda@qax.com
    Input Text                      id=com.qaxperience.yodapp:id/etPassword     senhaIncorreta
    Click Element                   id=com.qaxperience.yodapp:id/btnSubmit
    Wait Until Page Contains        Oops! Credenciais incorretas.