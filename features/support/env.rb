require 'capybara/cucumber'
require 'webdrivers'

Capybara.register_driver :docker_chrome_headless do |app|
  browser_options = ::Selenium::WebDriver::Chrome::Options.new
  browser_options.args << '--headless'
  browser_options.args << '--no-sandbox'
  browser_options.args << '--disable-gpu'
  browser_options.args << '--window-size=1920,1080'
  browser_options.args << '--lang=en-US'
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: browser_options
  )
end

Capybara.register_driver :docker_chrome do |app|
  browser_options = ::Selenium::WebDriver::Chrome::Options.new
  browser_options.args << '--no-sandbox'
  browser_options.args << '--disable-gpu'
  browser_options.args << '--window-size=1920,1080'
  browser_options.args << '--lang=en-US'
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: browser_options
  )
end

def driver
  is_no_headless = ENV["CHROME_NO_HEADLESS"]
  if is_no_headless then :docker_chrome else :docker_chrome_headless end 
end

Capybara.configure do |config|
  config.default_driver    = driver()
  config.javascript_driver = driver()

  config.app               = nil   
  config.run_server        = false
end
