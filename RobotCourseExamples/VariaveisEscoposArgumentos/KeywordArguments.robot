*** Settings ***
Library    String
Documentation   Exercício argumentos de keyword
*** Variable ***


*** Test Cases ***
Gerador de e-mail
    ${email}    Dados    Davy    Jonker
    Log To Console    Seu e-mail é ${email}

*** Keywords ***
Dados
    [Arguments]    ${Nome}    ${Sobrenome}
    Log    Nome da pessoa: ${Nome}
    Log    Sobrenome da pessoa: ${Sobrenome}
    ${Palavra}    Generate Random String
    ${emailPessoa}    Set Variable    ${Nome}${Sobrenome}${Palavra}@testrobot.com
    [Return]    ${emailPessoa}
    