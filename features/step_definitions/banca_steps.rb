Dado("o endereço da API para manter o cadastro de Banca") do
    #já instanciado pela classe Startup
end
  
Quando("realizar uma requisição para cadastrar uma banca") do
    #$response = HTTParty.post($uri_base, 
    #:body => {"nome": @nome, "endereco": @cidade, "apelido": "BCB777", "telefoneFixo": "61988888888", "data": "2023-08-01", "ativo": true}.to_json, :headers => {'Content-Type' => 'application/json'})
    $response = @banca.postBanca
end
  
Então("a API irá retornar os dados do cadastro da Banca respondendo o código {int}") do |int|
    #puts "Response body: #{$response.body}"

    #expect do status code e message
    expect($response.code).to eq(int)
    puts "Response code: #{$response.code}"
    #expect($response.message).to eq("Created")
    puts "Response Message: #{$response.message}"
    
    #imprime os atributos da requisição
    puts "ID        : #{$response["data"]["id"]}"
    puts "Nome      : #{$response["data"]["nome"]}"
    puts "Apelido   : #{$response["data"]["apelido"]}"
    puts "Telefone  : #{$response["data"]["telefoneFixo"]}"
    puts "Endereco  : #{$response["data"]["endereco"]}"
    puts "Ativo?    : #{$response["data"]["ativo"]}"
    puts "Data      : #{$response["data"]["data"]}"

    $id = $response["data"]["id"]
end

Quando("realizar uma requisição passando o ID da banca") do
    $get = @banca.getBanca($id)
end

Então("a API irá retornar os dados da Banca correspondente respondendo o código {int}") do |int|
    expect($get.code).to eq(int)
    #expect($get.message).to eq("OK")
    expect($get["id"]).to eq($response["data"]["id"])

    puts "ID        : #{$get["id"]}"
    puts "Nome      : #{$get["nome"]}"
    puts "Apelido   : #{$get["apelido"]}"
    puts "Telefone  : #{$get["telefoneFixo"]}"
    puts "Endereco  : #{$get["endereco"]}"
    puts "Ativo?    : #{$get["ativo"]}"
    puts "Data      : #{$get["data"]}"
    puts "Status Code: #{$get.code}"
    
end

Quando("realizar uma requisição para alterar uma banca") do
    $put = @banca.putBanca($get["id"])
end

Então("a API irá retornar os dados da Banca alterados respondendo o código {int}") do |int|
    expect($put.code).to eq(int)
    #expect($put.message).to eq("OK")
    expect($put["id"]).to eq($response["data"]["id"])

    puts "ID        : #{$put["id"]}"
    puts "Nome      : #{$put["nome"]}"
    puts "Apelido   : #{$put["apelido"]}"
    puts "Telefone  : #{$put["telefoneFixo"]}"
    puts "Endereco  : #{$put["endereco"]}"
    puts "Ativo?    : #{$put["ativo"]}"
    puts "Data      : #{$put["data"]}"
    puts "Status Code: #{$put.code}"
end

Quando("realizar uma requisição para excluir uma banca") do
  $delete = @banca.deleteBanca($put["id"])
end

Então("a API deverá retornar os dados da exclusão respondendo o código {int}") do |int|
    expect($delete.code).to eq(int)
    #expect($delete.message).to eq("OK")
    puts "Status Code: #{$delete.code}"
end