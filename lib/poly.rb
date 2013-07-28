require 'meta_search'
#require 'bourbon'
require 'devise'
require 'kaminari'
require 'simple_form'
require 'inherited_resources'

require 'jquery-rails'
require 'sass'

require 'poly/version'
require 'poly/dsl/page'

module Poly
  mattr_accessor :default_paths
  self.default_paths = %w(app/admin)

  mattr_accessor :default_namespace
  self.default_paths = 'admin'

  mattr_accessor :old_tags_support
  self.old_tags_support = false

  def self.setup
    yield self
  end
end
