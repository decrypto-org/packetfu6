require 'rake'
require './lib/packetfu/version'

Gem::Specification.new do |s|
  s.name        = 'packetfu6'
  s.version     = PacketFu::VERSION
  s.authors     = ['Dimitris Grigoriou','Tod Beardsley', 'Jonathan Claudius']
  s.email       = ['dimitris.riou@gmail.com', 'todb@packetfu.com', 'claudijd@yahoo.com']
  s.summary     = 'PacketFu6 is a mid-level packet manipulation library.'
  s.homepage    = 'https://github.com/decrypto-org/packetfu6'
  s.description = %q{
    PacketFu6 is a mid-level packet manipulation library for Ruby. With
    it, users can read, parse, and write network packets with the level of
    ease and fun they expect from Ruby.
  }
  s.files       = `git ls-files`.split($/)
  s.license     = 'BSD'
  s.required_ruby_version = '>= 2.1.0'
  s.add_dependency('pcaprub')
  s.add_development_dependency('rake')
  s.add_development_dependency('rspec')
  s.add_development_dependency('rspec-its')
  s.add_development_dependency('sdoc')
  s.add_development_dependency('pry')
  s.add_development_dependency('coveralls')


  s.extra_rdoc_files  = %w[.document README.md]
  s.test_files        = (s.files & (Dir['spec/**/*_spec.rb'] + Dir['test/test_*.rb']) )
  s.rubyforge_project = 'packetfu'

end
