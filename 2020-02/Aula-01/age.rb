def age days
  days = days.to_i
  years = days / 360
  days = days % 360
  months = days / 30
  days = days % 30
  puts "#{years} anos, #{months} meses e #{days} dias"
end

print 'Escreva as idades em dias:'
idade1, idade2, idade3 = gets.split
age idade1
age idade2
age idade3
