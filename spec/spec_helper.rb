require "watir-scroll"

RSpec.configure do |spec|
  spec.before(:all) do
    opts = {}
    if ENV['TRAVIS']
      Selenium::WebDriver::Chrome.path = "#{File.dirname(__FILE__)}/../bin/google-chrome"
      opts[:args] = ['no-sandbox']
    end
    @browser = Watir::Browser.new(:chrome, opts)
  end

  spec.after(:all) do
    @browser.quit
  end

  spec.before(:each) do
    @browser.goto "file://#{File.dirname(__FILE__)}/support/test.html"
  end

  def visible?(el)
    @browser.execute_script('return isElementInViewport(arguments[0]);', el)
  end
end
