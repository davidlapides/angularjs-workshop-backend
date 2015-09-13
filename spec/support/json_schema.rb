JSON::Validator.schema_reader = JSON::Schema::Reader.new(accept_uri: true, accept_file: true)

RSpec::Matchers.define :match_json_schema do |schema, opts = {}|
  schema_directory = "#{Dir.pwd}/spec/support/schemas"
  schema_path = "#{schema_directory}/#{schema}.json"

  opts.merge! validate_schema: true

  match do |json|
    JSON::Validator.validate(schema_path, json, opts)
  end

  failure_message do |json|
    JSON::Validator.fully_validate(schema_path, json, opts).join("\n")
  end
end
