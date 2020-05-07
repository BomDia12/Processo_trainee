def isBissexto? (ano)
  if ano % 400 == 0
    true
  elsif ano % 100 == 0
    false
  elsif ano % 4 == 0
    true
  else
    false
  end
end

def createcentry (seculo)
  ano = (seculo - 1) * 100
  lista = []
  max = seculo * 100
  while ano < max
    lista.push ano
    ano = ano + 1
  end
  return lista
end

bissexto = []
seculo = createcentry (20)
seculo.each do |ano|
  if isBissexto? (ano)
    bissexto.push (ano)
  end
end
puts bissexto
