*** Settings ***
Documentation   Exercício utilizando listas
*** Variable ***

@{Meses}    janeiro    fevereiro    março    abril    maio    junho    julho    agosto    setembro    outubro    novembro    dezembro


*** Test Cases ***
Meses do ano
    Listar meses

*** Keywords ***
Listar meses
    Log    O ano é composto de 12 meses, sendo eles: ${Meses[0]}, ${Meses[1]}, ${Meses[2]}, ${Meses[3]}, ${Meses[4]}, ${Meses[5]}, ${Meses[6]}, ${Meses[7]}, ${Meses[8]}, ${Meses[9]}, ${Meses[10]} e ${Meses[11]}.