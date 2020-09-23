class ContaBancaria
  def initialize (nome, cpf, telefone, idade, saldo, num_conta, senha)
    @nome = nome
    @cpf = cpf
    @telefone = telefone
    @idade = idade
    @saldo = saldo
    @num_conta = num_conta
    @senha = senha
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

print conta.depositar(33)
puts ''
print conta.sacar(50)
puts ''
print conta.saldo
puts ''
print conta.telefone = '12547-1254'
puts ''
print conta.dados_pessoais
puts ''
print conta.dados_conta
puts ''
