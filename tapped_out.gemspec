Gem::Specification.new do |s|
  s.name        = 'tapped_out'
  s.version     = '0.0.0'
  s.date        = '2015-11-28'
  s.summary     = 'Tapped out ruby gem'
  s.description = 'A gem which exposes the tapped-out.net API'
  s.authors     = ['Denis Dallinga']
  s.email       = 'denisdallinga@gmail.com'
  s.files       = `git ls-files`.split("\n")
  s.license     = 'MIT'

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'guard-rubocop'
  s.add_development_dependency 'simplecov'
end
