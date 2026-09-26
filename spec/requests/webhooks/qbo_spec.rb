require 'swagger_helper'

RSpec.describe 'QBO Webhooks API', type: :request do
  path '/webhooks/qbo' do
    post 'Receives incoming QuickBooks Online webhook notifications' do
      tags 'Webhooks'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :'intuit-signature', in: :header, type: :string, required: true, description: 'Base64 encoded HMAC SHA256 signature'
      parameter name: :payload, in: :body, schema: {
        type: :object,
        properties: {
          eventNotifications: {
            type: :array,
            items: {
              type: :object,
              properties: {
                realmId: { type: :string },
                dataChangeEvent: {
                  type: :object,
                  properties: {
                    dataChangeEventDetail: {
                      type: :array,
                      items: {
                        type: :object,
                        properties: {
                          id: { type: :string, example: '142' },
                          name: { type: :string, example: 'Invoice' },
                          operation: { type: :string, example: 'Create' },
                          lastUpdated: { type: :string, example: '2026-09-25T12:00:00Z' }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }

      response '200', 'webhook processed and enqueued' do
        let(:token) { 'secret_verifier_token' }
        let(:body_json) do
          {
            eventNotifications: [
              {
                realmId: '123456789',
                dataChangeEvent: {
                  dataChangeEventDetail: [
                    { id: '101', name: 'Invoice', operation: 'Create', lastUpdated: '2026-09-25T12:00:00Z' }
                  ]
                }
              }
            ]
          }.to_json
        end

        let(:'intuit-signature') { OpenSSL::HMAC.base64digest('SHA256', token, body_json) }
        let(:payload) { JSON.parse(body_json) }

        before do
          allow(Rails.application.credentials).to receive(:dig).with(:qbo, :webhook_verifier_token).and_return(token)
          allow(QboCredential).to receive(:find_by).and_return(double('Credential'))
          allow(Qbo::SyncJob).to receive(:perform_async).and_return(true)
        end

        run_test!
      end
    end
  end
end