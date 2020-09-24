print 'Digite uma frase: '
array = gets.split

array.each do |word|
  puts word
end

for word in array
  puts word
end

i = 0
while i < array.length
  puts "A #{i + 1} palavra é #{array[i]}"
  i += 1
end
