def fatorial (valor)
  result = 1
  while valor > 0
    result *= valor
    valor -= 1
  end
  result
end

print 'Escreva um número inteiro positivo maior que zero:'
valor = gets.to_i
if valor >= 1 and valor <= 10
  result = fatorial(valor)
  print"#{valor}! = "
  while valor > 1
    print "#{valor}*"
    valor -= 1
  end
  puts "#{valor} = #{result}"
elsif valor > 10
  result = fatorial(valor)
  puts "#{valor}! = #{result}"
else
  puts "Valor inválido!"
end
