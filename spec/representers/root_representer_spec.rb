require "spec_helper"

describe Representer::Root do
  it "serializes correctly" do
    represented = OpenStruct.new.extend(Representer::Root).to_hash

    expect(represented).to eq({
      "links" => {
        "self" => {
          href: "#{ENV["BASE_URL"]}/"
        },
      }
    })
  end
end
