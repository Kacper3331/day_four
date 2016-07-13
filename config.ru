require "bundler/setup"

require_relative "./store"

use Rack::MethodOverride

run Store::App.new
