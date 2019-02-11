require 'rspec'

ENV['environment'] ||= 'test'

RSpec.configure do |config|
  config.order = :random
end
