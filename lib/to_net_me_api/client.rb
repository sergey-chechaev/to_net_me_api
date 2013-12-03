module ToNetMeApi
  # Класс, представляющий соединение с api.2net.me. 
  class Client
    include Resolver
    
    # Права доступа и их числовые значения.
    SCOPE = {
      root:                 0,
      admin:                1,
      partner:              2,
      user:   		          3,
      unknown_auth_key:     4, 

    }
    
    # ключ доступа к методам api
    # @return [String]
    attr_reader :auth_key
    # Current user id.
    # @return [Integer]
    attr_reader :user_id
    # время жизни auth_key
    # @return [Time]
    attr_reader :expires_at
    
    # API client.
    # определяем переменные 
    def initialize(auth_key = nil)
      if auth_key.respond_to?(:auth_key) && auth_key.respond_to?(:params)
        # auth_key is an OAuth2::Accessauth_key
        @auth_key    = auth_key.auth_key
        @user_id     = auth_key.params['user_id']
        @expires_at  = Time.at(auth_key.expires_at) unless auth_key.expires_at.nil?
      else
        # если auth_key нет или пришла строка (string)
        @auth_key = auth_key
      end
    end
    
    # Авторизирован пользователь.
    def authorized?
      !@auth_key.nil?
    end
    # текущий http глагол 
    def http_verb
      ToNetMeApi.http_verb
    end

    # текущий адрес api
    def http_path
      ToNetMeApi.api_core
    end

     # Просрочет ключь или нет.
    def expired?
      @expires_at && @expires_at < Time.now
    end
    
    
    # Права доступа для auth_key.
    # @return Symbol  
    def scope
      SCOPE.reject do |access_scope, mask|	
        SCOPE.invert[settings]
      end
    end
    
    # Если вызываемы метод содержется в namespace, создается новый  `VkontakteApi::Namespace` инстанс.
    # `VkontakteApi::Namespace` так же вызывает method_missing для метода объекта Namespace
    # если нет namspace `VkontakteApi::Method` создаеся объект API в который передаются параметры.
    def method_missing(*args, &block)
      if Namespace.exists?(args.first)
        create_namespace(args.first)
      else
        call_method(args, &block)
      end
    end
    
  private
    def settings
      @settings ||= @auth_key[0].gsub(/[^0-9]/,'4').to_i
    end
  end
end

# ToNetMeApi.configure {|config| config.api_core='http://sandbox.api.2net.me/'}
# to_net_me = ToNetMeApi::Client.new('01qw621sa14')
# puts to_net_me.authorized?.inspect
# begin
#   vk = to_net_me.test.captcha(:gids=>'my_bikes',:vk=>1742410)
#   puts vk.inspect
# rescue ToNetMeApi::Error => e
#   if e.error_code == 14
#     puts e.message
#     puts e.error_code
#     puts e.captcha_img
#     vk = to_net_me.search.groupsbyid(:gids=>'my_bikes',:vk=>1742410,:captcha_sid=>"",:captcha_key=>"")
#     # показываем юзеру картинку, URL которой
#     # можно получить методом e.captcha_img,
#     # и после этого снова вызываем метод:
#     # puts vk.inspect
#     # vk.wall.edit(post_id: 12345, message: 'hello world', captcha_sid: e.captcha_sid, captcha_key: params[:captcha])
#   else
#      puts "no 14"
#   end
# end

# begin
#   vk = to_net_me.search.groupsbyid(:gids=>'my_bikes',:vk=>1742410)
#   puts vk.inspect
# rescue ToNetMeApi::Error => e
#   if e.error_code == 14
#     puts e.message
#     puts e.error_code
#     puts e.captcha_img
#     vk = to_net_me.search.groupsbyid(:gids=>'my_bikes',:vk=>1742410,:captcha_sid=>"",:captcha_key=>"")
#     # показываем юзеру картинку, URL которой
#     # можно получить методом e.captcha_img,
#     # и после этого снова вызываем метод:
#     # puts vk.inspect
#     # vk.wall.edit(post_id: 12345, message: 'hello world', captcha_sid: e.captcha_sid, captcha_key: params[:captcha])
#   else
#      puts "no 14"
#   end
# end













