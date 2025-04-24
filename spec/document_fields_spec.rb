# frozen_string_literal: true

require "helper"

RSpec.shared_examples "a failure result" do
  it { expect { subject }.to raise_error(PandaDoc::FailureResult) }
end

RSpec.describe PandaDoc::DocumentFields do
  let(:failed_response) { double(success?: false, body: Hash.new) }
  let(:successful_response) { double(success?: true, body: body) }
  let(:document_uuid) { "DOCUMENT_UUID" }
  let(:document_fields_body) do
    {
      "fields": [
        document_field_body
      ]
    }
  end
  let(:document_field_body) do
    {
      "uuid": "d6948f39-612a-4626-a439-ca9e0cbbda7c",
      "name": "Text",
      "title": "",
      "value": "",
      "assigned_to": {
        "id": "",
        "first_name": "",
        "last_name": "",
        "email": "",
        "phone": "",
        "recipient_type": nil,
        "has_completed": false,
        "signing_order": nil,
        "delivery_methods": {},
        "redirect": {},
        "type": "recipient"
      },
      "field_id": "text_d6948f39-612a-4626-a439-ca9e0cbbda7c",
      "type": "text",
      "settings": {
        "required": true,
        "placeholder": "Enter value",
        "masked": false,
        "multiline": true
      },
      "layout": {
        "page": 1,
        "position": {
          "offset_x": "1",
          "offset_y": "1",
          "anchor_point": "topleft"
        },
        "style": {
          "width": 1,
          "height": 1
        }
      },
      "merge_field": nil
    }
  end

  describe ".create" do
    subject { described_class.create(document_uuid, name: "Foo") }

    before do
      allow(PandaDoc::ApiClient).to receive(:request)
        .with(:post, "/documents/#{document_uuid}/fields", name: "Foo")
        .and_return(response)
    end

    context "with failed response" do
      let(:response) { failed_response }

      it_behaves_like "a failure result"
    end

    context "with successful response" do
      let(:response) { successful_response }
      let(:body) { document_fields_body }

      it "returns an array of documents" do
        expect(subject.fields).to all(be_a(PandaDoc::Objects::DocumentField))
      end

      it "returns results as an array of documents" do
        expect(subject.fields).to all(be_a(PandaDoc::Objects::DocumentField))
      end

      it "behaves like an array of document object interfaces" do
        expect(subject.fields.first).to respond_to(*PandaDoc::Objects::DocumentField.attribute_names)
      end
    end
  end
end
