class Snippet::Model < Sequel::Model(:snippets)
  plugin :timestamps, update_on_create: true
  plugin :validation_helpers

  def validate
    super
    validates_presence [:title, :body]
  end
end
