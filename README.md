## to_net_me_api [![Gem Version](https://badge.fury.io/rb/to_net_me_api.png)](http://badge.fury.io/rb/to_net_me_api)





`to_net_me_api` - ruby-адаптер для api.2net.me. Он позволяет вызывать методы API.



## Установка



``` ruby

# Gemfile

gem 'to_net_me_api'

```



или просто



``` sh

$ gem install to_net_me_api

```



## Использование



### Вызов методов



``` ruby
require 'to_net_me_api' #=> true

# создаем клиент
@to_net_me = ToNetMeApi::Client.new('auth_key')
# и вызываем методы API
groups = @to_net_me.search.groups(:name=>'велосипеды',:vk=>'true')

# методы возвращают объект HTTParty 
# в котором находится ответ от сервека api.2net.me
groups.parsed_response #=> {"message"=>{"vk"=>[7389, {"gid"=>52734067, "name"=>"Велосипеды"....

# в ruby принято использовать snake_case в названиях методов,
# поэтому search.groupsById становится search.groups_by_id
@to_net_me.search.groups_by_id(:gids=>'37856556',:soc=>'vk')

# если API 2net.me ожидает получить параметр в виде списка,
# разделенного запятыми, то его можно передать массивом
@to_net_me.search.groups_by_id(:gids=>['2net_me',37856556,38019449],:soc=>'vk')
```

### Обработка капчи vkontakte
``` ruby
# с помощью методов ToNetMeApi::Error.captcha_img и ToNetMeApi::Error.captcha_sid
# можно обработать ситуацию когда vk вернул нам 14 код
# пример

to_net_me = ToNetMeApi::Client.new(current_user.auth_key)
puts to_net_me.authorized?.inspect
begin
  vk = to_net_me.test.captcha(:vk=>true)
  puts vk.inspect
rescue ToNetMeApi::Error => e
  if e.error_code == 14
  	# показываем юзеру картинку, URL которой
    # можно получить методом e.captcha_img,
    # и после этого снова вызываем метод:
    vk = to_net_me.test.captcha(:vk=>true,:captcha_sid=>"тут должен быть sid",:captcha_key=>"тут должна быть капча с картинки")
    puts vk.inspect
  else
     puts "Ошибка: " + e.error_code.to_s
  end
```



### Конфигурация
``` ruby
# для смены адреса запроса api, http глагола (по умолчанию post)
# создайте файл конфигурации to_net_me_api.rb в папке config/initializers 
# и укажите там следующее 
ToNetMeApi.configure do |config|
  config.api_core='http://sandbox.api.2net.me/'
  config.http_verb=:post
end
```

### Документация

Документация к методам api находится [по адресу](http://api.2net.me/index/info).
Так же можно попробовать api через web-интерфейс [тут](http://api.2net.me/index).

