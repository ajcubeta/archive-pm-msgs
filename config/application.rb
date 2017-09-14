require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ArchivePmMsgs
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.time_zone = 'Singapore'

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Postmark email service
    config.action_mailer.delivery_method = :postmark
    config.action_mailer.postmark_settings = { api_key: 'ca102b6c-2bcb-42a2-baf0-1cf82a71dd26' }

    # Minitest::Spec
    config.generators do |g|
      g.test_framework :minitest, spec: true, fixture: false
      g.assets false
      g.helper false
    end
  end
end
