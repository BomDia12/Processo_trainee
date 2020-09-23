class Turma

  @@aprovados = []
  @@alunos = []
  @@turmas = []

  def initialize (materia, n_alunos)
    @materia = materia
    @alunos_classe = []
    @@turmas << self
    @notas = []
    @aprovados_turma = []
    i = 0
    while i < n_alunos
      nota = rand(11)
      @notas << nota
      i += 1
    end
    randomize_unique(n_alunos, @@alunos, 100000, @alunos_classe)
    aprovados(@notas, self, n_alunos)
  end

  def n_aprovados
    self.aprovados_turma.size
  end

  def n_alunos
    self.alunos_classe.size
  end

  def porcentagem_aprovados
    fracao = (self.n_aprovados).to_f / self.n_alunos
    fracao = (fracao * 100).round(2)
    fracao
  end

  attr_reader :alunos_classe, :notas, :aprovados_turma, :materia
  attr_writer :aprovados_turma

  def self.turmas
    @@turmas
  end

  def self.n_total_de_alunos
    @@alunos.size
  end

  def self.n_total_aprovados
    @@aprovados.size
  end

  def self.aprovados
    @@aprovados
  end

  def self.alunos
    @@alunos
  end

  def self.porcentagem_geral_aprovados
    fracao = (@@aprovados.size).to_f / @@alunos.size
    fracao = (fracao * 100).round(2)
    fracao
  end

  private
  def randomize_unique (n_elementos, tipo_class, max, tipo_instance)
    i = 0
    while i < n_elementos
      elemento = rand(max)
      unless tipo_class.include? elemento
        tipo_class << elemento
        tipo_instance << elemento
        i += 1
      end
    end
  end

  def aprovados (notas, instance, n_alunos)
    i = 0
    while i < n_alunos
      if notas[i] >= 5
        @@aprovados << instance.alunos_classe[i]
        instance.aprovados_turma << instance.alunos_classe[i]
      end
      i += 1
    end
  end
end

materias = [
    'Cálculo 1',
    'Cálculo 2',
    'Cálculo 3',
    'Física 1',
    'Física 2',
    'Estrutura de dados',
    'Algorítimos de Programação de Computadores',
    'Técnicas de Programação 1',
    'Sistemas digitais',
    'Eletromagnetismo'
]
n_turmas = 0
while n_turmas > 10 or n_turmas < 1
  print 'Digite a quantidade de turmas desejada:'
  n_turmas = gets.to_i
  if n_turmas > 10 or n_turmas < 1
    puts 'Valor inválido! Favor digitar um valor entre 1 e 10'
  end
end

materias_escolidas = materias.sample(n_turmas)
for materia in materias_escolidas
  Turma.new(materia, rand(5..20))
end

for instance in Turma.turmas
  print "#{instance.materia}: #{instance.porcentagem_aprovados}\n"
end
print "Geral: #{Turma.porcentagem_geral_aprovados}"
