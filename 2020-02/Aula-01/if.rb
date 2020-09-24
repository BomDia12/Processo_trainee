print 'Digite dois números: '
a, b = gets.split
a, b = a.to_i, b.to_i

if a >= 0
  puts 'sim'
elsif b >= 0
  puts 'talvez'
else
  puts 'não'
end
