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
    [Arguments]    ${email}    ${status_code_desejado}
     ${body}    Create Dictionary
     ...    nome=${Nome}
     ...    email=${email}
     ...    password=1234
     ...    administrador=true
     Log    ${body}
    Criar Sessão na ServeRest
    ${resposta}    POST On Session    
    ...    alias=ServeRest
    ...    url=/usuarios
    ...    json=${body}
    ...    expected_status=${status_code_desejado}

    Log    ${resposta.json()}

    IF    ${resposta.status_code} == 201
        Set Test Variable    ${Id_usuario}    ${resposta.json()["_id"]}
    END
    
    Set Test Variable    ${RESPOSTA}    ${resposta.json()}
    Log    ${Email_teste}

Criar Sessão na ServeRest
    ${headers}    Create Dictionary
     ...    accept=application/json
     ...    Content-Type=application/json
    Create Session    alias=ServeRest    url=https://serverest.dev    headers=${headers}

Conferir se o usuário foi cadastrado corretamente
    Log    ${RESPOSTA}
    Dictionary Should Contain Item    ${RESPOSTA}    message    Cadastro realizado com sucesso
    Dictionary Should Contain Key    ${RESPOSTA}    _id

Repetir o cadastro do usuário
    Cadastrar o usuário criado na ServeRest    email=${Email_teste}    status_code_desejado=400
    
Verificar se a API não permitiu o cadastro repetido
    Dictionary Should Contain Item    ${RESPOSTA}    message    Este email já está sendo usado

Consultar os dados do novo usuário
    ${Resposta_consulta}    GET On Session    alias=ServeRest    url=/usuarios/${Id_usuario}    expected_status=200
    Set Test Variable    ${Resp_consulta}    ${Resposta_consulta.json()}

Conferir os dados retornados
    Log    ${Resp_consulta}
    Dictionary Should Contain Item    ${Resp_consulta}    nome   value=${Nome}
    Dictionary Should Contain Item    ${Resp_consulta}    email   value=${Email_teste}
    Dictionary Should Contain Item    ${Resp_consulta}    password   value=1234
    Dictionary Should Contain Item    ${Resp_consulta}    administrador   value=true
    Dictionary Should Contain Item    ${Resp_consulta}    _id   value=${Id_usuario}

Realizar Login com o usuário
    ${Body_login}    Create Dictionary
     ...    email=${Email_teste}
     ...    password=1234
     Log    ${Body_login}

    ${Resposta_login}    POST On Session
    ...    alias=ServeRest
    ...    url=/login
    ...    json=${Body_login}
    ...    expected_status=200
    Set Test Variable    ${Resp_login}    ${Resposta_login.json()}

Conferir se o Login ocorreu com sucesso
    Log    ${Resp_login}
    Dictionary Should Contain Item    ${Resp_login}    message    value=Login realizado com sucesso