#language: pt
@banca
Funcionalidade: Manter dados de Banca através da API
Como um usuário do sistema
Eu quero realizar as requisições na API
A fim de manipular as informações do cadastro de banca

Cenário: Cadastrar uma Banca
    Dado o endereço da API para manter o cadastro de Banca
    Quando realizar uma requisição para cadastrar uma banca
    Então a API irá retornar os dados do cadastro da Banca respondendo o código 201

Cenário: Consultar uma Banca
    Dado o endereço da API para manter o cadastro de Banca
    Quando realizar uma requisição passando o ID da banca
    Então a API irá retornar os dados da Banca correspondente respondendo o código 200

Cenário: Alterar uma Banca
    Dado o endereço da API para manter o cadastro de Banca
    Quando realizar uma requisição para alterar uma banca
    Então a API irá retornar os dados da Banca alterados respondendo o código 200

Cenário: Deletar uma Banca
    Dado o endereço da API para manter o cadastro de Banca
    Quando realizar uma requisição para excluir uma banca
    Então a API deverá retornar os dados da exclusão respondendo o código 200