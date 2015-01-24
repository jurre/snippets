require "spec_helper"
require "app/snippet/representer"
require "app/snippet/collection"

describe Snippet::Representer::Collection do
  it "serializes correctly" do
    snippets = []
    2.times do |i|
      snippets << double(id: i, title: "snippet #{i}", body: "test")
    end

    json = Snippet::Collection.new(snippets).
      extend(Snippet::Representer::Collection).to_json

    expect(json).to eq(
      {
        count: 2,
        _embedded: {
          snippets: [
            {
              title: "snippet 0",
              body: "test",
              _links: {
                self: { href: "/snippets/0" }
              }
            },
            {
              title: "snippet 1",
              body: "test",
              _links: {
                self: { href: "/snippets/1" }
              }
            }
          ]
        },
        _links: {
          self: { href: "/snippets" }
        }
      }.to_json
    )
  end
end
