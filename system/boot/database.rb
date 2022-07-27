# frozen_string_literal: true

# Ten plik zawiera setup polaczenia z baza danych

Application.boot(:database) do |container|
  # Laduje zmienne srodowiskowe zanim ustanowi polaczenie z baza danych
  use :environment_variables
  init do
    require 'sequel/core'
  end
  start do
    # Usuwa DATABASE_URL ze srodowiska, wiec nie bedzie przypadkiem podane do subprocesow
    database = Sequel.connect(ENV.delete('DATABASE_URL'))
    # Rejestruje component bazy danych
    container.register(:database, database)
  end
end
