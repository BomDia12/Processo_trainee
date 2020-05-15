def divisores (valor)
  divisores = []
  test = 1
  while test > (valor / 2)
    test += 1
    if valor % test == 0
      divisores.push(test)
    end
  end
  return divisores
end

print "Digite um valor: "
valor = gets.to_i
divisores = divisores(valor)
bool = divisores.empty?
if bool
  puts "#{valor} é primo!"
else
  print "#{valor} não é primo, pois possui #{divisores.count} dividores: #{divisores}".tr("[",'').tr("]", '')
end
