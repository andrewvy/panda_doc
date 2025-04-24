# frozen_string_literal: true

module PandaDoc
  module Objects
    class Position < Base
      attribute :offset_x, Types::String
      attribute :offset_y, Types::String
      attribute :anchor_point, Types::String
    end
  end
end


