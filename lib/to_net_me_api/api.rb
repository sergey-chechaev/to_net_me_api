require 'httparty'
module ToNetMeApi
  # Модуль обрабатывает запросы к API 2et.me и возвращает HTTParty объект .
  module API
      

    class << self
 	  	
    	def set_api_core
        unless ToNetMeApi.api_core
          ToNetMeApi.reset
        else
          ToNetMeApi.api_core
        end
      end

			def call(attrs,options={},auth_key = nil)
				@auth = {:auth_key => auth_key}				
			  options.merge!(@auth)
			  HTTParty.get(set_api_core+attrs,:query => options)
			end
			
    end
  end

end

