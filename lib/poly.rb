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

#require 'poly/dsl/html/html_block'

module Poly
  autoload :Page, 'poly/page'

  class Railtie < ::Rails::Railtie
    config.after_initialize do
      require 'active_support/i18n'
      #require 'poly/page'
      I18n.load_path.unshift *Dir[File.expand_path('../poly/locales/*.yml', __FILE__)]
    end
  end

  class << self
    mattr_accessor :default_paths
    self.default_paths = %w(app/admin)

    mattr_accessor :default_namespace
    self.default_namespace = 'admin'

    #mattr_accessor :old_tags_support
    #self.old_tags_support = false

    def setup
      yield self
    end

    def register_model(model, *options, &block)
      Page.new(model.name, *options, &block)
    end

    def register_page(name, *options, &block)
      Page.new(name, *options, &block)
    end
  end
end
