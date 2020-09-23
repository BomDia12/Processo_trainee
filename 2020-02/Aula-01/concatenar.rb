def concatenar (str1, str2)
  str1 + str2
end

def repetir (str, n)
  str * n
end

def ambos (str1, str2, n)
  concatenada = concatenar(str1, str2)
  repetir(concatenada, n)
end

print 'Escreva duas strings e um numero separados por espaço nessa ordem: '
str_1, str_2, n = gets.split
puts concatenar str_1, str_2
puts repetir str_1, n.to_i
puts ambos str_1, str_2, n.to_i
