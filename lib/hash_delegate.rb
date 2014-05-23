$:.push File.expand_path('../', __FILE__)
require "hash_delegate/version"
require "hash_delegate/accessor"
require "active_support/all"

module HashDelegate
  def hash_delegate(*args)
    options = args.extract_options!
    accessor = Accessor.new self

    args.each do |key|
      accessor.define_getter key, options[:to]
      accessor.define_setter key, options[:to]
    end
  end
end
