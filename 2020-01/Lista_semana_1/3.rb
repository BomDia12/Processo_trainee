int = 7
float = 7.5
string = 'oi'
array = [10,20]
hash = {nome: 'oi'}
symbol = :oi
lista = [int, float, string, array, hash, symbol]

for item in lista
  print item
  print '-->'
  puts item.class
end

lista.each do |why|
  print why
  print ' --> '
  puts why.class
end
