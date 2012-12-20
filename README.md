# Vapor

Vapor grants you an easy and straightforward access to Steam info.
## Installation

Add this line to your application's Gemfile:

    gem 'vapor'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install vapor

## Usage

```ruby
Vapor::API.key = "MYSTEAMAPI"
Vapor::User.new('pedronascimento').games
#List of games
```

## Features/Problems

* It doesn't get lots of info, just the ones I need for now.
* It relies on the XML output on Steam, which is not reliable at all.
* It is way simpler than steam-condenser.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
