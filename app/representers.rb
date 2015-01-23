require "roar/representer/json/hal"

module Representer
  module Base
    def self.included(base)
      base.include(Roar::Representer::JSON::HAL)
    end

    def link_to(endpoint)
      "#{ENV["BASE_URL"]}#{endpoint}"
    end
  end

  autoload :Root, "app/representers/root"
end
