require "app/base/representer"
require "app/root"

module Root::Representer
  include Base::Representer

  link(:self) { link_to "/" }
  link(:snippets) { link_to "/snippets" }
  link(:snippet) { link_to "/snippet" }
end
