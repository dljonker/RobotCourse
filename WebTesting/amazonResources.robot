*** Settings ***
Library    SeleniumLibrary

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
    Close Browser

Acessar a home page do site Amazon.com.br
    Go to    url=${URL}
    Wait Until Element Is Visible    locator=${MenuEletronicos}

Entrar no menu "Eletrônicos"
    Click Element    locator=${MenuEletronicos}

Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Wait Until Page Contains    text=${TextoHeaderEletronicos}
    Wait Until Element Is Visible    locator=${HeaderEletronicos}