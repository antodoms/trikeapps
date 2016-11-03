# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'trikeapps/version'

Gem::Specification.new do |spec|
  spec.name          = "trikeapps"
  spec.version       = Trikeapps::VERSION
  spec.authors       = ["antodoms"]
  spec.email         = ["antodoms@gmail.com"]

  spec.summary       = %q{Coding challenge Trike}
  spec.description   = %q{String Munging and Number Wrangling}
  spec.homepage      = "https://github.com/antodoms/trikeapps"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.


  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", '>=1.13.3'
  spec.add_development_dependency "rake", '>=11.3.0'
  spec.add_development_dependency "rspec", '>=3.5.0'
  spec.add_development_dependency "rspec-nc", '>=0.3.0'
  spec.add_development_dependency "guard", '>=2.14.0'
  spec.add_development_dependency "guard-rspec", '>=4.7.3'
  spec.add_development_dependency "pry", '>=0.10.4'
  spec.add_development_dependency "pry-remote", '>=0.1.8'
  spec.add_development_dependency "pry-nav", '>=0.2.4'
end
