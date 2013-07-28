# -*- encoding: utf-8 -*-
require File.expand_path('../lib/poly/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Jenua Boiko']
  gem.email         = ['jeyboy1985@gmail.com']
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = 'https://github.com/jeyboy/poly'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'poly'
  gem.require_paths = ['lib']
  gem.version       = Poly::VERSION

  gem.add_dependency('rails', '>= 3.0')
  gem.add_dependency('jquery-rails')
  gem.add_dependency('sass-rails')
  gem.add_dependency('simple_form')
  gem.add_dependency('meta_search')
  gem.add_dependency('kaminari')
  gem.add_dependency('slim-rails')
  gem.add_dependency('devise')
  gem.add_dependency('inherited_resources')
  #https://github.com/somerandomdude/Iconic
end
