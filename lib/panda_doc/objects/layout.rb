# frozen_string_literal: true

module PandaDoc
  module Objects
    class Layout < Base
      attribute :page, Types::Integer
      attribute :position, Objects::Position
    end
  end
end

