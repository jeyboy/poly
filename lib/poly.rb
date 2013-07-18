require 'poly/version'
require 'poly/dsl/dsl'

module Poly

  #include Poly::DSL

  mattr_accessor :default_paths
  self.default_paths = %w(app/admin)

  def self.setup
    yield self
  end
end
