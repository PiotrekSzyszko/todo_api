# frozen_string_literal: true

# Konfiguracja bcrypt.

Application.boot(:bcrypt) do
  init do
    require 'bcrypt'
  end

  start do
    # Ustawienie BCrypt::Engine.cost na 1 w srodowisku testowym zeby przyspieszyc testy
    BCrypt::Engine.cost = 1 if Application.env == 'test'
  end
end
