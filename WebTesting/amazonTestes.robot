*** Settings ***
Documentation    Essa suite testa o site da Amazon.com.br
Resource         amazonResources.robot
Test Setup       Abrir o navegdor
Test Teardown    Fechar o navegador


*** Test Cases ***
Caso de testes 01 - Acesso ao menu de eletrônicos
    [Documentation]    Este teste verificar o menu de eletrônicos da página da Amazon
    ...                Continuação da documentação
    [Tags]              menus    categorias
    Acessar a home page do site Amazon.com.br
    Entrar no menu "Eletrônicos"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a categoria "Computadores e Informática"

Caso de testes 02 - Pesquisa de um produto
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]            Busca de produtos    lista da busca
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa, listando o produto pesquisado