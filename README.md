# Groupwise

Wrapper for Groupwise SOAP web services.  Currently only targets Groupwise 2012 or higher.

Currently, only authentication and free/busy lookup is implemented.

## Installation

Add this line to your application's Gemfile:

    gem 'groupwise'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install groupwise

Create a new [Trusted Application](https://www.novell.com/documentation/groupwise2012/gw2012_guide_admin/data/ake1tw1.html) on your Groupwise server. 

## Testing

Rename groupwise_config.yml.sample to groupwise_config.yml and update it to match your groupwise setup prior to launching the specs.

## Contributing

1. Fork it ( https://github.com/cschiewek/groupwise/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
