numero = 11

while numero < 1 or numero > 10
  print 'Escreva um número entre 0 e 10:'
  numero = gets.to_i
end

for i in 1..10
  puts numero * i
end
