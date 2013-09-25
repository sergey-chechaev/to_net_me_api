module ToNetMeApi

  module Resolvable
    attr_reader :name
    
    # инициализация объекта и метода api.2net.me
    # @param [String] name The name of this resolvable.
    # @option options [Hashie::Mash] :resolver A mash holding information about the previous resolver.
    def initialize(name, options = {})
      @name = name.to_s
      @previous_resolver = options.delete(:resolver)
    end
    
    # Returns the auth_key from the previous resolver.
    # @return [String] A auth_key.
    def auth_key
      @previous_resolver.auth_key
    end
  end
end
