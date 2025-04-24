module PandaDoc
  module Objects
    class DocumentField < Base
      attribute :uuid, Types::String
      attribute :name, Types::String
      attribute :title, Types::String
      attribute :value, Types::String

      attribute :field_id, Types::String
      attribute :type, Types::String

      attribute :layout, Objects::Layout
      attribute? :merge_field, Types::String.optional
    end
  end
end

