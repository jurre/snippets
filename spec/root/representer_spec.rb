require "spec_helper"

describe Root::Representer do
  it "serializes correctly" do
    represented = OpenStruct.new.extend(Root::Representer).to_hash

    expect(represented).to eq({
      "_links" => {
        "self" => { href: "#{ENV["BASE_URL"]}/" },
        "snippets" => { href: "#{ENV["BASE_URL"]}/snippets" },
        "snippet" => { href: "#{ENV["BASE_URL"]}/snippet" }
      }
    })
  end
end
