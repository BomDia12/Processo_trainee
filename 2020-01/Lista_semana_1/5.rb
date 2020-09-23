print 'Escreva sua nota:'
nota = gets.to_f

case nota
when 0
  puts 'SR'
when 0..2.9
  puts 'II'
when 3..4.9
  puts 'MI'
when 5..6.9
  puts 'MM'
when 7..8.9
  puts 'MS'
when 9..10
  puts 'SS'
else
  puts "Nota inválida, por favor insira uma nota entre 0 e 10"
end
