require 'digest'

#Duranta a aula de quarta da semana passada, vocês falaram sobre http e https,
# isso me inspirou e eu apliquei um básico sistema de criptografar as senhas.
# Por isso, se vocês tentarem a opção de devolver os dados da conta, a senha
# vai ser um hash.

class Owner
  def initialize (nome, cpf, telefone, idade)
    @nome = nome
    @cpf = cpf
    @telefone = telefone
    @idade = idade
  end

  attr_reader :idade, :telefone, :cpf, :nome
  attr_writer :telefone

  def dados_pessoais
    {nome: @nome, CPF: @cpf, telefone: @telefone, idade: @idade}
  end
end

class CreditAccount < Owner

  @@accounts = []

  def initialize(nome, cpf, telefone, idade, saldo, num_conta, senha)
    super(nome, cpf, telefone, idade)
    @saldo = saldo
    @num_conta = num_conta
    @senha = Digest::MD5.hexdigest(senha)
    @@accounts.push(self)
  end

  def depositar (valor)
    @saldo += valor
    return {novo_saldo: @saldo, valor_retirado: valor}
  end

  def sacar (valor)
    @saldo -= valor
    return {novo_saldo: @saldo, valor_retirado: valor}
  end

  attr_reader :saldo, :num_conta, :senha

  def dados_conta
    {numero_da_conta: @num_conta, senha:@senha}
  end

  def self.accounts
    @@accounts
  end
end

class SavingsAccount < Owner

  @@accounts = []

  def initialize(nome, cpf, telefone, idade, saldo, num_conta, senha)
    super(nome, cpf, telefone, idade)
    @saldo = saldo
    @num_conta = num_conta
    @senha = Digest::MD5.hexdigest(senha)
    @@accounts.push(self)
  end

  def depositar (valor)
    @saldo += valor
    return {novo_saldo: @saldo, valor_retirado: valor}
  end

  def sacar (valor)
    if valor < @saldo
      @saldo -= valor
      return {novo_saldo: @saldo, valor_retirado: valor}
    else
      false
    end
  end

  attr_reader :saldo, :num_conta, :senha

  def dados_conta
    {numero_da_conta: @num_conta, senha:@senha}
  end

  def self.accounts
    @@accounts
  end
end

pessoa = Owner.new(
    'Arthur',
    '412.854.125-74',
    '13254-8745',
    23
)

def segundo_menu (conta)
  numero = 0
  puts "Digite sua opção:"
  while numero != 7
    print "1. Depositar\n" +
              "2. Sacar\n" +
              "3. Exibir saldo\n" +
              "4. Modificar telefone\n" +
              "5. Exibir dados pessoais\n" +
              "6. Exibir dados da conta\n" +
              "7. Sair\n"
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
end

def account_numbers (tipo)
  numbers = []
  case tipo
  when 1
    for account in CreditAccount.accounts
      numbers << account.num_conta
    end
  when 2
    for account in SavingsAccount.accounts
      numbers << account.num_conta
    end
  end
  numbers
end

numero_digitado = 0
puts 'Digite um número:'

while numero_digitado != 6
  print "1. Listar contas corrente\n" +
  "2. Listar contas popança\n" +
  "3. Criar conta corrente\n" +
  "4. Criar conta poupança\n" +
  "5. Acessar conta\n" +
  "6. Sair\n"
  numero_digitado = gets.to_i
  case numero_digitado
  when 1
    for account in CreditAccount.accounts
      puts account.num_conta
    end
  when 2
    for account in SavingsAccount.accounts
      puts account.num_conta
    end
  when 3
    print 'Digite o número da conta:'
    num_conta = gets.to_i
    print 'Digite a senha:'
    senha = gets.tr("\n", '')
    CreditAccount.new(pessoa.nome, pessoa.cpf, pessoa.telefone, pessoa.idade, 0, num_conta, senha)
    puts "Conta criada com sucesso!"
  when 4
    print 'Digite o número da conta:'
    num_conta = gets.to_i
    print 'Digite a senha:'
    senha = gets.tr("\n", '')
    SavingsAccount.new(pessoa.nome, pessoa.cpf, pessoa.telefone, pessoa.idade, 0, num_conta, senha)
    puts "Conta criada com sucesso!"
  when 5
    tipo_de_conta = 0
    puts 'Que tipo de conta você quer acessar?'
    while tipo_de_conta != 3
      puts "1. Conta Corrente
      2. Conta Poupança
      3. Sair\n"
      tipo_de_conta = gets.to_i
      case tipo_de_conta
      when 1
        print account_numbers(tipo_de_conta)
        print "\nEscreva em que lugar a conta a ser acessada está:"
        posicao = gets.to_i - 1
        conta = CreditAccount.accounts[posicao]
        senha = conta.senha
        senha_digitada = nil
        while senha_digitada != senha
          puts 'Digite a senha da conta:'
          senha_digitada = Digest::MD5.hexdigest(gets.tr("\n", ''))
          if senha_digitada != senha
            puts "Senha errada! Tente de novo"
          end
        end
        puts "Senha correta!"
        segundo_menu(conta)
      when 2
        print account_numbers(tipo_de_conta)
        print "\nEscreva em que lugar a conta a ser acessada está:"
        posicao = gets.to_i - 1
        conta = SavingsAccount.accounts[posicao]
        senha = conta.senha
        senha_digitada = nil
        while senha_digitada != senha
          puts 'Digite a senha da conta:'
          senha_digitada = Digest::MD5.hexdigest(gets.tr("\n", ''))
          if senha_digitada != senha
            puts "Senha errada! Tente de novo"
          end
        end
        puts "Senha correta!"
        segundo_menu(conta)
      when 3
        break
      else
        puts "Valor inválido, favor escrever um valor válido"
      end
    end
  when 6
    break
  else
    puts "Valor inválido! Favor escrever um valor válido"
  end
end
