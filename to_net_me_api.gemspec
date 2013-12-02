# encoding: utf-8
$: << File.expand_path('../lib', __FILE__)
require 'to_net_me_api/version'

Gem::Specification.new do |s|
  s.name        = 'to_net_me_api'
  s.version     = ToNetMeApi::VERSION
  s.authors     = ['Sergey Chechaev']
  s.email       = ['sergey@2net.me']
  s.homepage    = 'https://github.com/sergey-chechaev/to_net_me_api'
  s.summary     = %q{Ruby wrapper for api.2net.me}
  s.description = %q{A transparent wrapper for 2net.me API. Supports ruby-way naming of API methods (without method lists inside) with api request by HTTParty.}
  s.license     = ''
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']
  
  s.required_ruby_version = '>= 2.0.0'
  
  s.add_runtime_dependency 'httparty',                     '~> 0.11'
  s.add_runtime_dependency 'hashie',                       '~> 2.0'
  
end