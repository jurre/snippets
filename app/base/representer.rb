require "roar/representer/json/hal"

module Base
  module Representer
    def self.included(base)
      base.include(Roar::Representer::JSON::HAL)
    end

    def link_to(endpoint)
      "#{ENV["BASE_URL"]}#{endpoint}"
    end
  end
end
