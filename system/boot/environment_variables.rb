# frozen_string_literal: true

# Plik ten zawiera setup zmiennych srodowiskowych uzywajacych Dotenv.
Application.boot(:environment_variables) do
  start do
    # Get Application current environment.
    env = Application.env

    # Laduje zmienne srodowiskowe jesli aktualne srodowisko to development lub test.
    if %w[development test].include?(env)
      require 'dotenv'

      Dotenv.load('.env', ".env.#{env}")
    end
  end
end
