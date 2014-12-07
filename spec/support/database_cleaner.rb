 RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with :truncation
  end

  config.before(:each) do
    if Capybara.current_driver == :rack_test
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.start
    else
      DatabaseCleaner.strategy = :truncation
    end
  end

  config.after(:each) do
    ActionMailer::Base.deliveries.clear
    DatabaseCleaner.clean
  end
end
