RSpec::Expectations.configuration.on_potential_false_positives = :nothing

RSpec.configure do |config|
  config.disable_monkey_patching!
end
