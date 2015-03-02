require "rubygems"
require "bundler"

Bundler.require
$: << File.expand_path("../", __FILE__)
$: << File.expand_path("../lib", __FILE__)

require "dotenv"
Dotenv.load

require "sinatra/base"

libs = Dir[File.expand_path("../lib/**/*.rb", __FILE__)]
libs.each do |lib|
  require lib
end

require "app/root"

module Snippets
  class App < Sinatra::Application
    configure do
      set :database, lambda {
        ENV["DATABASE_URL"] || "postgres://localhost:5432/snippets_#{environment}"
      }
    end

    configure :development, :staging do
      database.loggers << Logger.new(STDOUT)
    end

    use Rack::Deflater
    use Root::Route
  end
end
