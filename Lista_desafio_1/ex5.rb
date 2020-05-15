def velasextras (quantidade)
  horas = 0
  while quantidade > 0
    horas += quantidade
    quantidade = (quantidade / 2).to_i
  end
  horas
end

print 'Escreva a quantidade de velas'
velas = gets.to_i
if velas > 0
  horas = velasextras(velas)
  puts "#{horas} horas"
else
  puts "Escreva um valor válido"
end
