require 'capybara/rspec'

Capybara.server = :puma, { Silent: true }

RSpec.configure do |config|
  config.include Capybara::DSL
end
