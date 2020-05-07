pares = 0
impares = 0

print 'Digite o primeiro valor:'
n1 = gets.to_i
print 'Digite o segundo valor:'
n2 = gets.to_i
print 'Digite o terceiro valor:'
n3 = gets.to_i
print 'Digite o quarto valor:'
n4 = gets.to_i
print 'Digite o quinto valor:'
n5 = gets.to_i

lista = [n1, n2, n3, n4, n5]

lista.each do |numero|
  if numero % 2 == 0
    pares = pares + 1
  else
    impares = impares + 1
  end
end

puts "#{impares} são impares e #{pares} são pares"
