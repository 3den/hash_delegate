$:.push File.expand_path('../', __FILE__)
require "hash_delegate/version"
require "active_support/all"

module HashDelegate
  def hash_delegate(*args)
    options = args.extract_options!
    self.class_eval do
      args.each do |key|
        define_method key do
          data = self.send(options[:to]) || {}
          data[key.to_s] || data[key.to_sym]
        end

        define_method "#{key}=" do |value|
          data = self.send(options[:to]) || self.send("#{options[:to]}=", {})
          data[key.to_s] = value
        end
      end
    end
  end
end
