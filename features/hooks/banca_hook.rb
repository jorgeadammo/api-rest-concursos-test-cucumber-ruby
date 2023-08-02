Before '@banca' do
    @nome = Faker::Company.name
    @cidade = Faker::Address.city

    body = {
        "nome": @nome,
        "endereco": @cidade,
        "apelido": "APL001", 
        "telefoneFixo": "61988888888", 
        "data": "2023-08-01", 
        "ativo": true
    }
    @body = JSON.generate(body)

    @banca = Banca.new(@body)
end