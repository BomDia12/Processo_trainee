def sugestao (menu, tipo)
  pratos = menu[tipo].keys
  prato_escolhido = pratos[rand(pratos.size)]
  valor = menu[tipo][prato_escolhido]
  [prato_escolhido, valor]
end

menu = {}
menu['entrada'] = {}
menu['entrada']['Bruscheta'] = 5
menu['entrada']['Sopa'] = 3
menu['entrada']['Salada'] = 7
menu['principal'] = {}
menu['principal']['Filé à parmegiana'] = 15
menu['principal']['Bobó de camarão'] = 25
menu['principal']['Moqueca'] = 20
menu['sobremesa'] = {}
menu['sobremesa']['Torta alemã'] = 10
menu['sobremesa']['Torta de limão'] = 5
menu['sobremesa']['Mouse de chocolate'] = 7

total = 0
pratos = []
tipos = ['entrada', 'principal', 'sobremesa']
tipos.each do |tipo|
  temp = sugestao(menu, tipo)
  pratos.push(temp[0])
  total = total +temp[1]
end
print "#{pratos}. Total: R$#{total}"
