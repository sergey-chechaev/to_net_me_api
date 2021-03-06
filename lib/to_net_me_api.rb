require 'httparty'
require 'yaml'
require 'hashie'

require 'to_net_me_api/version'
require 'to_net_me_api/configuration'
require 'to_net_me_api/api'
require 'to_net_me_api/resolver'
require 'to_net_me_api/resolvable'
require 'to_net_me_api/client'
require 'to_net_me_api/namespace'
require 'to_net_me_api/method'
require 'to_net_me_api/error'
require 'to_net_me_api/result'



# Main module.
module ToNetMeApi
  extend ToNetMeApi::Configuration
  
  class << self
    # Creates a short alias `TNM` for `ToNetMeApi` module.
    def register_alias
      Object.const_set(:TNM, ToNetMeApi)
    end
    
    # Removes the `TNM` alias.
    def unregister_alias
      Object.send(:remove_const, :TNM) if defined?(TNM)
    end
  end
end