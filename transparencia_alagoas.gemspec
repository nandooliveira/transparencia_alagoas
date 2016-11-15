# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'transparencia_alagoas/version'

Gem::Specification.new do |spec|
  spec.name          = "transparencia_alagoas"
  spec.version       = TransparenciaAlagoas::VERSION
  spec.authors       = ["Fernando Oliveira"]
  spec.email         = ["nandooliveira.al@gmail.com"]

  spec.summary       = %q{This Gem help users to consume the Rest API of Portal da Transparencia de Alagoas.}
  spec.description   = %q{This Gem abstract the access to Portal da Transparencia de Alagoas Rest API, making possible to access their services without so much work.}
  spec.homepage      = "https://github.com/nandooliveira/transparencia_alagoas"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
