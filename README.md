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
@to_net_me.search.groups_by_id(:gids=>'2net_me,37856556,38019449',:soc=>'vk')
```
### Документация

Документация к методам api находится [по адресу](http://api.2net.me/index/info).
Так же можно попробовать api через web-интерфейс [тут](http://api.2net.me/index).

