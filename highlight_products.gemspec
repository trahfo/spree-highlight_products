Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'highlight_products'
  s.version     = '1.0.1'
  s.summary     = 'Spree extension, simple way to select products to highlight.'
  #s.description = 'Add (optional) gem description here'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'jomz, priidikvaikla, joshmcarthur, trahfo'


  s.files        = Dir['CHANGELOG', 'README.md', 'LICENSE', 'lib/**/*', 'app/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency('spree_core', '>= 0.30.1')
end

