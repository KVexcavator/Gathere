RSpec.configure do |config|
  config.before(:each, type: :system) do
    # provided by Capybara to simulate a browser DOM tree without JavaScript
    driven_by :rack_test
  end
end
