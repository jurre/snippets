module Representer::Root
  include Representer::Base

  link(:self) { link_to "/" }
end
