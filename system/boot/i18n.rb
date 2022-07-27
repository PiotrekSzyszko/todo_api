# frozen_string_literal: true

# Plik zawiera setup dla internacjonalizacji i localizacji w Ruby

Application.boot(:i18n) do
  init do
    require 'i18n'
  end

  start do
    # Load all locale .yml files in /config/locales folder.
    I18n.load_path << Dir["#{File.expand_path('config/locales')}/*.yml"]

    # Add :en to to the list of available locales.
    I18n.config.available_locales = %i[en]
  end
end
