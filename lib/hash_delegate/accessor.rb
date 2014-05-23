module HashDelegate
  class Accessor < Struct.new :klass
    def define_getter(key, hash)
      define_delegation key do
        data = self.send(hash) || {}
        data[key.to_s] || data[key.to_sym]
      end
    end

    def define_setter(key, hash)
      define_delegation "#{key}=" do |value|
        self.send(hash) or self.send("#{hash}=", {})
        self.send(hash)[key.to_s] = value
      end
    end

    private

    def define_delegation(name, &block)
      klass.class_eval { define_method name, &block }
    end
  end
end
