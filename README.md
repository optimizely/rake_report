# RakeReport

Generates timeline reports of rake runs. Useful for debugging parallelization
and performance issues in complex rake configurations

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rake_report'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rake_report

## Usage

Add the following two lines to the top of your Rakefile:

```ruby
require 'rake_report'
RakeReport.html("rake_report_#{ARGV.join('_').gsub(/:/, '-')}.html")
```

Rake will then output an html file (rake_report_*.html) that includes a Google
DataTable formatted for the Timeline visualization API:

https://developers.google.com/chart/interactive/docs/gallery/timeline#data-format

## Example Output

[![rake_report_test.html](/img/rake_report_test.png)](/img/rake_report_test.htm)

## Contributing

1. Fork it ( https://github.com/optimizely/rake_report/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
