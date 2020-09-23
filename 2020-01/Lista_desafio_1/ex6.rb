def juros (valor, taxa)
  valor *= (taxa + 1)
  valor
end

print 'Escreva o dinheiro aplicado:'
montante = gets.to_f
print 'Escreva o rendimento mensal médio em decimal:'
taxa = gets.to_f
print 'Escreva o custo da conta de luz:'
conta_de_luz = gets.to_f
print 'Escreva o prazo para pagar a conta de luz:'
prazo = gets.to_i

if montante > 0 and taxa > 0 and conta_de_luz > 0 and prazo > 0
  i = 1
  while montante < conta_de_luz and i < prazo
    montante = juros(montante, taxa)
    conta_de_luz = juros(conta_de_luz, 0.01)
    i += 1
  end
  if montante > conta_de_luz
    puts "Waliff pagou sua conta em #{i} meses"
  else
    puts "Waliff não consegui pagar a conta de luz"
  end
end
