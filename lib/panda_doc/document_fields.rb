# frozen_string_literal: true

module PandaDoc
  module DocumentFields
    extend self

    def create(document_uuid, **data)
      respond(
        ApiClient.request(:post, "/documents/#{document_uuid}/fields", **data),
        type: :document_fields_list
      )
    end

    private

    def respond(response, type: :document)
      failure(response)

      SuccessResult.new(
        ResponseFactory.build(type).new(response.body)
      )
    end

    def stream(response)
      failure(response)

      SuccessResult.new(response)
    end

    def failure(response)
      raise FailureResult.new(response) unless response.success?
    end
  end
end
