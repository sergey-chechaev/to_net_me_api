# require 'httparty'
module ToNetMeApi
  # Модуль обрабатывает запросы к API 2et.me и возвращает HTTParty объект .
  module API
      
    class << self
 	  
			def call(attrs,options={},auth_key = nil)
				@auth = {:auth_key => auth_key}				
			  options.merge!(@auth)
			  HTTParty.get('http://api.2net.me/'+attrs,:query => options)
			end
			
    end
  end

end

