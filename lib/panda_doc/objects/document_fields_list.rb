module PandaDoc
  module Objects
    class DocumentFieldsList < Base
      attribute :fields, Types::Array.of(Objects::DocumentField).default([].freeze)
    end
  end
end


