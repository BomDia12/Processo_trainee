print 'Escreva a string a ser veificada:'
string = gets.ascii_only?

if string
  puts 'A string tem apenas caracteres do ASCII'
else
  puts 'A string tem caracteres que não são do ASCII'
end
