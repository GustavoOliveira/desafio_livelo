require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'rspec'
require 'pry'

APP ||= ENV['APP']
BROWSER ||= ENV['BROWSER'].to_sym
TARGET ||= ENV['TARGET']
ISPARALLELRUNNING ||= ENV['PARALLELRUNNING']

CONFIG_UI = YAML.load_file(File.dirname(__FILE__) +
            "/env/#{APP}/base.yml")

basedomain = CONFIG_UI['basedomain']

port = \
  if TARGET == 'local'
    APP == 'ecommerce' ? ':8180' : ':8380'
  else
    ''
  end

if TARGET == 'prd'
  URL = "https://#{basedomain}#{port}".freeze
else
  URL = "https://#{TARGET}.#{basedomain}#{port}".freeze
end

puts "URL Front: #{URL}"

Capybara.register_driver :chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new(
    args: %w[
      --ignore-ssl-errors
      --ignore-certificate-errors
      --disable-popup-blocking
      --disable-gpu
      --disable-translate
      --start-maximized
      --incognito
      --no-sandbox
      --acceptInsecureCerts=true
      --window-size=1420,835
      --disable-impl-side-painting
      --debug_level=3
    ]
  )
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.read_timeout = 90
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options, http_client: client)
end

Capybara.configure do |config|
  config.default_driver = BROWSER
  config.app_host = URL
end

Capybara.default_max_wait_time = 60
