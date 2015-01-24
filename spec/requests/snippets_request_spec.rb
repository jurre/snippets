require "spec_helper"
require "app/snippet/model"
require "app/snippet/collection"
require "app/snippet/representer"

describe "Snippets" do
  describe "GET /snippets" do
    before(:each) do
      Snippet::Model.create(
        title: "Check it out!",
        body: "```bash\nforeman start -f Procfile.dev\n```"
      )
    end

    it "returns a collection of snippets" do
      get "/snippets"

      expect(last_response.status).to eq(200)
      expect(last_response.body).to eq(
        Snippet::Collection.all.extend(Snippet::Representer::Collection).to_json
      )
    end
  end
end
