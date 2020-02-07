require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.autoload_paths += Dir[Rails.root.join('app', 'uploaders')]
    config.i18n.default_locale = :ja
    config.time_zone = 'Tokyo'
  end
end

# request_specとmodel_spec以外は不要
# config.generators do |g|
#   g.test_framework :rspec,
#     view_spec: false,
#     helper_specs: false,
#     controller_spec: false,
#     routing_spec: false
# end
