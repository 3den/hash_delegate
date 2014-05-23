# HashDelegate

Dynamically add methods that delegate to key/values of a hash.

## Installation

Add this line to your application's Gemfile:

    gem 'hash_delegate'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hash_delegate

## Usage

```ruby
class Something
  extend HashDelegate
  hash_delegate :size, :color, to: :details

  attr_accessor :details

  def initialize(details={})
    @details = details
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
