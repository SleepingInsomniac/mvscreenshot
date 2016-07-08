# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mvscreenshot/version'

Gem::Specification.new do |spec|
  spec.name          = "mvscreenshot"
  spec.version       = Mvscreenshot::VERSION
  spec.authors       = ["Alex Clink"]
  spec.email         = ["code@alexclink.com"]

  spec.summary       = "Automatically move osx screenshots away from the desktop"
  # spec.description   = "Automatically move osx screenshots away from the desktop"
  spec.homepage      = "https://github.com/SleepingInsomniac/mvscreenshot"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://gems.design.lan'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = Dir['lib/**/*'].concat Dir['bin/**/*']
  # spec.bindir        = "exe"
  spec.executables   = "mvscreenshot"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  
  spec.add_dependency "daemons"
  spec.add_dependency "rb-fsevent"
end
