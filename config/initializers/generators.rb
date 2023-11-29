Rails.application.config.generators do |generate|
  generate.helper false
  generate.javascript_engine false
  generate.orm :active_record, primary_key_type: :uuid
  generate.request_specs false
  generate.routing_specs false
  generate.stylesheets false
  generate.system_tests = nil
  generate.test_framework :rspec
  generate.view_specs false
end
