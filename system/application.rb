# frozen_string_literal: true

require 'bundler/setup'
require 'dry/system/container'
require 'zeitwerk'

# {Aplication} to kontener, ktorego uzywamy do rejestrowania zaleznosci, ktore bedziemy wywolywac
class Application < Dry::System::Container
  use :env, inferrer: -> { ENV.fetch('RACK_ENV', 'development') }

  configure do |_config|
    loader = Zeitwerk::Loader.new
    folders = Dir.glob('./app/*') + ['./lib']
    folders.each do |folder|
      loader.push_dir(Aplication.config.root.join(folder).realpath)
    end
    loader.setup
  end
end
