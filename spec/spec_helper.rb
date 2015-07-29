$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rake_report'
require 'json-schema'

RSpec::Matchers.define :match_schema do |schema|
  match do |testData|
    schema_directory = "#{Dir.pwd}/spec/schemas"
    schema_path = "#{schema_directory}/#{schema}.json"
    JSON::Validator.validate!(schema_path, testData, strict: true)
  end
end
