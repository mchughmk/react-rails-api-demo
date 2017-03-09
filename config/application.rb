require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Code
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Configure Browserify to use babelify to compile ES7
    config.browserify_rails.commandline_options = "-t [ babelify --presets [ es2015 react stage-0 ] --plugins [ syntax-async-functions transform-regenerator ] ]"

    # Run on all javascript files
    config.browserify_rails.force = true

    # Alternatively, only run on .es6 files
    # config.browserify_rails.force = ->(file) { File.extname(file) == ".es6" }

    unless Rails.env.production?
        # Make sure Browserify is triggered when asked to serve javascript spec files
        config.browserify_rails.paths << lambda { |p|
            p.start_with?(Rails.root.join("spec/javascripts").to_s)
        }
    end
  end
end
