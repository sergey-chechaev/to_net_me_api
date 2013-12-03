module ToNetMeApi
  # Модуль обрабатывает запросы к API 2et.me и возвращает HTTParty объект.
  module API
      
    class << self
    
      def set_api_core
        unless ToNetMeApi.api_core
          ToNetMeApi.set_api_core
        else
          ToNetMeApi.api_core
        end
      end

      def set_http_verb
        unless ToNetMeApi.http_verb
          ToNetMeApi.set_http_verb
        else
          ToNetMeApi.http_verb
        end
      end

      def call(attrs,options={},auth_key = nil)
        # установка http глагола по умолчанию
        set_http_verb

        @auth = {:auth_key => auth_key}
        options.merge!(@auth)
        if ToNetMeApi.http_verb == :post 
          HTTParty.post(set_api_core+attrs, :body => options)
        else
          HTTParty.get(set_api_core+attrs,:query => options)
        end
      end
    end
  end

end

