# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "devise/bootstrap_form/version"

Gem::Specification.new do |spec|
  spec.name          = "devise-bootstrap-form"
  spec.version       = Devise::BootstrapForm::VERSION
  spec.authors       = ["Andrew Fomera", "Larry Reid"]
  spec.email         = ["larry.reid@jadesystems.ca"]

  spec.summary       = "Generates nicer views for Devise that use Bootstrap via the `bootstrap_form` gem."
  spec.description   = <<~DESC
    This gem generates nicer default views styled with Bootstrap via the `bootstrap_form`
    gem, so you have a bit of a better starting point for your app.
  DESC
  spec.homepage      = "https://github.com/lcreid/devise-bootstrap-form"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "bootstrap_form", "~> 4.0.0.alpha1"
  spec.add_dependency "devise"
  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
