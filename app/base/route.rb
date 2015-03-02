require "json"

module Base
  class Route < Sinatra::Application
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

    def request_body
      @request_body ||= begin
                          request.body.rewind
                          request.body.read
                        end
    end
  end
end
