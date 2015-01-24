require "spec_helper"
require "app/snippet/model"

describe Snippet::Model do
  describe "validations" do
    it "is not valid without a body and title" do
      expect(Snippet::Model.new.valid?).to eq(false)
    end

    it "is valid with a body and title" do
      expect(Snippet::Model.new(title: "yep", body: "ok!").valid?).to eq(true)
    end
  end
end
