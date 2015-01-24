require "app/base/representer"

module Snippet
  module Representer
    include Base::Representer

    property :title
    property :body

    link(:self) { "/snippets/#{id}" }
  end

  module Representer::Collection
    include Base::Representer

    property :count
    collection :snippets, extend: Representer, embedded: true

    link(:self) { "/snippets" }
  end
end
