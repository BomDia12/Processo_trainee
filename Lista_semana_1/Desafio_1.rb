menu = {}
menu['entrada'] = ['Bruscheta', 'Salada', 'Sopa']
menu['principal'] = ['Filé à parmegiana', 'Bobó de camarão', 'Moqueca']
menu['sobremesa'] = ['Torta alemã', 'Mouse de chocolate', 'Torta de limão']

lista = [menu['entrada'][rand(menu['entrada'].count)],
         menu['principal'][rand(menu['principal'].count)],
         menu['sobremesa'][rand(menu['sobremesa'].count)]]

print lista
