require 'meta_search'
#require 'bourbon'
require 'devise'
require 'kaminari'
require 'simple_form'
require 'inherited_resources'

require 'jquery-rails'
require 'sass'

require 'poly/engine'
require 'poly/version'
require 'poly/global'

require 'poly/dsl/html/html_block'

module Poly
  #autoload :Page, 'poly/dsl/page'

  class Railtie < ::Rails::Railtie
    config.after_initialize do
      # Add load paths straight to I18n, so engines and application can overwrite it.
      require 'active_support/i18n'
      require 'poly/page'
      I18n.load_path.unshift *Dir[File.expand_path('../active_admin/locales/*.yml', __FILE__)]
    end
  end

  class << self
    mattr_accessor :default_paths
    self.default_paths = %w(app/admin)

    mattr_accessor :default_namespace
    self.default_paths = 'admin'

    mattr_accessor :old_tags_support
    self.old_tags_support = false

    def setup
      yield self
    end
  end
end
