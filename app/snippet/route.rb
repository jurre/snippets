require "app/base/route"
require "app/snippet/representer"
require "app/snippet/collection"

module Snippet
  class Route < Base::Route
    get "/snippets" do
      Collection.all.extend(Representer::Collection).to_json
    end

    post "/snippet" do
      snippet = Model.new.extend(Representer)
      snippet.from_json(request_body)
      if snippet.valid?
        snippet.save.to_json
      else
        status 422
        snippet.errors.to_json
      end
    end
  end
end
