def tipo_triangulo (a, b, c)
  if c < a + b and b < a + c and a < b + c
    if a == b and b == c
      'Equilátero'
    elsif a == b or b == c or a == c
      'Isócelis'
    else
      'Escaleno'
    end
  else
    false
  end
end

print 'Escreva 3 números positivos separados por espaço'
lista = gets.split
a = lista[0].to_i
b = lista[1].to_i
c = lista[2].to_i
if a > 0 and b > 0 and c > 0
  triangulo = tipo_triangulo(a, b, c)
  if triangulo
    puts "Forma triângulo #{triangulo}"
  else
    puts 'Não forma triângulo'
  end
else
  puts 'Entrada inválida'
end
