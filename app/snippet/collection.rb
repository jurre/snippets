require "app/snippet/model"

class Snippet::Collection
  attr_reader :count, :snippets

  def initialize(collection)
    @count = collection.count
    @snippets = collection
  end

  def self.all
    new(Snippet::Model.all)
  end
end
