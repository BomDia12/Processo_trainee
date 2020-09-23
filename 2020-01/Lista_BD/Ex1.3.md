table Pilots as Pi{
  id_pilot int [pk, not null]
  name varchar
  cpf varchar
  rg varchar
  email varchar
  dop date
  anac_code varchar
}

table Planes as Pl{
  id_plane int [pk, not null]
  register_number int
  number_of_seats int
}

table Passenger as Pa{
  id_passenger int [pk, not null]
  name varchar
  cpf varchar
  rg varchar
  email varchar
  dop date
  fk_gender int [ref: > G.id_gender]
  fk_flight int [ref: > F.id_flight]
}

table Gender as G{
  id_gender int [pk, not null]
  desc varchar
}

table Cities as C{
  id_city int [pk, not null]
  desc varchar
}

table Flights as F{
  id_flight int [pk, not null]
  expected_tod timestamp
  expected_toa timestamp
  time_of_departure timestamp
  time_of_arrival timestamp
  fk_plane int [ref: > Pl.id_plane]
  fk_pilot int [ref: > Pi.id_pilot]
  fk_origin int [ref: > C.id_city]
  fk_destination int [ref: > C.id_city]
}