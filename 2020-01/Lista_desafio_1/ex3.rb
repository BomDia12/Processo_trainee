def fibonacii (numero)
  i = 0
  valor = 0
  last = 1
  while i < numero
    temp = valor
    valor += last
    last = temp
    i += 1
  end
  valor
end

print 'Escreva um número inteiro positivo:'
numero = gets.to_i
if numero > 0
  valor = fibonacii(numero)
  puts valor
else
  puts 'Valor inválido!'
end
