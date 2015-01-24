require "app/base/route"
require "app/snippet/representer"
require "app/snippet/collection"

module Snippet
  class Route < Base::Route
    get "/snippets" do
      Snippet::Collection.all.extend(Representer::Collection).to_json
    end
  end
end
