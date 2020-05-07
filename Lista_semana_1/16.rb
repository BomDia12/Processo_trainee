def dnaaleatorio (tamanho)
  i = 0
  lista = []
  while i < tamanho
    numero = rand(4)
    i = i + 1
    case numero
    when 0
      lista.push('A')
    when 1
      lista.push('T')
    when 2
      lista.push('C')
    when 3
      lista.push('G')
    end
  end
  lista
end

def completadna (letra)
  lista = [letra]
  case letra
  when 'A'
    lista.push('T')
  when 'G'
    lista.push('C')
  when 'C'
    lista.push('G')
  when 'T'
    lista.push('A')
  end
  lista
end

def main (tamanho)
  dnasimples = dnaaleatorio(tamanho)
  dnaduplo = []
  dnasimples.each do |nucleotideo|
    par = completadna(nucleotideo)
    dnaduplo.push(par)
  end
  dnaduplo
end

result = main(10)
print(result)
