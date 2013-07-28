require 'rails'

module Poly
  class Engine < ::Rails::Engine
    engine_name 'poly'

    #initializer 'poly.assets.precompile' do |app|
    #  app.config.assets.precompile += %w(poly.js.coffee poly.css.sass)
    #end

    #config.generators do |g|
    #  g.test_framework :rspec, fixture: false
    #  g.fixture_replacement :factory_girl, dir: 'spec/factories'
    #  g.assets false
    #  g.helper false
    #end
  end
end