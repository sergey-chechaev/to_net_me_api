module ToNetMeApi
  # API метод namespace (такие как `users` или `search`).
  # 
  # Включает в себя два модуля `Resolvable` и `Resolver` 
  # которые вызывают методы api с помощью `Resolver#call_method`.
  # также класс содержит список всех объектов api.2net.me.
  class Namespace
    include Resolvable
    include Resolver
    
    # создает и вызывает `ToNetMeApi::Method` используя `ToNetMeApi::Resolver#call_method`.
    def method_missing(*args, &block)
      call_method(args, &block)
    end
    
    class << self
      # Массив всех объектов api.2net.me.
      # 
      # Загрузка файла `namespaces.yml` .
      # @return [Array] An array of strings
      def names
        if @names.nil?
          filename = File.expand_path('../namespaces.yml', __FILE__)
          @names   = YAML.load_file(filename)
        end
        
        @names
      end
      
      # Проверяет есть ли такой объект у api.2net.me?
      # @param [String, Symbol] name
      def exists?(name)
        names.include?(name.to_s)
      end
    end
  end
end
