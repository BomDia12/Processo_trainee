def dividiremnotas (valor_notas, total)
  if total / valor_notas >= 0
    notas = total / valor_notas
    notas = notas.to_i
    novo_total = total - (valor_notas * notas)
  else
    novo_total = total
    notas = 0
  end
  lista = [notas, novo_total, valor_notas]
  lista
end

def main (total, notas_possiveis=[100, 50, 20, 10, 5, 2])
  notas_resto = []
  notas_possiveis.each do |valor_nota|
    temp = dividiremnotas(valor_nota, total)
    total = temp[1]
    notas_resto.push(temp)
  end
  notas_resto.push(total)
  notas_resto
end

print 'Escreva o valor a ser retirado: '
total = gets.to_i
result = main(total)

result.each do |linha|
  if linha.class == Array
    puts "#{linha[0]} nota(s) de #{linha[2]}"
  else
    puts "Resto: #{linha}"
  end
end
