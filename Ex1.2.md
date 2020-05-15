table Dentists as D{
  id_dentist int [pk, not null]
  name varchar
  cpf varchar
  rg varchar
  email varchar
  date_of_birth date
  cro_code varchar
  fk_da int [ref: > DA.id_da]
  fk_consulting_room int [ref: > R.id_room]
  fk_gender int [ref: > G.id_gender]
}

table DentistryAreas as DA{
  id_da int [pk, not null]
  desc varchar
}

table Rooms as R{
  id_room int [pk, not null]
  desc varchar
}

table Gender as G{
  id_gender int [pk, not null]
  desc varchar
}

table Clients as C{
  id_client int [pk, not null]
  name varchar
}

table Appointments as A{
  id_app int [pk, not null]
  date_of_app date
  fk_dentist int [ref: > D.id_dentist]
  fk_client int [ref: > C.id_client]
}