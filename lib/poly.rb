require 'poly/version'

module Poly
  mattr_accessor :default_paths
  self.default_paths = %w(app/admin)

  def self.setup
    yield self
  end
end
