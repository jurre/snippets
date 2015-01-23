require "json"

module Snippets::Routes
  class Base < Sinatra::Application
    before do
      content_type "application/hal+json"
      headers "Access-Control-Allow-Origin" => "*",
        "Access-Control-Allow-Methods" => %w(OPTIONS GET POST PATCH PUT DELETE),
        "Access-Control-Allow-Headers" => %w(Content-Type X-Authorization X-Requested-With),
        "Allow" => %w(OPTIONS GET POST PATCH PUT DELETE)
    end

    options "*" do
      halt 200
    end

    set :protection, false
  end
end
