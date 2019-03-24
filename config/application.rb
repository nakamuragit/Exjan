require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Exjan
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    # Timezoneの設定
    Time.zone_default = Time.find_zone! 'Tokyo'
    ActiveRecord::Base.default_timezone = :local
    # ロガーの設定
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    # DB情報
    ActiveRecord::Base.establish_connection(
      "adapter" => "sqlite3",
      "database" => "./myapp.db"
    )
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
