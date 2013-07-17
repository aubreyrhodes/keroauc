require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Keroauc
  class Application < Rails::Application
    config.assets.paths << '/app/assets/templates'
    config.assets.paths << '/app/assets/fonts'
    config.assets.precompile += %w( .svg .eot .woff .ttf )
    ActiveSupport::Dependencies.autoload_paths << "#{Rails.root}/lib/constraints"

    config.autoload_paths += Dir["#{config.root}/lib/**/"]
  end
end
