require "spec_helper"

describe "Create Snippet" do
  describe "POST /snippet" do
    it "is included in the API index" do
      get "/"
      expect(last_json_body["_links"]).to include(
        "snippet" => {
          "href" => "/snippet"
        }
      )
    end

    it "creates a new snippet" do
      snippet_params = {
        title: "Kill everything on a port",
        body: %Q(
        function driveby() {
          lsof -i tcp:$1 | awk 'NR!=1 {print $2}' | xargs kill
          printf "Killed everything on port $1\n"
        })
      }

      post_json "/snippet", snippet_params
      expect(last_response.status).to eq(200)
      expect(Snippet::Model.last.title).to eq(snippet_params[:title])
    end

    it "returns errors when request is invalid" do
      invalid_params = { body: "git pull --rebase origin/<branch>" }

      post_json "/snippet", invalid_params
      expect(last_response.status).to eq(422)
      expect(last_json_body).to eq({ "title" => ["is not present"] })
    end
  end
end
