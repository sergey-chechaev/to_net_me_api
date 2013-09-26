module ToNetMeApi
	# Генерация модуля конфигураци 
	#
	# ToNetMeApi::Configuration 
	module Configuration
		#доступные опции для конфигурации
    OPTION_NAMES = [
      :api_core,
    ]

    attr_accessor *OPTION_NAMES

    # адрес api по умолчанию
    DAFAULT_API_ADDRESS = 'http://api.2net.me/'

    # Можно задавать конфигурацию для гема так:
    # ToNetMeApi.configure {|config| config.api_core='http://sandbox.api.2net.me/'}

    def  configure
    	yield self if block_given?
    	self
    end

    #установка всех конфигураций в дефолтное значение
    def reset
    	@api_core = DAFAULT_API_ADDRESS
    end
	end
end