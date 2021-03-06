require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module CupOfSugr
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    config.generators do |generate|
      generate.helper false
      generate.assets false
      generate.view_specs false
    end

    config.assets.paths << "#{Rails}/app/assets/fonts"
    config.assets.initialize_on_precompile = false
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    config.assets.precompile += %w( .svg .eot .woff .ttf )
  end

  CupOfSugr::Application.configure do
    config.action_mailer.smtp_settings = {
      :address   => "smtp.mandrillapp.com",
    :port      => 587, # ports 587 and 2525 are also supported with STARTTLS
    :enable_starttls_auto => true, # detects and uses STARTTLS
    :user_name => "brian.joe.le@gmail.com",
    :password  => "k-bgunPs9O8Jgc70HmhZXQ", # SMTP password is any valid API key
    :authentication => 'login', # Mandrill supports 'plain' or 'login'
    :domain => 'localhost:3000', # your domain to identify your server when connecting
  }
end
end
