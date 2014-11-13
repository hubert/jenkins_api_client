guard :rspec, cmd: 'rspec' do
  watch(%r{^spec/unit_tests/.+_spec\.rb$})
  watch(%r{^lib/jenkins_api_client/(.+)\.rb$})     { |m| "spec/unit_tests/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end
