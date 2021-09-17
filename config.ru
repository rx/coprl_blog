# This file is used by Rack-based servers to start the application.

require_relative "config/environment"
require 'coprl'
use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [:get, :blog_post, :put, :patch, :delete, :options, :head]
  end
end
use Coprl::Presenters::Api::App
run Rails.application
Rails.application.load_server
