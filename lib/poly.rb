require 'poly/version'
require 'poly/dsl/views'

module Poly
  mattr_accessor :default_paths
  self.default_paths = %w(app/admin)

  def self.setup
    yield self
  end
end
