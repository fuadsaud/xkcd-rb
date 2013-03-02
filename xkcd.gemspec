lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xkcd/version'

Gem::Specification.new do |gem|
  gem.name          = "xkcd"
  gem.version       = Xkcd::VERSION
  gem.authors       = ["Fuad Saud"]
  gem.email         = ["fuadksd@gmail.com"]
  gem.description   = "Wrapper for the xkcd.com API"
  gem.summary       = "Write a gem summary"
  gem.homepage      = "http://github.com/fuadsaud/xkcd-rb"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "httparty"

  gem.add_development_dependency "vcr"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "webmock"
end
