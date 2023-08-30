*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${URL}    https://www.amazon.com.br/
${MenuEletronicos}   //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${TextoHeaderEletronicos}    Eletrônicos e Tecnologia
${HeaderEletronicos}    //h1[contains(.,'Eletrônicos e Tecnologia')]

*** Keywords ***

Abrir o navegdor
    Open Browser    browser=Firefox
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go to    url=${URL}
    Wait Until Element Is Visible    locator=${MenuEletronicos}

Entrar no menu "Eletrônicos"
    Click Element    locator=${MenuEletronicos}

Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Wait Until Page Contains    text=${TextoHeaderEletronicos}
    Wait Until Element Is Visible    locator=${HeaderEletronicos}

Verificar se o título da página fica "${Titulo}"
    Title Should Be    title=${Titulo}

Verificar se aparece a categoria "${NomeCategoria}"
    Element Should Be Visible    locator=//img[contains(@alt,'${NomeCategoria}')]

Digitar o nome de produto "${Produto}" no campo de pesquisa
    Input Text    locator=//input[contains(@name,'field-keywords')]    text=${Produto}

Clicar no botão de pesquisa
    Click Button    locator=//input[@value='Ir']

Verificar o resultado da pesquisa, listando o produto pesquisado
    Element Should Be Visible    locator=//img[@alt='Console Xbox Series S']