# Trikeapps

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/trikeapps`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'trikeapps'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install trikeapps

## Usage
Please check the test script to understand more on the supporting functions for each module classes. This is a part of Trike challenge (https://github.com/tricycle/trike-programming-language-test)

### Using String Demystifier

```ruby
@string = Trikeapps::StringDemystifier.new "!SSWSWSKCOR !OTNAAAWAA!"
@string..demystify
```

### Using Equation Guesser

```ruby
@string = Trikeapps::EquationGuesser.new([1,2,3,4],9)
@string.guess(20)
```

### Using Elixir String Reverse

```ruby
@string = Trikeapps::Elixir.new
@string.stringreverse
```

## Testing
For running the rspec tests, first clone this repository and from inside the directory run the command :

    $ rake test

During the rake test to check the elixir script enter the string "t r i k e" when prompted in rspec

You can also test the script by using bundle console and manually testing each class as below

```console
bundle console

@string = Trikeapps::StringDemystifier.new "!SSWSWSKCOR !OTNAAAWAA!"
@string..demystify
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/trikeapps. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

