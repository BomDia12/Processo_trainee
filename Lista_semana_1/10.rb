quantidade = 0

print 'Escreva 10 números ou mais com espaço entre eles:'
lista = gets.split
tamanho = lista.count

for numero in lista
  numero = numero.to_i
  if numero >= 10 and numero <= 20
    quantidade = quantidade + 1
  end
end

puts "#{quantidade} estão entre 10 e 20, #{tamanho - quantidade}, não"
