require 'digest'

#Duranta a aula de quarta da semana passada, vocês falaram sobre http e https,
# isso me inspirou e eu apliquei um básico sistema de criptografar as senhas.
# Por isso, se vocês tentarem a opção de devolver os dados da conta, a senha
# vai ser um hash.

class ContaBancaria
  def initialize (nome, cpf, telefone, idade, saldo, num_conta, senha)
    @nome = nome
    @cpf = cpf
    @telefone = telefone
    @idade = idade
    @saldo = saldo
    @num_conta = num_conta
    @senha = Digest::MD5.hexdigest(senha)
  end

  def depositar (valor)
    @saldo += valor
    return {novo_saldo: @saldo, valor_retirado: valor}
  end

  def sacar (valor)
    @saldo -= valor
    return {novo_saldo: @saldo, valor_retirado: valor}
  end

  attr_reader :saldo
  attr_writer :telefone

  def dados_pessoais
    {nome: @nome, CPF: @cpf, telefone: @telefone, idade: @idade}
  end

  def dados_conta
    {numero_da_conta: @num_conta, senha:@senha}
  end
end

conta = ContaBancaria.new(
    'Arthur',
    '412.854.125-74',
    '13254-8745',
    23,
    467,
    1024633,
    123456
)

numero = 0
puts "Digite sua opção:"

while numero != 7
  print "1. Depositar
  2. Sacar
  3. Exibir saldo
  4. Modificar telefone
  5. Exibir dados pessoais
  6. Exibir dados da conta
  7. Sair\n"
  numero = gets.to_i
  case numero
  when 1
    print 'Digite o valor a ser depositado:'
    valor = gets.to_i
    puts conta.depositar(valor)
    puts ""
  when 2
    print 'Digite o valor a ser sacado:'
    valor = gets.to_i
    result = conta.sacar(valor)
    if result
      print "#{result}\n\n"
    else
      puts "Valor inserido inválido! Insira um valor menor que o seu saldo!"
    end
  when 3
    print "Seu saldo é: #{conta.saldo} \n\n"
  when 4
    print "Insira o novo telefone: "
    conta.telefone = gets.tr("\n", '')
    puts "Telefone trocado com sucesso! \n"
  when 5
    puts "#{conta.dados_pessoais}\n"
  when 6
    puts "#{conta.dados_conta}\n"
  when 7
    break
  else
    puts "Valor inválido! Por favor escreva um valor válido!\n"
  end
end
