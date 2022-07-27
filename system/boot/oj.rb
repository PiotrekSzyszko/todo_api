# frozen_string_literal: true

# Ten plik zawiera konfiguracje gema oj

Application.boot(:oj) do
  init do
    require 'oj'
  end

  start do
    # :compat pruboje wartosc zmiennej z Object uzywajac
    # to_json() lub to_hash() nastepnie obchodzi zmienne Object jesli nie znajdzie
    Oj.default_options = { mode: :compat }
  end
end
