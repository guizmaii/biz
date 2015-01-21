# Biz
[![Build Status](https://magnum.travis-ci.com/zendesk/biz.svg?token=FPvAz1WHPkjgRp2szEGq&branch=master)](https://magnum.travis-ci.com/zendesk/biz)
[![Code Climate](https://codeclimate.com/repos/54ac74216956802dc40027d6/badges/591180c7fa5da2a8aa3d/gpa.svg)](https://codeclimate.com/repos/54ac74216956802dc40027d6/feed)
[![Test Coverage](https://codeclimate.com/repos/54ac74216956802dc40027d6/badges/591180c7fa5da2a8aa3d/coverage.svg)](https://codeclimate.com/repos/54ac74216956802dc40027d6/feed)

A gem for manipulating time with business hours.

## Features

* Second-level precision on all calculations.
* Accurate handling of Daylight Saving Time.
* Support for business-hours intervals spanning any period of the day, including
  the entirety.
* Support for interday intervals and holidays.
* Thread-safe.

## Anti-features

* No dependency on ActiveSupport.
* No monkey patching.

## Installation

Add this line to your application's Gemfile:

    gem 'biz'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install biz

## Configuration

```ruby
Biz.configure do |config|
  config.business_hours = {
    mon: {'09:00' => '17:00'},
    tue: {'00:00' => '24:00'},
    wed: {'09:00' => '17:00'},
    thu: {'09:00' => '12:00', '13:00' => '17:00'},
    sat: {'10:00' => '14:00'}
  }

  config.holidays = [Date.new(2014, 1, 1), Date.new(2014, 12, 25)]

  config.time_zone = 'America/Los_Angeles'
end
```

If global configuration isn't your thing, configure an instance instead:

```ruby
Biz::Schedule.new do |config|
  # ...
end
```

## Usage

```ruby
# Find the time an amount of business time *before* a specified starting time
Biz.time(30, :minutes).before(Time.utc(2015, 1, 1, 11, 45))

# Find the time an amount of business time *after* a specified starting time
Biz.time(2, :hours).after(Time.utc(2015, 12, 25, 9, 30))

# Find the amount of business time between two times
Biz.within(Time.utc(2015, 3, 7), Time.utc(2015, 3, 14)).in_seconds

# Determine if a time is in business hours
Biz.business_hours?(Time.utc(2015, 1, 10, 9))
```

## Contributing

Pull requests are welcome, but consider asking for a feature or bug fix first
through the issue tracker. When contributing code, please squash sloppy commits
aggressively and follow [Tim Pope's guidelines](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html)
for commit messages.

There are a number of ways to get started after cloning the repository.

To set up your environment:

    script/bootstrap

To run the spec suite:

    script/spec

To open a console with the gem and sample schedule loaded:

    script/console
