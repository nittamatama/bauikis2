require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Bauikis2
  class Application < Rails::Application
    config.load_defaults 7.0

    config.time_zone = "Tokyo"

    # 複数localeファイルを読み込めるようにする
    config.i18n.load_path +=
      Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

    # デフォルトのlocaleを日本語(:ja)にする
    config.i18n.default_locale = :ja

    config.generators do |g|
      g.skip_routes true
      g.helper false
      g.assets false
      g.test_framework :rspec
      g.controller_specs false
      g.view_specs false
    end
  end
end
