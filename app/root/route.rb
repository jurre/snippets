require "app/base/route"
require "app/root/representer"

module Root
  class Route < Base::Route
    get "/" do
      OpenStruct.new.extend(Representer).to_json
    end
  end
end
