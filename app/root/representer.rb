require "app/base/representer"
require "app/root"

module Root::Representer
  include Base::Representer

  link(:self) { link_to "/" }
end
