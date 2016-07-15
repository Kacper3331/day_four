require "spec_helper"
require "rack/test"

require_relative "../store"

module AppHelper
  def app
    Store::App
  end
end

RSpec.configure do |config|
  config.include Rack::Test::Methods, type: :request
  config.include AppHelper, type: :request
end
