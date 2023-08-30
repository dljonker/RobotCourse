*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${URL}    https://www.amazon.com.br/
${MenuEletronicos}   //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${TextoHeaderEletronicos}    Eletrônicos e Tecnologia
${HeaderEletronicos}    //h1[contains(.,'Eletrônicos e Tecnologia')]

*** Keywords ***

Abrir o navegador
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

Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Verificar o resultado da pesquisa, listando o produto pesquisado

Adicionar o produto "Console Xbox Series S" no carrinho
    Element Should Be Visible    locator=//span[@class='a-size-base a-color-base'][contains(.,'Novo')]
    Click Element    locator=//span[@class='a-price-whole'][contains(.,'2.039,')]
    Element Should Be Visible    locator=submit.add-to-cart
    Click Button    locator=//*[@id="add-to-cart-button"]

Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Click Element    locator=//span[@aria-hidden='true'][contains(.,'Carrinho')]
    Element Should Be Visible    locator=//img[contains(@alt,'Console Xbox Series S, Abre em uma nova aba')]

Remover o produto "Console Xbox Series S" do carrinho
    Element Should Be Visible    locator=sc-subtotal-label-activecart
    Click Element    locator=//input[contains(@value,'Excluir')]
    
Verificar se o carrinho fica vazio
    Wait Until Element Is Visible    locator=//h1[@class='a-spacing-mini a-spacing-top-base'][contains(.,'Seu carrinho de compras da Amazon está vazio.')]

Dado que estou na home page da Amazon.com.br
    Abrir o navegador
    Acessar a home page do site Amazon.com.br

Quando adicionar o produto "Console Xbox Series S" no carrinho
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa, listando o produto pesquisado
    Adicionar o produto "Console Xbox Series S" no carrinho

Então o produto "Console Xbox Series S" deve ser mostrado no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

E existe o produto "Console Xbox Series S" no carrinho
     Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

Quando remover o produto "Console Xbox Series S" do carrinho
    Remover o produto "Console Xbox Series S" do carrinho

Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio