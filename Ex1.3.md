table Professors as P{
  id_professor int [pk, not null]
  name varchar
  cpf varchar
  rg varchar
  date_of_birth date
  email varchar
  program_languages int [ref: > PL.id_language]
  years_of_experience int
  fk_gender int [ref: > G.id_gender]
}

table Students as S{
  id_student int [pk, not null]
  cpf varchar
  rg varchar
  fk_professor int [ref: > P.id_professor]
  adress varchar
  fk_city int [ref: > C.id_city]
}

table Cities as C{
  id_city int [pk, not null]
  city_desc varchar
  fk_state int [ref: > States.id_state]
}

table States{
  id_state int [pk, not null]
  desc varchar
}

table ProgrammingLanguages as PL{
  id_language int [pk, not null]
  desc varchar
}

table Gender as G{
  id_gender int [pk, not null]
  desc varchar
}