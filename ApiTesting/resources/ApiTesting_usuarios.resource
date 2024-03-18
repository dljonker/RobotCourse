*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections

*** Variables ***

*** Keywords ***

Criar um usuário novo
    ${palavra_aleatoria}    Generate Random String    length=4    chars=[LETTERS]
    ${palavra_aleatoria}    Convert To Lower Case    ${palavra_aleatoria}
    Set Test Variable    ${Email_teste}    ${palavra_aleatoria}@mailteste.com
    Set Test Variable    ${Nome}    ${palavra_aleatoria}
    Log    ${Email_teste}
    Log To Console    ${Email_teste}

Cadastrar o usuário criado na ServeRest
     ${body}    Create Dictionary
     ...    nome=${Nome}
     ...    email=${Email_teste}
     ...    password=1234
     ...    administrador=true
     Log    ${body}
    Criar Sessão na ServeRest
    ${resposta}    POST On Session    
    ...    alias=ServeRest
    ...    url=/usuarios
    ...    json=${body}
    Log    ${resposta.json()}
    Set Test Variable    ${RESPOSTA}    ${resposta.json()}
Criar Sessão na ServeRest
    ${headers}    Create Dictionary
     ...    accept=application/json
     ...    Content-Type=application/json
    Create Session    alias=ServeRest    url=https://serverest.dev    headers=${headers}

Conferir se o usuário foi cadastrado corretamente
    Log    ${RESPOSTA}
    Dictionary Should Contain Item    ${RESPOSTA}    message    Cadastro realizado com sucesso
    Dictionary Should Contain Key    ${RESPOSTA}    _id 