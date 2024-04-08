*** Settings ***
Documentation   Exercício utilizando dicionários
*** Variable ***

@{Meses}    janeiro    fevereiro    março    abril    maio    junho    julho    agosto    setembro    outubro    novembro    dezembro
&{Dias}    janeiro=31    fevereiro=28    março=31    abril=30    maio=31    junho=30    julho=31    agosto=31    setembro=30    outubro=31    novembro=30    dezembro=31


*** Test Cases ***
Quantidade de dias em cada mês do ano
    Listar meses

*** Keywords ***
Listar meses
    Log To Console    O ano é composto de 12 meses, sendo eles: ${Meses[0]}, ${Meses[1]}, ${Meses[2]}, ${Meses[3]}, ${Meses[4]}, ${Meses[5]}, ${Meses[6]}, ${Meses[7]}, ${Meses[8]}, ${Meses[9]}, ${Meses[10]} e ${Meses[11]}.
    Log To Console    Sendo que cada mez possue uma quantidade diferente de dias, sendo:
    Log Many    &{Dias}