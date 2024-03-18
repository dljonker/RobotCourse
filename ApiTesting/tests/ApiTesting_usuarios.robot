*** Settings ***
Documentation    Essa suite testa a API do http://serverest.dev
Resource    ../resources/ApiTesting_usuarios.resource

*** Variables ***

*** Test Cases ***
Cenário 01: Cadastrar um novo usuário na ServeRest
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest
    Conferir se o usuário foi cadastrado corretamente